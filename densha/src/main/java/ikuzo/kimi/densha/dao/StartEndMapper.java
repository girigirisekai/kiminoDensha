package ikuzo.kimi.densha.dao;

import java.util.ArrayList;
import java.util.Map;

import ikuzo.kimi.densha.vo.favorite;
import ikuzo.kimi.densha.vo.stationDB;

public interface StartEndMapper {

	public ArrayList<String> path(Map map);

	public String select(String str);

	public stationDB StationCodeParseName(String stationCode);

}
