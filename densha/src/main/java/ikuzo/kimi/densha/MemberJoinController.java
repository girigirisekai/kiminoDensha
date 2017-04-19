package ikuzo.kimi.densha;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import ikuzo.kimi.densha.dao.MemberDAO;
import ikuzo.kimi.densha.vo.Member;

@Controller
@RequestMapping("join")
//@SessionAttributes("Member")
public class MemberJoinController {
		
		/**
		 * 회원가입, 삭제, 수정 관련 DAO 
		 */
		@Autowired
		MemberDAO dao;
	
	Logger logger = LoggerFactory.getLogger(MemberJoinController.class);
	/**
	 * @return 
	 * insertMember.jsp 회원 가입 폼으로 이동
	 */
	@RequestMapping(value="joinMember", method=RequestMethod.GET)
	public String joinMember(){
		return "Member/joinMember";
	}
	/**
	 * 
	 * @param member
	 * @return
	 * insertComplete 회원 가입 완료 창으로 이동
	 */
	@RequestMapping(value="joinMember", method=RequestMethod.POST)
	public String joinMember(@ModelAttribute("Member") Member member, Model model){
		int result  = 0;
		member.setType("123123");
		try{
		result = dao.joinMember(member);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	/**
	 * @param id
	 * 검사할 아이디 
	 * @return
	 * 아이디 있으면 return VO
	 * 없으면 return 아니면 null
	 */
	@ResponseBody
	@RequestMapping(value="selectId",  method=RequestMethod.POST)
	public Member selectId(String id){
		Member result = dao.selectId(id); 
		logger.debug("{}",result);
		return result;
	}
	
	
	
	
	
	
	
	
	
	/**
	 * 
	 * @param member
	 * @param status	로그인 완료 --> 세션 삭제
	 * @return
	 * MainPage 이동
	 */
	@RequestMapping(value="joinComplete", method=RequestMethod.GET)
	public String joinComplete(@ModelAttribute("Member") Member member, SessionStatus status, Model model ){
		System.out.println("여기까지왔나 안왔냐"+member);
		//status.setComplete();
		return "redirect:/";
	}
}
