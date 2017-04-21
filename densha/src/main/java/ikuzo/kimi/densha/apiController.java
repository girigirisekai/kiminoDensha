package ikuzo.kimi.densha;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class apiController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/api", method = RequestMethod.GET)
	public String api() { // api 안내 페이지
		return "api";
	}
	
	@RequestMapping(value = "/apiservice", method = RequestMethod.GET)
	public String apiservice(Model model) { // api 안내 페이지
		
		
		return "api";
	}

	
}
