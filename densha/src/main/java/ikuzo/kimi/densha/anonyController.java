package ikuzo.kimi.densha;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.xml.sax.InputSource;


import ikuzo.kimi.densha.dao.anonyBoardDao;
import ikuzo.kimi.densha.util.FileService;
import ikuzo.kimi.densha.util.PageNavigator;
import ikuzo.kimi.densha.vo.anonyBoard;

@Controller
public class anonyController {

	final String uploadPath = "/upload";
	final String saveFolder = "/boardFile";
	
	@Autowired
	anonyBoardDao dao;
	
	//익명게시판, microsoft api 이용해서 감정분석
	@RequestMapping(value = "/anonyboard", method = RequestMethod.GET)
	public String anonyboard( Model model) {
 // 익명게시판
		
		return "anonyboard";
	}

	
	@ResponseBody
	@RequestMapping(value = "/anonyboardRead", method = RequestMethod.POST)
	public String anonyboardRead(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "pages", defaultValue = "20") int pagess,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "searchmethod", defaultValue = "none") String searchmethod, Model model) {

		// 읽어들이기
		int all = dao.listall(search, searchmethod);
		int pages = pagess;
		
		PageNavigator navi = new PageNavigator(pagess, 10, page, all);
		ArrayList<anonyBoard> alist = dao.view(navi.getStartRecord(), pages, search, searchmethod);
		// SQL injection, Script방지
		
		model.addAttribute("board", alist);
		model.addAttribute("navi", navi);
		model.addAttribute("search", search);
		return null;
	}

	
	@ResponseBody
	@RequestMapping(value = "/anonyboardWrite", method = RequestMethod.GET)
	// 쓰기
	public anonyBoard apiserviceXML(anonyBoard board, HttpSession ses, Model model, MultipartFile upload) throws Exception {
		
		String name = (String) ses.getAttribute("name");
		
		
		if (board.getText().length() > 4000) {
			model.addAttribute("error", 1);
			return null;
		}

		String induce = "";

		if (!upload.isEmpty()) { // 파일이 있는 경우
			induce = FileService.saveFile(upload, saveFolder);
			// 저장되어서 파일명이 변경된 상태
			board.setSavefile(induce); // 실제 이름
			board.setOriginalfile(upload.getOriginalFilename());
			// 오리지널 이름
		}

		board.setName(name);
		dao.write(board);
		
		return null;

	}
	
	
	@RequestMapping(value = "/anonyboardReadview", method = RequestMethod.GET)
	// 게시글보기=====================================================
	public String textview(int num, Model model) {
		anonyBoard board = dao.writeview(num);
		if(board == null){
			return "board/view";
		}
	

		if (board.getOriginalfile() != null) { // 파일 있는지 확인
			String fileext = board.getOriginalfile();
			String ext = fileext.substring(board.getOriginalfile().indexOf(".") + 1);
			if (ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("gif") || ext.equalsIgnoreCase("jpge")
					|| ext.equalsIgnoreCase("png")) {
				ext = "img";
			}
			model.addAttribute("ext", ext); // 파일이 있을때만 확장자 겟
			// 이미지의 경우 img로 통일 (img src를 표현)
		}

		// SQL injection, Script방지
		board.setText(board.getText().replaceAll("<", "")); // script
		board.setText(board.getText().replaceAll("--", "")); // sql

		
		model.addAttribute("textview", board);

		return "board/textview";
	}

	@RequestMapping(value = "/anonyboardDelete", method = RequestMethod.POST)
	// 삭제하기
	public String textview(int num, HttpSession ses, Model model) {
		String name = (String) ses.getAttribute("name");
		anonyBoard board = dao.writeview(num);
		int result = dao.delete(num, name);
		// 지우는 부분 보안으로 이름까지 받는다.

		if (board.getSavefile() != null && result == 0) { // delete가 확실한 경우에만 실행
			FileService.deleteFile(saveFolder + "/" + board.getSavefile());
		}

		model.addAttribute("deleteresult", result);

		return "redirect:view";
	}


}
