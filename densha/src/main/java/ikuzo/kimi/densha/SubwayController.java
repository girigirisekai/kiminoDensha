package ikuzo.kimi.densha;

import java.util.ArrayList;
import java.util.HashMap;

import javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ikuzo.kimi.densha.dao.StartEndDAO;
import ikuzo.kimi.densha.util.BusInformation;
import ikuzo.kimi.densha.util.Exit;
import ikuzo.kimi.densha.util.StationCodeToLastTimetable;
import ikuzo.kimi.densha.util.StationCodeToStationInfo;
import ikuzo.kimi.densha.util.StationCodeToTimetable;
import ikuzo.kimi.densha.util.StationNameToBusInfo;
import ikuzo.kimi.densha.util.StationNameToPath;
import ikuzo.kimi.densha.util.StationNameToPath2;
import ikuzo.kimi.densha.util.StationNameToPath3;
import ikuzo.kimi.densha.util.StationNameToRealtimeArrive;
import ikuzo.kimi.densha.util.StationNameToStationExit;
import ikuzo.kimi.densha.util.Timetable;



/**
 * Handles requests for the application home page.
 */
@Controller
public class SubwayController {

	@Autowired
	StartEndDAO sedao;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	Logger logger = LoggerFactory.getLogger(SubwayController.class);
	
	@RequestMapping(value = "/testDrive", method = RequestMethod.GET)
	public String testDrive() {
		return "testDrive";
	}

	// 역 최초 최종시간 xml, MAP
	@ResponseBody
	@RequestMapping(value = "lastTime", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public HashMap<String, Object> lastTime(String station, Model model) throws Exception {
		System.out.println("input: " + station);
		StationCodeToLastTimetable lasttime = new StationCodeToLastTimetable();
		// 1호선
		// 1 평일, 2 토요일, 3 휴일 공휴일 123
		// 1. 상행선, 내선 | 2. 하행선, 내선 12

		HashMap<String, Object> map = lasttime.lastTimetable(station, "5");
		System.out.println(map.get("statue"));
		// 역코드 라인넘 요일 123 상 하 12

		return map;

	}

	// 역 정보 xml, MAP
	@ResponseBody
	@RequestMapping(value = "stationInfo", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public HashMap<String, Object> stationInfo(String station, Model model) throws Exception {

		StationCodeToStationInfo info = new StationCodeToStationInfo();
		HashMap<String, Object> map = info.stationInfo(station);
		System.out.println(map.get("statue"));
		return map;

	}

	// 역 테이블, XML, ArrayList
	@ResponseBody
	@RequestMapping(value = "stationTime", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ArrayList<Timetable> stationTime(String station, String yoil, String updown, Model model) throws Exception {

		StationCodeToTimetable stimeTable = new StationCodeToTimetable();
		// 역, 요일123, 상하행선 12
		ArrayList<Timetable> sTimeList = stimeTable.timetable(station, yoil, updown);
		for (int i = 0; i < sTimeList.size(); i++) {
			String arriveTimes = sTimeList.get(i).getArriveTimeUp();
			String x = arriveTimes.substring(0, 2);
			// 각 시각이 나옴

		}
		System.out.println(sTimeList);

		return sTimeList;

	}

	// 실시간 도착 json, String
	@ResponseBody
	@RequestMapping(value = "realTime", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String realTime(String station, Model model) throws Exception {

		StationNameToRealtimeArrive realTime = new StationNameToRealtimeArrive();
		String result = realTime.ArriveTime(station);

		return result;

	}

	// 경로정보 json, String
	@ResponseBody
	@RequestMapping(value = "path", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String path(String station, Model model) throws Exception {
		String[] am = station.split(",");
		StationNameToPath path = new StationNameToPath();
		String result = path.getPath(am[0], am[1]);

		return result;

	}

	// 출구정보 XML, array
	@ResponseBody
	@RequestMapping(value = "exitInfo", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ArrayList<Exit> exit(String station, Model model) throws Exception {
		StationNameToStationExit exitInfo = new StationNameToStationExit();
		ArrayList<Exit> exitArray = exitInfo.exitInfo(station);

		return exitArray;

	}

	// 출구정보 XML, array
	@ResponseBody
	@RequestMapping(value = "busInfo", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ArrayList<BusInformation> busInfo(String station, Model model) throws Exception {
		StationNameToBusInfo bus = new StationNameToBusInfo();
		ArrayList<BusInformation> busArray = bus.businfo(station);
		System.out.println(busArray);
		return busArray;

	}

	@RequestMapping(value = "tests", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String tests(Model model) throws Exception {

		return "tests";

	}

	@RequestMapping(value = "favorite", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String favorite(Model model) throws Exception {

		return "favorite";

	}

	@ResponseBody
	@RequestMapping(value = "FavoriteStationName", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String FavoriteStationName(String stationName) throws Exception {
		System.out.println(stationName);
		// 여기서 찾아주고
		String stationArray = "";
		stationArray +="동대문"+",";
		stationArray +="동대문문화역사공원";
//		DB단에서 찾은 다음에 
//		+=로 역이름을 받은다음 +","를 해야 합니다.
//		그리고 마지막에 받은 단어에서 ,를 삭제해야 함
		// 배열로 받아서 저장
		return stationArray;

	}
	
	@ResponseBody
	@RequestMapping(value = "call1", method = RequestMethod.GET)
	public HashMap<String, Object> call1(String code) {
		StationCodeToStationInfo sctsi = new StationCodeToStationInfo();
		HashMap<String, Object> map =  new HashMap<>();
		try {
			map = sctsi.stationInfo(code);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "path1", method = RequestMethod.GET)
	public ArrayList<String> path1(String start, String end) {
		
		StationNameToPath2 path = new StationNameToPath2();
		ArrayList<String> sList = new ArrayList<>();
		try {
			logger.debug("start :{}, end :{}", start, end);
			sList = path.getPath(start, end);
			//logger.debug("test{}", sList);
			//String a = sList.get(0);
			//String a = a.replaceAll(" ", "");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String shtTravelMsg = sList.get(sList.size()-1);
		logger.debug(shtTravelMsg);
		sList.remove(sList.size()-1);
		ArrayList<String> sList2 = sedao.path(sList);
		sList2.add(shtTravelMsg);
		logger.debug("test{}", sList2);
		
		return sList2;
	}
	
	@ResponseBody
	@RequestMapping(value = "pars", method = RequestMethod.GET
					, produces="application/json;charset=UTF-8")
	public String pars(String str) {
		
		String result = sedao.select(str);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "path2", method = RequestMethod.GET)
	public ArrayList<String> path2(String start, String end) {
		
		StationNameToPath3 path = new StationNameToPath3();
		ArrayList<String> sList = new ArrayList<>();
		try {
			logger.debug("start :{}, end :{}", start, end);
			sList = path.getPath(start, end);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String minTravelMsg = sList.get(sList.size()-1);
		sList.remove(sList.size()-1);
		ArrayList<String> sList2 = sedao.path(sList);
		sList2.add(minTravelMsg);
		logger.debug("test{}", sList2);
		
		return sList2;
	}

}
