package ikuzo.kimi.densha.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ikuzo.kimi.densha.vo.Subway;


@Repository
public class SubwayDAO {
	
	//sqlSession autowired
	@Autowired
	SqlSession sqlsession;
	
	/*검색
	 * 입력값: 지하철번호, 칸번호
	 * 출력값: Subway객체
	*/
	public Subway select(String subwayNum, String carNum){
		Subway result=new Subway();
		SubwayMapper subwaymapper=sqlsession.getMapper(SubwayMapper.class);
		try{
			result=subwaymapper.selectSubway(subwayNum, carNum);
		}catch (Exception e) {
			e.getStackTrace();
		}
		
		return result; 
	}
	
	public ArrayList<Subway> selectSubwayArray(String subwayNum){
		ArrayList<Subway> result = new ArrayList<>();
		SubwayMapper subwaymapper=sqlsession.getMapper(SubwayMapper.class);
		try{
			result=subwaymapper.selectSubwayArray(subwayNum);
		}catch (Exception e) {
			e.getStackTrace();
		}
		
		return result; 
	}
	
	/*등록
	 * 입력값: Subway객체
	 * 출력값: 성공: 1, 실패: 0
	*/
	public int insert(Subway subway){
		int result=0;
		SubwayMapper subwaymapper=sqlsession.getMapper(SubwayMapper.class);
		try {
			result=subwaymapper.insertSubway(subway);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return result;
	}
	
	/*수정
	 * 입력값: Subway객체
	 * 출력값: 성공: 1, 실패: 0
	*/
	public int update(Subway subway){
		int result=0;
		SubwayMapper subwaymapper=sqlsession.getMapper(SubwayMapper.class);
		try {
			result=subwaymapper.updateSubway(subway);
		} catch (Exception e) {
			e.getStackTrace();
		}
		return result;
	}




}
