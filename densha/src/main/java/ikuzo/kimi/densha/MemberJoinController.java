package ikuzo.kimi.densha;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import ikuzo.kimi.densha.dao.MemberDAO;
import ikuzo.kimi.densha.email.SendMail;
import ikuzo.kimi.densha.vo.Member;
import ikuzo.kimi.densha.vo.checkCode;

@Controller
//@RequestMapping("join")
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
		System.out.println(member.toString());
		int result  = 0;
		member.setType("personal");
		try{
		result = dao.joinMember(member);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
	
	
	/**
	 * 인증번호 보내기 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="CheckCode", method=RequestMethod.POST)
	public int CheckCode(String user, String password, String question, String answer){
		SendMail mail = new SendMail("", null, null);
		int Code = mail.test(user);
		checkCode checkCode1 = new checkCode(user,password,question,answer,Code+"",null);
		int checkCode = dao.code(checkCode1);
		return Code;
	}
	
	
	
	/**
	 * 인증시간 5분이 지나면 오라클 임시저장된 것 삭제
	 * @param id 
	 */
	@ResponseBody
	@RequestMapping(value="codeDelete", method=RequestMethod.POST)
	public void codeDelete(String id){
		System.out.println("임시코드 확인");
		System.out.println(id+"임시코드확인");
		dao.codeDelete(id);
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
	 * 회원 탈퇴 부분
	 * deleteMember.jsp로이동
	 */
	@RequestMapping(value="deleteMember", method=RequestMethod.GET)
	public String deleteMember(){
	
		return "Member/deleteMember";
	
	}
	
	
	
	/**
	 * 탈퇴할 때 아이디 확인
	 * 회원 로그인 기록도 삭제
	 */
	@ResponseBody
	@RequestMapping(value="deleteMember", method=RequestMethod.POST)
	public int deleteMember(String id, String answer){
		int result = dao.deleteMember(id, answer);
		return result;
	}
	
	
	
	/**
	 * 삭제할 아이디가 있는지 확인
	 * @param id
	 * @param password
	 * @return 아이디가 있으면 객체 return
	 */
	@ResponseBody
	@RequestMapping(value="selectId1",  method=RequestMethod.POST)
	public Member selectId1(String id, String password){
		Member result = dao.selectId1(id,password); 
		return result;
	}
	
	
	
	/**
	 * 회원정보 수정부분
	 * updateMember.jsp로 이동
	 * @return
	 */
	@RequestMapping(value="updateMember", method=RequestMethod.GET)
	public String updateMember (){
		return "Member/updateMember";
	}
	
	
	
	/**
	 * @return 정보 성공 1 아니면 0
	 */
	@ResponseBody
	@RequestMapping(value="updateMember", method=RequestMethod.POST)
	public int updateMember(Model model, Member member){
		logger.debug("{}",member);
		int result = dao.updateMember(member);
		return result;
	}
	
	
}
