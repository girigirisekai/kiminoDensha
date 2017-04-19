package ikuzo.kimi.densha;

import java.lang.reflect.Array;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ikuzo.kimi.densha.dao.StartEndDAO;
import ikuzo.kimi.densha.util.StationCodeToStationInfo;
import ikuzo.kimi.densha.util.StationNameToPath2;
import ikuzo.kimi.densha.util.StationNameToPath3;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	StartEndDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value = "test", method = RequestMethod.GET
				, produces="application/json;charset=UTF-8")
	public void test(String s, String e) throws ParseException {
		
		StationShortTime sst = new StationShortTime();
		
		String test = sst.shortTime(s, e);
		logger.debug("check1 {}, {}", s, e);
		logger.debug("check2 {}", test);
		
		
		//return "home";
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
		ArrayList<String> sList2 = dao.path(sList);
		sList2.add(shtTravelMsg);
		logger.debug("test{}", sList2);
		
		return sList2;
	}
	
	@ResponseBody
	@RequestMapping(value = "pars", method = RequestMethod.GET
					, produces="application/json;charset=UTF-8")
	public String pars(String str) {
		
		String result = dao.select(str);
		
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
		ArrayList<String> sList2 = dao.path(sList);
		sList2.add(minTravelMsg);
		logger.debug("test{}", sList2);
		
		return sList2;
	}
}
