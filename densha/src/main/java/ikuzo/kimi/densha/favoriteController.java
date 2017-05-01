package ikuzo.kimi.densha;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ikuzo.kimi.densha.dao.favoriteDAO;
import ikuzo.kimi.densha.vo.Station;
import ikuzo.kimi.densha.vo.favorite;


/**
 * 즐겨찾기 Controller
 */
@Controller
public class favoriteController {
	
	//logger 객체 생성
	Logger logger = LoggerFactory.getLogger(favoriteController.class);
	
	//favoriteDAO autowired
	@Autowired
	favoriteDAO dao;
	
	//현재 로그인된 계정의 즐겨찾기 역 정보 가져오기
	@RequestMapping(value = "favorite", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public String favorite(Model model, HttpSession ses) throws Exception {
		logger.debug("--현재 아이디의 즐겨찾기 리스트 불러오기--");
		
		//로그인 아이디 불러오기
		String nowID = (String) ses.getAttribute("loginId"); // id 부르기 
		
		//로그인된 계정의 즐겨찾기 역 정보 리스트 불러오기
		ArrayList<favorite> favoriteLists = dao.myFavorites(nowID);
		
		//모델에 즐겨찾기리스트 저장
		model.addAttribute("favoriteLists", favoriteLists);
		logger.debug("즐겨찾기 리스트: {}",favoriteLists);
		
		return "favorite";

	} 

	//입력한 역 정보 검색하기
	@ResponseBody
	@RequestMapping(value = "FavoriteStationName", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String FavoriteStationName(String stationName) throws Exception {
		
		logger.debug("--입력한 역의 정보 불러오기--");
		
		logger.debug("입력한 역 정보: {}", stationName);
		
		//검색결과 역 정보 불러오기
		ArrayList<Station> result = dao.searchStation(stationName.replaceAll(" ", ""));
		
		//검색한 역 정보 String타입으로 변환
		String stationArray = "";
		for(int i = 0 ; i< result.size();i++){
			stationArray += result.get(i).getStation_nm()+"";
			stationArray += "/"+result.get(i).getLine_num()+"호선,";
		}		
		int lastChar = stationArray.lastIndexOf(",");
		stationArray = stationArray.substring(0, lastChar);
		
		return stationArray;

	}
	
	//선택한 역을 즐겨찾기에 추가하기
	@ResponseBody
	@RequestMapping(value = "newFavorite", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ArrayList <favorite> newFavorite(String statioNameAndLine, HttpSession ses, Model model) throws Exception {
		logger.debug("--선택한 역 즐겨찾기에 추가하기--");
		
		logger.debug("추가할 역이름: {}",statioNameAndLine);
		
		//역 이름과 호선 이름 처리
		String StationName = "";
		String line = "";
		int lastChar = statioNameAndLine.indexOf("/");
		StationName = statioNameAndLine.substring(0, lastChar);
		int hosung = statioNameAndLine.indexOf("호선");
		line = statioNameAndLine.substring(lastChar+1, hosung);
		
		//?? 역 검색하기 
		Station result = dao.DBstation(StationName, line); 
		String fcode = result.getFr_code();
		logger.debug("모르는 결과: {}", result);
		
		//현재 아이디 
		String nowID = (String) ses.getAttribute("loginId");
		
		//로그인된 계정의 즐겨찾기 역 정보 리스트 불러오기
		ArrayList<favorite> favoriteLists = dao.myFavorites(nowID);
		
		//이미 목록에 선택한 역이 있으면 예외처리
		for (favorite favorite : favoriteLists) {
			if(favorite.getStationCode().equals(result.getStation_cd())){
				logger.debug("등록한 즐겨찾기 리스트에 이미 선택한 역이 있습니다.");
				logger.debug("등록을 중단합니다.");
				return favoriteLists;
			}else{
				logger.debug("등록한 즐겨찾기 리스트에 선택한 역이 없습니다.");
				logger.debug("등록을 계속 진행합니다.");
				break;
			}
		}
		
		
		//등록할 favorite 객체 생성  
		favorite fa = new favorite(nowID,StationName,result.getStation_cd(),"",line,fcode); 
		logger.debug("등록할 즐겨찾기: {}",fa.toString());
		//System.out.println(fa.toString());
		
		//favorite등록
		int resultInt = dao.newFavorite(fa);
		
		if(resultInt==1){
			logger.debug("등록 성공");
		}else{
			logger.debug("등록 실패");
		}
		
		//현재 아이디의 즐겨찾기 리스트 불러오기
		favoriteLists = dao.myFavorites(nowID);
		logger.debug("즐겨찾기 리스트: {}",favoriteLists);
		//모델에 즐겨찾기리스트 저장
		model.addAttribute("favoriteLists", favoriteLists);
		
		return favoriteLists;
	}
	
	//즐겨찾기 리스트에서 선택한 즐겨찾기 삭제
	@ResponseBody
	@RequestMapping(value = "deleteStation", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ArrayList<favorite> deleteStation(favorite selectedFavorite, HttpSession ses, Model model) throws Exception {
		logger.debug("--선택한 역 즐겨찾기 리스트에서 삭제 --");
		
		//결과변수 초기화
		int result=0;
		
		//삭제할 favorite데이터의 변수들 설정
		String stationName=selectedFavorite.getFavoriteName();
		logger.debug("삭제할 favorite의 역이름: {}", stationName);
		String stationCode=selectedFavorite.getStationCode();
		logger.debug("삭제할 favorite의 역코드: {}", stationCode);
		String favoriteId=selectedFavorite.getId();
		
		//로그인된 아이디 불러오기
		String nowID = (String) ses.getAttribute("loginId"); // id 부르기 
		
		//아이디비교
		//일치하면
		if(nowID.equals(favoriteId)){
			//삭제할 favorite 객체 생성
			favorite favorite = new favorite(nowID,stationName, stationCode,"","",""); 
			//삭제
			result=dao.deleteFavorite(favorite);
			//삭제성공 시
			if(result==1){
				logger.debug("삭제 성공");
			}
			//삭제실패 시 
			else{
				logger.debug("삭제 실패");
			}
		}
		//일치하지 않으면 에러
		else{
			logger.debug("잘못된 접근입니다!");
			logger.debug("아이디가 일치하지 않습니다!");
		}
		
		//현재 아이디의 즐겨찾기 리스트 불러오기
		ArrayList <favorite> favoriteLists = dao.myFavorites(nowID);
		logger.debug("즐겨찾기 리스트: {}",favoriteLists);
		//모델에 즐겨찾기리스트 저장
		model.addAttribute("favoriteLists", favoriteLists);
		
		return favoriteLists;
	}
	
	//현재 로그인된 계정의 즐겨찾기 역 정보 가져오기
	@ResponseBody
	@RequestMapping(value = "searchFavoriteList", method = RequestMethod.POST)
	public ArrayList<favorite> searchfavoriteList(Model model, HttpSession ses) throws Exception {
		logger.debug("--현재 아이디의 즐겨찾기 리스트 불러오기--");
			
		//로그인 아이디 불러오기
		String nowID = (String) ses.getAttribute("loginId"); // id 부르기 
			
		//로그인된 계정의 즐겨찾기 역 정보 리스트 불러오기
		ArrayList<favorite> favoriteLists = dao.myFavorites(nowID);
			
		//모델에 즐겨찾기리스트 저장
		model.addAttribute("favoriteLists", favoriteLists);
		logger.debug("즐겨찾기 리스트: {}",favoriteLists);
		
		return favoriteLists;
	}
}
