
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
import ikuzo.kimi.densha.dao.StationInfoDAO;
import ikuzo.kimi.densha.dao.SubwayDAO;
import ikuzo.kimi.densha.util.StationCodeToLastTimetable;
import ikuzo.kimi.densha.util.StationCodeToStationInfo;
import ikuzo.kimi.densha.util.StationCodeToTimetable;
import ikuzo.kimi.densha.util.StationNameToBusInfo;
import ikuzo.kimi.densha.util.StationNameToPath;
import ikuzo.kimi.densha.util.StationNameToPath2;
import ikuzo.kimi.densha.util.StationNameToPath3;
import ikuzo.kimi.densha.util.StationNameToRealtimeArrive;
import ikuzo.kimi.densha.util.StationNameToStationExit;
import ikuzo.kimi.densha.vo.BusInformation;
import ikuzo.kimi.densha.vo.Exit;
import ikuzo.kimi.densha.vo.StationInfo;
import ikuzo.kimi.densha.vo.StationNearInfo;
import ikuzo.kimi.densha.vo.Subway;
import ikuzo.kimi.densha.vo.Timetable;
import ikuzo.kimi.densha.vo.stationDB;



/**
 * Handles requests for the application home page.
 */
@Controller
public class SubwayController {

	@Autowired
	StartEndDAO sedao;
	
	@Autowired
	SubwayDAO dao;
	
	@Autowired
	StationInfoDAO sinfodao;
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
	public HashMap<String, Object> lastTime(String stationCode, String line, Model model) throws Exception {
		System.out.println("line: " + line);
		System.out.println("stationCode: " + stationCode);
		StationCodeToLastTimetable lasttime = new StationCodeToLastTimetable();
		// 1호선
		// 1 평일, 2 토요일, 3 휴일 공휴일 123
		// 1. 상행선, 내선 | 2. 하행선, 내선 12

		HashMap<String, Object> map = lasttime.lastTimetable(stationCode, line);
		System.out.println(map.get("statue"));
		// 역코드 라인넘 요일 123 상 하 12

		return map;

	}

	// 역 정보 xml, MAP
	@ResponseBody
	@RequestMapping(value = "stationInfo", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public StationInfo stationInfo(String station, Model model) throws Exception {

		/*StationCodeToStationInfo info = new StationCodeToStationInfo();
		HashMap<String, Object> map = info.stationInfo(station);
		System.out.println(map.get("statue"));*/
		
		//DB StationInfo를 이용한 역정보
		StationInfo result = sinfodao.getStationInfo(station);
		
		System.out.println(result);
		
		return result;

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
		System.out.println(station);
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
		
		
		/*StationNameToStationExit exitInfo = new StationNameToStationExit();
		ArrayList<Exit> exitArray = exitInfo.exitInfo(station);*/
		
		//DB StationNearInfo를 이용한 역정보  
		ArrayList<Exit> exitArray = sinfodao.getStationNearInfo(station);
		logger.debug("exit확인 : {}", exitArray);
		
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

	
	// ???
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
	
	// ajax 최단경로 
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
	
	
	// ajax인데 주석이 없다 하지만 민호가 달것이다.
	@ResponseBody
	@RequestMapping(value = "pars", method = RequestMethod.GET
					, produces="application/json;charset=UTF-8")
	public String pars(String str) {
		//역코드를 역이름으로 바꾸는거 
		String result = sedao.select(str);
		
		return result;
	}
	
	// 역 코드로 역 이름과 좌표 받는 ajax
	@ResponseBody
	@RequestMapping(value = "StationCodeParseName", method = RequestMethod.GET
					, produces="application/json;charset=UTF-8")
	public ArrayList<stationDB> StationCodeParseName(String stationCode) {
		// 환승역의 경우 Code와 역 이름이 2개인 관계로 Arraylist로 받는다. 
		ArrayList<stationDB> StationList = new ArrayList<>();
		StationList = sedao.StationCodeParseName(stationCode);
		System.out.println(StationList.toString());
		
		return StationList;
	}
	
	
	// ajax 최소환승
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
		System.out.println(minTravelMsg);
		
		sList.remove(sList.size()-1);
		ArrayList<String> sList2 = sedao.path(sList); // 이걸 보낸다.
		sList2.add(minTravelMsg);
		logger.debug("test{}", sList2);
		
		return sList2;
	}
	
	@ResponseBody
	@RequestMapping(value = "realTimeTrainSeat", method = RequestMethod.POST)
	public Subway realTimeTrainSeat(String subwaynum, String carnum) {
		
		System.out.println("subwaynum: "+ subwaynum);
		System.out.println("carnum: "+ carnum);
	
		Subway subway = dao.selectArray(subwaynum, carnum);
		System.out.println(subway.toString());
		// elderyseat1, elderyseat2, elderyseat3 1,0,1
		
		return subway;
	}

}
