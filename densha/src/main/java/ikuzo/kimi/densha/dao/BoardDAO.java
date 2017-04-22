package ikuzo.kimi.densha.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ikuzo.kimi.densha.vo.Board;
import ikuzo.kimi.densha.vo.Reply;

@Repository
public class BoardDAO {

	@Autowired
	SqlSession sqlSession;

	/*
	 * 게시판 글쓰기 dao
	 */
	public int insert(Board b) {

		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.insert(b);

		return result;
	}

	
	/*
	 * 게시판 글 보여주는 dao
	 */
	public ArrayList<Board> list(int startRecord, int countPerPage, String searchText, String type) {

		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

		// 검색결과의 일부분만 읽기
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		HashMap<String, String> map = new HashMap<>();
		map.put("searchText", searchText);
		map.put("type", type);
		ArrayList<Board> list = mapper.list(map, rb);

		return list;
	}

	
	/*
	 * 게시판에서 필요한 글을 가져오는 dao
	 */
	public int getTotal(String searchText, String type) {

		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		HashMap<String, String> map = new HashMap<>();
		map.put("searchText", searchText);
		map.put("type", type);
		int total = mapper.getTotal(map);

		return total;
	}

	/**
	 * 글 읽기
	 * @param boardnum
	 *            값을 넘겨줘서 글 검색 후 리턴을 받는다.
	 * @return Board값이 넘어오면 성공, null 값이면 실패
	 */
	public Board select(int boardnum) {

		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		Board board = mapper.select(boardnum);

		return board;
	}

	/**
	 * 글 삭제하는 dao
	 * @param id
	 * @param boardnum
	 * @return
	 */
	public int delete(String id, int boardnum) {

		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		HashMap<String, Object> map = new HashMap<>();
		map.put("boardnum", boardnum);
		map.put("id", id);

		int result = mapper.delete(map);

		return result;

	}
	
	/**
	 * 글 수정하는 dao
	 * @param board
	 * @return
	 */
	public int update(Board board){
		
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.update(board);
		
		return result;
	}
	
	/**
	 * 리플다는 dao
	 */
	public int insertReply(Reply reply){
		
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		int result = mapper.insertReply(reply);
		
		return result;
	}
	
	public ArrayList<Reply> selectReply(int boardnum){
		
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		ArrayList<Reply> result = mapper.selectReply(boardnum);
		
		return result;
	}
	
	public int replyDelete(Reply reply){
		
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		int result = mapper.replyDelete(reply);
		
		return result;
	}
	
	public int replyUpdate(Reply reply){
		
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		int result = mapper.replyUpdate(reply);
		
		return result;
	}
	
}
