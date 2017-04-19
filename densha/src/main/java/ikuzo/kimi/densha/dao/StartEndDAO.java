package ikuzo.kimi.densha.dao;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ikuzo.kimi.densha.vo.stationDB;

@Repository
public class StartEndDAO {

	@Autowired
	SqlSession sqlsession;
	
	public ArrayList<String> path(ArrayList<String> list){
		
		StartEndMapper sem = sqlsession.getMapper(StartEndMapper.class);
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		ArrayList<String> slist = sem.path(map);
		
		return slist;
		
	}
	
	public String select(String str){
		
		StartEndMapper sem = sqlsession.getMapper(StartEndMapper.class);
		String result = sem.select(str);
		
		return result;
		
	}

	public stationDB StationCodeParseName(String stationCode) {
		// TODO Auto-generated method stub
		StartEndMapper sem = sqlsession.getMapper(StartEndMapper.class);

		stationDB result = sem.StationCodeParseName(stationCode);
		
		return result;
	}
	
}
