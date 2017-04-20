package ikuzo.kimi.densha.dao;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ikuzo.kimi.densha.vo.Station;
import ikuzo.kimi.densha.vo.favorite;
import ikuzo.kimi.densha.vo.stationDB;

@Repository
public class favoriteDAO {

	@Autowired
	SqlSession sqlsession;

	// 역 이름으로 찾기
	public ArrayList<Station> searchStation(String stationName) {

		favoriteMapper sem = sqlsession.getMapper(favoriteMapper.class);
		ArrayList<Station> favoriteList = sem.searchStation(stationName);
		return favoriteList;

	}

	// 내가 추가한 favorite역 보기
	public ArrayList<favorite> myFavorites(String stationName) {

		favoriteMapper sem = sqlsession.getMapper(favoriteMapper.class);
		ArrayList<favorite> favoriteList = sem.myFavorites(stationName);
		return favoriteList;

	}

	// 역 삭제
	public int deleteFavortie(String stationName) {

		favoriteMapper sem = sqlsession.getMapper(favoriteMapper.class);
		int result = sem.deleteFavortie(stationName);
		return result;

	}

	// 역 추가하기
	public int newFavorite(favorite stationInfo) {

		favoriteMapper sem = sqlsession.getMapper(favoriteMapper.class);
		int result = sem.newFavorite(stationInfo);
		return result;

	}

	public Station DBstation(String stationName, String line) {
		favoriteMapper sem = sqlsession.getMapper(favoriteMapper.class);
		HashMap <String,Object> map = new HashMap<>();
		map.put("name", stationName);
		map.put("line", line);
		Station result = sem.DBstation(map);
		
		return result;
	}

}
