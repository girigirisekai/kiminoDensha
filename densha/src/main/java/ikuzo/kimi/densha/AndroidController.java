package ikuzo.kimi.densha;

import java.util.ArrayList;

import javax.servlet.ServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import ikuzo.kimi.densha.dao.MemberDAO;
import ikuzo.kimi.densha.dao.SubwayDAO;
import ikuzo.kimi.densha.dao.favoriteDAO;
import ikuzo.kimi.densha.vo.Member;
import ikuzo.kimi.densha.vo.Subway;
import ikuzo.kimi.densha.vo.favorite;
import ikuzo.kimi.densha.vo.loginCheck;

@Controller
public class AndroidController {

	// favoriteDAO autowired
	@Autowired
	favoriteDAO dao;
	@Autowired
	MemberDAO memdao;
	
	
	// 안드로이드 즐겨찾기 담당
	//localhost:8888/densha/Androidfavorite
	@ResponseBody
	@RequestMapping(value = "/Androidfavorite", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String favoriteJson(String loginId , ServletResponse res) {

		// 로그인 아이디 불러오기
		String nowID = loginId; // id 부르기

		// 로그인된 계정의 즐겨찾기 역 정보 리스트 불러오기
		ArrayList<favorite> favoriteLists = dao.myFavorites(nowID);

		//JSON으로 데이터 빼내기 
		JSONObject jsonResult = StationJsonApiModule(nowID);
		
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=utf-8");

		return jsonResult.toString();
		
		/*개발 방식
		1. favorite의 내용을 읽는다 json
		2. favorite의 역 정보들을 읽은 후  apicontroller의 역 정보를 json으로 읽는다.
		END*/
	}
	
	//안드로이드 로그인 담당
	//localhost:8888/densha/Androidlogin
	@ResponseBody
	@RequestMapping(value = "/Androidlogin", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String Androidlogin(String id , String password, ServletResponse res) {

		Member member = memdao.login(id, password);
		JSONObject obj = new JSONObject();
		
		// 로그인 성공시 
		if(member.getId().equals(id) && member.getPassword().equals(password)){
			obj.put("RESULT", "True"); 
		// 로그인 실패시
		}else{
			obj.put("RESULT", "False"); 
		}
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=utf-8");

		return obj.toString();
		
		
	}

	
	// json으로 api 만드는 메소드,
	public JSONObject StationJsonApiModule(String nowID) {
		ArrayList<favorite> favoriteList = new ArrayList<>();

		favoriteList = dao.myFavorites(nowID);

		JSONObject obj = new JSONObject();
		obj.put("ID", favoriteList.get(0).getId()); // id

		try {
			JSONArray jArray = new JSONArray(); // 배열이 필요할때

			for (int i = 0; i < favoriteList.size(); i++) { // Station Array

				JSONObject sObject = new JSONObject();// 배열 내에 들어갈 json

				sObject.put("FAVORITENAME", favoriteList.get(i).getFavoriteName());
				sObject.put("STATIONCODE", favoriteList.get(i).getStationCode());
				sObject.put("LINE", favoriteList.get(i).getLine());
				sObject.put("FCODE", favoriteList.get(i).getFcode());
						
				
				jArray.put(sObject);
			}

		obj.put("item", jArray);// 배열을 넣음

		} catch (JSONException e) {
			e.printStackTrace();
		}

		return obj;
	}
	
	

}