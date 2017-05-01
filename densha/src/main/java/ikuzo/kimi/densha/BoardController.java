package ikuzo.kimi.densha;

import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ikuzo.kimi.densha.dao.BoardDAO;
import ikuzo.kimi.densha.util.FileService;
import ikuzo.kimi.densha.util.PageNavigator;
import ikuzo.kimi.densha.vo.Board;
import ikuzo.kimi.densha.vo.Reply;

/**
 * 
 * @author nurinuri 게시판 컨트롤러
 *
 */

@Controller
/*@RequestMapping("board")*/
public class BoardController {

	@Autowired
	BoardDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	// 게시판 관련 상수 선언;
	final int countPerPage = 10; // 한 페이지당 실릴 글의 개수
	final int pagePerGroup = 5; // 한눈에 보이는 페이지 개수
	final String uploadPath = "/boardfile";

	
	
	 
	/**
	 * 게시판 읽어오기 컨트롤러
	 * 
	 * @param page
	 * @param searchText
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "board", method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "searchText", defaultValue = "") String searchText,
			@RequestParam(value = "type", defaultValue = "notice") String type, Model model) {

		int totalRecordsCount = dao.getTotal(searchText, type);

		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, totalRecordsCount);
		logger.debug("페이지네비게이터:{}", navi);
		ArrayList<Board> boardlist = dao.list(navi.getStartRecord(), countPerPage, searchText, type);
		model.addAttribute("boardlist", boardlist);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		model.addAttribute("type", type);

		logger.debug("현재페이지 : {}", page);
		logger.debug("검색어 : {}", searchText);
		logger.debug("타입:{}", type);

		// int page = 0;
		//
		// if (total % 10 == 0) {
		// page = total / 10;
		// } else {
		// page = (total / 10) + 1;
		// }
		//
		model.addAttribute("page", page);
		return "board/list";
	}

	/**
	 * 게시판 글쓰기 컨트롤러
	 * 
	 * @return
	 */
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm(String type, Model model) {
		logger.debug("글쓰기 타입: {}", type);
		model.addAttribute("type", type);
		if(type.equals("freeboard")){
			return "board/writeForm_Freeboard";
		}else if(type.equals("qna")){
			return "board/writeForm_QnA";
		}else if(type.equals("notice")){
			return "board/writeForm_Notice";
		}
		return "";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(Board board, HttpSession session, Model model, MultipartFile upload) {

		// MultipartFile 객체의 정보 확인
		logger.debug("파일첨부 안 한 여부:{}", upload.isEmpty());
		logger.debug("파일명:{}", upload.getOriginalFilename());
		logger.debug("이름:{}", upload.getName());
		logger.debug("종류:{}", upload.getContentType());
		logger.debug("크기:{}", upload.getSize());

		// 첨부 파일이 있으면 서버의 하드디스크에 파일을 생성하여 복사하기
		if (!upload.isEmpty()) {
			logger.debug("업로드할 파일 존재");
			String savedFile = FileService.saveFile(upload, uploadPath);

			// 원래 파일명과 저장된 파일명을 board객체에 담아 DB에 저장
			board.setOriginalfile(upload.getOriginalFilename());
			board.setSavedfile(savedFile);
		}
		
		// 로그인 한 사람에 한에 글을 쓸 수 있게 제한해놓음
		String loginID = (String) session.getAttribute("loginId");
			
		if (loginID == null) {
			logger.debug("잘못된 접근- 아이디 존재x");
			return "redirect:board";
		}
			
		// 게시판 보드에 아이디 세팅해주기
		board.setId(loginID);
		logger.debug("DB에 저장 실행");
		// 게시판에 글 쓰는 dao 호출
		dao.insert(board);
		logger.debug("글쓰기 성공");
		return "redirect:board";
	}

	/**
	 * 게시판 글 클릭시 읽을 수 있는 read page로 이동
	 * 
	 * @param boardnum
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String read(Board board, Model model, int boardnum, HttpSession session) {
		
		Board b = null;
		logger.debug("읽어온 게시판 번호: {}", boardnum);
		if(boardnum!=0){
			board=dao.select(boardnum);
		}
		logger.debug("읽어온 게시판: {}",board);
		
		board.setHits(board.getHits()+1);
		dao.update(board);
		logger.debug("힛트다 히트:{} ",board.getHits());
		
		//QNA와 아닌 글로 분기 나누어줌
		if(board.getType().equals("qna")){
			if( session.getAttribute("checkedBoardnum") == null){
				return "redirect:board";
			}
			int checkedNum = (int) session.getAttribute("checkedBoardnum");
			if(board.getBoardnum() == checkedNum){
				
				b = dao.select(board.getBoardnum());
				if(!(b.getType().equals("qna")) || b == null){
					return "redirect:board";
				}
			}else{
				return "redirect:board";
			}
			
		}
		else{
			b = dao.select(board.getBoardnum());
			if((b.getType().equals("qna")) || b == null){
				return "redirect:board";
			}
		}

		session.removeAttribute("checkedBoardnum");
		model.addAttribute("board", b);

		ArrayList<Reply> rlist= dao.selectReply(board.getBoardnum());
		logger.debug("리플:{}", rlist);
		model.addAttribute("rlist", rlist);
		
		return "board/read";
	}

	/**
	 * 글 삭제하는 곳
	 * 
	 * @param boardnum
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int boardnum, HttpSession session) {

		// 세션에서 사용자 아이디 읽기
		String loginID = (String) session.getAttribute("loginId");
		
		// 해당 글에 첨부된 파일이 있으면 삭제
		Board board = dao.select(boardnum);

		if (loginID == null) {
			return "redirect:board";
		}

		if (loginID.equals(board.getId()) || loginID.equals("admin")) {
			if (board.getSavedfile() == null) {
				dao.delete(loginID, boardnum);
			} 
			else {
				String fullpath = uploadPath + "/" + board.getSavedfile();
				boolean check = FileService.deleteFile(fullpath);
				dao.delete(loginID, boardnum);
			}
		}
		// 글번호와 로그인 아이디를 전달해서 DB글 삭제
		// 글목록 보기로 리다이렉트;
		return "redirect:board";
	}

	/**
	 * 글 수정하기 버튼 눌렀을때!
	 * 
	 * @param model
	 * @param boardnum
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(Model model, int boardnum, HttpSession session) {
		logger.debug("수정 버튼 눌림");

		logger.debug("수정될 게시판 글 번호: {}", boardnum);
		// 세션에서 아이디 받아오기
		String loginId = (String) session.getAttribute("loginId");
		Board board = dao.select(boardnum);

		// 로그인 한 아이디와 보드의 아이디의 일치여부를 미리 확인
		if(!loginId.equals(board.getId())){
			return "redirect:list";
		}
		model.addAttribute("board", board);
		logger.debug("수정할 게시판 글: {}", board);
		return "board/update";
	}

	/**
	 * 폼에서 수정할 아이디를 다시 보내줌
	 * 
	 * @param model
	 * @param board
	 * @param session
	 * @param upload
	 * @return
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(Model model, Board board, HttpSession session, MultipartFile upload) {
		logger.debug("수정 실행");
		String loginId = (String) session.getAttribute("loginId");
		
		
		Board b = dao.select(board.getBoardnum());
		logger.debug("불러온 게시판글:{}", b);
		logger.debug("게시판 수정 글:{}",board);
		
		if (!b.getId().equals(loginId)) {
			logger.debug("아이디 불일치");
			return "redirect:list";
		}

		if (!upload.isEmpty()) {

			if (b.getOriginalfile() != null) {
				String fullpath = uploadPath + "/" + b.getSavedfile();
				FileService.deleteFile(fullpath);
			}

			String savefile = FileService.saveFile(upload, uploadPath);
			board.setOriginalfile(upload.getOriginalFilename());
			board.setSavedfile(savefile);
		}
		
		dao.update(board);
		logger.debug("업데이트 완료");
		
		model.addAttribute("board",board);
		
		return "redirect:read?boardnum=" + board.getBoardnum();

	}

	
	/**
	 * 리플달기
	 * @param model
	 * @param reply
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "writeReply", method = RequestMethod.POST)
	public String replyWrite(Model model, Reply reply, HttpSession session) {

		String id = (String) session.getAttribute("loginId");
		//reply.setId("nooti77");
		reply.setId(id);
		int result = dao.insertReply(reply);
		logger.debug("리플개수:{}", result);

		return "redirect:read?boardnum=" + reply.getBoardnum();
	}
	
	@RequestMapping(value = "replyDelete", method = RequestMethod.GET)
	public String replyDelete(Reply reply, HttpSession session){
		
		String id = (String)session.getAttribute("loginId");
		reply.setId(id);
		int result = dao.replyDelete(reply);
		logger.debug("result:{}", result);
		
		return "redirect:read?boardnum="+reply.getBoardnum();
	}
	
	
	@RequestMapping(value = "replyUpdate", method = RequestMethod.GET)
	public String updateReply(Reply reply, HttpSession session){
		
		String id = (String)session.getAttribute("loginId");
		reply.setId(id);
		int result = dao.replyUpdate(reply);
		logger.debug("result:{}", result);
		
		return "redirect:read?boardnum="+reply.getBoardnum();
		
	}
	
	@ResponseBody
	@RequestMapping(value="readReply", method=RequestMethod.GET)
	public ArrayList<Reply> readReply(int boardnum){
		
		ArrayList<Reply> result=dao.selectReply(boardnum);
		return result;
		
	}
	
	/**
	 * 파일 다운로드
	 * @param boardnum 첨부된 파일의 본문 글번호
	 * @return null
	 */
	@RequestMapping(value="download", method=RequestMethod.GET)
	public String filedownload(
								int boardnum
								,HttpServletResponse response){
		//전달된 글 번호로 글정보 검색
		Board board = dao.select(boardnum);
		String savefile = board.getSavedfile();
		//원래의 파일명을 보여줄 준비
		
		try {
			response.setHeader("Content-Disposition", "attachment;filename="
						+ URLEncoder.encode(board.getOriginalfile(), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}//앞은 이름 뒤는 값
		//서버에 저장된 파일을 읽어서
		//클라이언트로 전달한 출력스트림으로 복사
		String fullpath = uploadPath+"/"+savefile;
		
		try {
			FileInputStream in = new FileInputStream(fullpath);
			ServletOutputStream out = response.getOutputStream();
			
			
			
			FileCopyUtils.copy(in, out);
			in.close();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * 패스워드 체크 여부 확인 맞으면 세션값에 넣어준다.
	 * @param boardnum
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="passwordCheck", method=RequestMethod.POST)
	public Board passwordCheck(Board board, HttpSession session){

		String id = (String) session.getAttribute("loginId");
		
		board.setId(id);
		
		Board result=dao.checkPassword(board);
		
		//리턴 값이 있으면 세션에 확인 된 세션을 넣어준다.
		if(result != null){
			session.setAttribute("checkedBoardnum", result.getBoardnum());
		}
		
		return result;
		
	}
}
