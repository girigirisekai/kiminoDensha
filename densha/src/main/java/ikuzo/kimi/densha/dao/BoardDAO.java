package ikuzo.kimi.densha.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ikuzo.kimi.densha.vo.Board;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insert(Board b){
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.insert(b);
		
		return result;
	}
	

	public ArrayList<Board> list(){
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<Board> cList = mapper.list();
		
		return cList;
	}
	
	public int delete(int num){
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.delete(num);

		return result;
	}
	
	

}
