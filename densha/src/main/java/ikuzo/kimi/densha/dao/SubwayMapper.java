package ikuzo.kimi.densha.dao;

import java.util.ArrayList;
import java.util.HashMap;

import ikuzo.kimi.densha.vo.Subway;


public interface SubwayMapper {
	
	//검색 // 실시간 좌석수 
	public Subway selectSubway(String subwayNum, String carNum) throws Exception;
	
	//전체검색
	public ArrayList<Subway> selectSubwayArray(String subwayNum) throws Exception;
	
	//등록
	public int insertSubway(Subway subway) throws Exception;
	
	//수정
	public int updateSubway(Subway subway) throws Exception;

	
}
