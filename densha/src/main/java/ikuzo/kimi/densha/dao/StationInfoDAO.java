package ikuzo.kimi.densha.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ikuzo.kimi.densha.vo.StationInfo;

@Repository
public class StationInfoDAO {

	@Autowired
	SqlSession sqlsession;

	public StationInfo getStationInfo(String station) {

		StationInfoMapper sim = sqlsession.getMapper(StationInfoMapper.class);
		StationInfo result = sim.getStationInfo(station);
		
		return result;
	}
	
}
