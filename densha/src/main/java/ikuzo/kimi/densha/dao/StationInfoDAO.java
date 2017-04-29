package ikuzo.kimi.densha.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ikuzo.kimi.densha.vo.Exit;
import ikuzo.kimi.densha.vo.StationInfo;
import ikuzo.kimi.densha.vo.StationNearInfo;

@Repository
public class StationInfoDAO {

	@Autowired
	SqlSession sqlsession;
 
	public StationInfo getStationInfo(String station) {

		StationInfoMapper sim = sqlsession.getMapper(StationInfoMapper.class);
		StationInfo result = sim.getStationInfo(station);
		
		return result;
	}

	public ArrayList<Exit> getStationNearInfo(String station) {
		
		StationInfoMapper sim = sqlsession.getMapper(StationInfoMapper.class);
		ArrayList<Exit> nearArray = sim.getStationNearInfo(station);
		
		return nearArray;
	}
	
}
