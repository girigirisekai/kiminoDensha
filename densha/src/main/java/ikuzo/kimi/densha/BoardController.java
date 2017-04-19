package ikuzo.kimi.densha;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import ikuzo.kimi.densha.dao.BoardDAO;
import ikuzo.kimi.densha.util.FileService;
import ikuzo.kimi.densha.vo.Board;

@Controller
@RequestMapping("board")
public class BoardController {

	@Autowired
	BoardDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	// 게시판 관련 상수 선언;
	final int countPerPage = 10; // 한 페이지당 실릴 글의 개수
	final int pagePergroup = 5; // 한눈에 보이는 페이지 개수
	final String uploadPath = "/boardfile";

	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm() {

		return "board/writeForm";
	}
	
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(Board board, HttpSession session, Model model, MultipartFile upload) {

		//MultipartFile 객체의 정보 확인
		
		logger.debug("파일첨부 여부:{}", upload.isEmpty());
		logger.debug("파일명:{}", upload.getOriginalFilename());
		logger.debug("이름:{}", upload.getName());
		logger.debug("종류:{}", upload.getContentType());
		logger.debug("크기:{}", upload.getSize());
		
		//첨부 파일이 있으면 서버의 하드디스크에 파일을 생성하여 복사하기
		if(!upload.isEmpty()){
			String savedFile = FileService.saveFile(upload, uploadPath);
			
			//원래 파일명과 저장된 파일명을 board객체에 담아 DB에 저장
			board.setOriginalfile(upload.getOriginalFilename());
			board.setSavedfile(savedFile);
		}
		
		
		String id = (String) session.getAttribute("id");
		if (id == null) {

			return "redirect:/customer/login";
		}

		board.setId(id);
		dao.insert(board);
		return "redirect:list";
	}
	
	
	
}
