package ikuzo.kimi.densha.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ikuzo.kimi.densha.vo.Member;
import ikuzo.kimi.densha.vo.loginCheck;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession sqlSession;
		
		/**
		 * 회원가입 
		 */
		public int joinMember(Member member){
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			int result2 = mapper.joinMember(member);
			return result2;
		}
		
		/**
		 * 회원 수정
		 */
		public int editMember(Member member){
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			int result = mapper.editMember(member);
			return 0;
		}
		
		/**
		 * 회원 삭제 
		 */
		public int deleteMember(Member member){
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			int result = mapper.deleteMember(member);
			return 0;
		}
		
		/**
		 * 회원 아이디 중복 검사
		 */
		public Member selectId(String id){
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			Member result = mapper.selectId(id); 
			return result;
		}
		
		/**
		 *  로그인 접속
		 */
		public Member login (String loginId, String loginPassword){
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			Member result = mapper.login(loginId,loginPassword);
			return result;
		}
		/**
		 * 로그인하면 loginCheck 에 임시 저장
		 */
		public int logincheck (loginCheck logincheck){
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			int result = mapper.logincheck(logincheck);
			return result;
		}
}
