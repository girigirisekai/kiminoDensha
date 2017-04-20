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

	@RequestMapping(value = "/api", method = RequestMethod.GET)
	public String api() { // api 안내 페이지
		return "api";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String js_5() { // 가입페이지
		return "Member/joinMember";
	}

	@RequestMapping(value = "/myAccount", method = RequestMethod.GET)
	public String myAccount() { // 내 정보 페이지 (개인정보 보여주고 수정과 탈퇴 페이지메뉴)
		return "Member/myAccount";
	}

//	@RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
//	public String deleteMember() { // 회원삭제
//		return "Member/deleteMember";
//	}
//		두 데이터는 다른 컨트롤러로 이관됨
//	@RequestMapping(value = "/updateMember", method = RequestMethod.GET)
//	public String updateMember() { // 회원수정
//		return "Member/updateMember";
//	}

	@RequestMapping(value = "/stationcode", method = RequestMethod.GET)
	public String stationcode() { // 지하철 지도 페이지, 나중에 subway로 바꿀것
		return "stationcode";
	}
	
	
}
