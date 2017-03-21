package ikuzo.kimi.densha.dao;

import ikuzo.kimi.densha.vo.Member;
import ikuzo.kimi.densha.vo.loginCheck;

public interface MemberMapper {

		public int joinMember(Member member);
		
		public int editMember(Member member);
		
		public int deleteMember(Member member);
		
		public Member selectId(String id);
		
		public Member login (String loginId, String loginPassword);
		
		public int logincheck (loginCheck logincheck);
}
