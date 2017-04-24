package ikuzo.kimi.densha.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import ikuzo.kimi.densha.vo.anonyBoard;


public interface anonyBoardMapper {
	
	public ArrayList<anonyBoard> view(HashMap<String, Object> xMap, RowBounds rb);
	public int write(anonyBoard board);
	public anonyBoard writeview(int num);
	public int listall(HashMap<String, Object> xMap);
	public int delete(HashMap<String, Object> map);
	public int modify(anonyBoard board);
	public anonyBoard download(int num);


}
