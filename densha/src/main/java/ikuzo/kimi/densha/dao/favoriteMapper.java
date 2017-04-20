package ikuzo.kimi.densha.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import ikuzo.kimi.densha.vo.Station;
import ikuzo.kimi.densha.vo.favorite;
import ikuzo.kimi.densha.vo.stationDB;

public interface favoriteMapper {

	public ArrayList<favorite> myFavorites(String stationName);

	public int deleteFavortie(String stationName);

	public int newFavorite(favorite stationInfo);

	public ArrayList<Station> searchStation(String stationName);

	public Station DBstation(HashMap <String,Object> map);
}
