package ikuzo.kimi.densha.dao;

import java.util.ArrayList;

import ikuzo.kimi.densha.vo.Member;
import ikuzo.kimi.densha.vo.checkCode;
import ikuzo.kimi.densha.vo.loginCheck;

public interface MemberMapper {

		public int joinMember(Member member);
		
		public int editMember(Member member);
		
		public int deleteMember(String id, String answer);
		
		public int deleteLoginCheck(String id);
		
		public int updateMember(Member member);
		
		public int code(checkCode checkCode1);
		
		public void codeDelete(String id);
		
		public Member selectId(String id);
		
		public Member selectId1(String id, String password);
		
		public Member login (String loginId, String loginPassword);
		
		public int logincheck (loginCheck logincheck);
		
		public ArrayList<loginCheck> logincheck3 (String id);
		
		public int ChangePassword(String Code, String user);
}
