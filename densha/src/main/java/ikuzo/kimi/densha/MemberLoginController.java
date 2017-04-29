package ikuzo.kimi.densha;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import ikuzo.kimi.densha.dao.MemberDAO;
import ikuzo.kimi.densha.vo.Member;
import ikuzo.kimi.densha.vo.loginCheck;

@Controller
//@RequestMapping("login")
public class MemberLoginController {

	@Autowired
	MemberDAO dao;

	Logger logger = LoggerFactory.getLogger(MemberLoginController.class);
	
	/**
	 * 로그인
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		Member member = new Member();
		model.addAttribute("Member",member);
		return "Member/login";
	}
	/**
	 * 로그인 하기
	 * @param ss				로그인 하면 남기는 섹션
	 * @param loginid			로그인한 아이디
	 * @param loginPassword		로그인한 패스워드
	 * 로그인 되면 loginCheck 에 Ip 주소,시간, 로그인 아이디 등록
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpSession ss, String loginId, String loginPassword, HttpServletRequest req,Model model, HttpSession ses) {
		Member member = dao.login(loginId, loginPassword);
		
		System.out.println(loginId +"//"+loginPassword );
		
		if(member == null){
			model.addAttribute("loginCheck",0);
			return "home";
		}
		
		if(member.getId().equals(loginId) && member.getPassword().equals(loginPassword)){
			
			ss.setAttribute("loginId", loginId);// 세션저장
			
			req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			String ip = req.getRemoteAddr();
			loginCheck logincheck  = new loginCheck(loginId,ip,null);
			int logincheck1 = dao.logincheck(logincheck);
			model.addAttribute("loginCheck", logincheck1); 
			return "home";
			
		}else{
			return "redirect:home";
		}
	}
	
	
	/**
	 * 로그아웃 부분
	 * @param ss
	 * @return
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession ss){
		logger.debug("logout");
		ss.removeAttribute("loginId");
		ss.invalidate();
		return "redirect:/";
	}
	
	// 내 정보 페이지, 개인정보 보여주기
	// 접속 기록 , 접속 아이피주소 보여주기
	@RequestMapping(value = "/myAccount", method = RequestMethod.GET)
	public String myAccount(Model model, HttpSession ses) { // 내 정보 페이지 (개인정보 보여주고 수정과 탈퇴 페이지메뉴)
		String id = (String) ses.getAttribute("loginId");
		Member myMember = dao.selectId(id);
		model.addAttribute("accountInfo", myMember);
		ses.setAttribute("loginQustion", myMember.getQuestion());
		ArrayList<loginCheck> loginCheck = dao.logincheck3(id);
		System.out.println(loginCheck+"로그인 체크한번!!!!!");
		model.addAttribute("loginCheck3",loginCheck);
		System.out.println(loginCheck);
		return "Member/myAccount";
	}

	
}
