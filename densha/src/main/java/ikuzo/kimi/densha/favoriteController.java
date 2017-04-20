package ikuzo.kimi.densha;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ikuzo.kimi.densha.dao.StartEndDAO;
import ikuzo.kimi.densha.dao.favoriteDAO;
import ikuzo.kimi.densha.vo.Station;
import ikuzo.kimi.densha.vo.favorite;
import ikuzo.kimi.densha.vo.stationDB;

/**
 * Handles requests for the application home page.
 */
@Controller
public class favoriteController {

	
	@Autowired
	favoriteDAO dao;
	
	//최초 시작 링크 ,DB 접속해서 이름 이메일 현재 저정된 역 정보 가져오시길
	@RequestMapping(value = "favorite", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String favorite(Model model, HttpSession ses) throws Exception {
		String nowID = (String) ses.getAttribute("loginId"); // id 부르기 
		ArrayList <favorite> favoriteLists = dao.myFavorites(nowID);
		
		
		model.addAttribute("favoriteLists", favoriteLists);
		return "favorite";

	}

	
	@ResponseBody
	@RequestMapping(value = "FavoriteStationName", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String FavoriteStationName(String stationName) throws Exception {
		
		System.out.println(stationName);
	
		ArrayList<Station> result = dao.searchStation(stationName);
		String stationArray = "";
		
		for(int i = 0 ; i< result.size();i++){
			stationArray += result.get(i).getStation_nm()+"";
			stationArray += "/"+result.get(i).getLine_num()+"호선,";
		}		
		int lastChar = stationArray.lastIndexOf(",");
		stationArray = stationArray.substring(0, lastChar);
		
		return stationArray;

	}
	
	@ResponseBody
	@RequestMapping(value = "newFavorite", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public int newFavorite(String statioNameAndLine, HttpSession ses) throws Exception {
		System.out.println(statioNameAndLine);
		
		String StationName = "";
		String line = "";
		int lastChar = statioNameAndLine.indexOf("/");
		StationName = statioNameAndLine.substring(0, lastChar);
		int hosung = statioNameAndLine.indexOf("호선");
		line = statioNameAndLine.substring(lastChar+1, hosung);
		
		
		Station result = dao.DBstation(StationName, line); // 역 결과 받음
				
		String nowID = (String) ses.getAttribute("loginId"); // id 부르기 
		
		favorite fa = new favorite(nowID,StationName,result.getStation_cd(),""); 
		//favorite 대동단결
		
		System.out.println(fa.toString());
		int resultInt = dao.newFavorite(fa);
		
		return resultInt;

	}
	
	

}
