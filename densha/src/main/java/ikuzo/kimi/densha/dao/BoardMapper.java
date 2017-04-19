package ikuzo.kimi.densha.dao;

import java.util.ArrayList;

import ikuzo.kimi.densha.vo.Board;

public interface BoardMapper {

	public int insert(Board b);
	
	public ArrayList<Board> list();
	
	public int delete(int num);
	
}
