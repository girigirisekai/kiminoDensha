package ikuzo.kimi.densha.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ikuzo.kimi.densha.vo.Member;
import ikuzo.kimi.densha.vo.checkCode;
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
			int result = mapper.joinMember(member);
			return result;
		}
		/**
		 * 임시 코드등록
		 */
		public int code(checkCode checkCode1){
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			int result = mapper.code(checkCode1);
			return result;
		}
		
		/**
		 * 임시코드 시간초가 삭제
		 */
		public void codeDelete(String id){
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			mapper.codeDelete(id);
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
		 * 회원 탈퇴 
		 * 회원 로그인 기록 삭제
		 */
		public int deleteMember(String id, String answer){
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			int result = mapper.deleteMember(id,answer);
			int result1 = mapper.deleteLoginCheck(id);
			return result;
		}
		/**
		 * 탈퇴회원 아이디 확인 
		 */
		public Member selectId1(String id, String password){
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			Member result = mapper.selectId1(id,password);
			return result;
		}
		
		public int updateMember(Member member){
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			int result = mapper.updateMember(member);
			return result;
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
		
		public ArrayList<loginCheck> logincheck3 (String id){
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			ArrayList<loginCheck> result = mapper.logincheck3(id);
			System.out.println(result+"가나다라마바사");
			return result;
		}
}
