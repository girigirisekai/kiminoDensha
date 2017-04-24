package ikuzo.kimi.densha.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import ikuzo.kimi.densha.vo.Board;
import ikuzo.kimi.densha.vo.Reply;

public interface BoardMapper {

	// 작성글 저장
	public int insert(Board b);

	// 게시글 읽기
	public Board select(int boardnum);

	// 글 수정
	public int update(Board board);

	// 게시글 리스트
	public ArrayList<Board> list(HashMap<String, String> map, RowBounds rb);

	// 전체 글 수
	public int getTotal(HashMap<String , String> map);

	// 저장글 삭제
	public int delete(HashMap<String, Object> map);

	// 댓글 달기
	public int insertReply(Reply reply);

	// 댓글 가져오기
	public ArrayList<Reply> selectReply(int boardnum);

	// 댓글 삭제하기
	public int replyDelete(Reply reply);

	// 댓글 수정하기
	public int replyUpdate(Reply reply);

	//비밀번호 체크하기
	public Board checkPassword(Board board);
}
