package ikuzo.kimi.densha;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ServiceController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String js_5() { // 가입페이지
		return "Member/joinMember";
	}



	@RequestMapping(value = "/stationcode", method = RequestMethod.GET)
	public String stationcode() { // 지하철 지도 페이지, 나중에 subway로 바꿀것
		return "stationcode";
	}
	
	@RequestMapping(value = "/myaccount", method = RequestMethod.GET)
	public String myaccount() { // 지하철 지도 페이지, 나중에 subway로 바꿀것
		return "Member/myAccount";
	}
	
	
}
