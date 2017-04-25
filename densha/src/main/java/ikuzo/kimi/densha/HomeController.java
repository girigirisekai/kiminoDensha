package ikuzo.kimi.densha;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}	

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home2() {
		return "home";
	}

	@RequestMapping(value = "/n2", method = RequestMethod.GET)
	public String n2() { // 테스트용으로 쓸것 n2.jsp
		return "n2";
	}
	
	@ResponseBody
	@RequestMapping(value = "/n2", method = RequestMethod.POST)
	public String n22() { // 테스트용으로 쓸것 n2.jsp
		
		
		return "n2";
	}
	
	
	@RequestMapping(value = "/test", method = RequestMethod.GET
			)
	public String test() { // 테스트용으로 쓸것 n2.jsp
		
		
		return "test";
	}
	

	
	
}
