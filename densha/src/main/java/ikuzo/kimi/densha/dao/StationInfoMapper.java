package ikuzo.kimi.densha.dao;

import java.util.ArrayList;

import ikuzo.kimi.densha.vo.Exit;
import ikuzo.kimi.densha.vo.StationInfo;
import ikuzo.kimi.densha.vo.StationNearInfo;

public interface StationInfoMapper {

	public StationInfo getStationInfo(String station);

	public ArrayList<Exit> getStationNearInfo(String station);


} 
