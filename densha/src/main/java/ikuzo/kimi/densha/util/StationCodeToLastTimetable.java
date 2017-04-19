package ikuzo.kimi.densha.util;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

public class StationCodeToLastTimetable {

	public HashMap<String, Object> lastTimetable(String stationCode, String lineNum) throws Exception {
		// 역 코드을 받아서 역 막차 정보 API.
		// XML 형식을 parsing하는 형태.
		System.out.println(stationCode);
		// EX:
		// http://openAPI.seoul.go.kr:8088/(인증키)/xml/SearchFirstAndLastTrainbyIDService/1/5/1/1/1/0151/
		String seoulGoKr = "http://openAPI.seoul.go.kr:8088/";
		String openApiKey = "70426c6847696c693633424774786c";
		String returnData = "/xml/SearchFirstAndLastTrainbyIDService/1/5/";
		String line = lineNum; // 호선
		// 1 평일, 2 토요일, 3 휴일 공휴일
		// 1. 상행선, 내선 | 2. 하행선, 내선
		String insertStation = stationCode; // 역코드

		HashMap<String, Object> map = new HashMap<>(); // Hashmap 으로 전송한다.
		for (int i = 1; i <= 3; i++) {
			// 평일 토요일 휴일을 받기 위한 1차 for, 1에서 3까지 한다
			for (int j = 1; j <= 2; j++) {
				// 상하행선을 위한 2차 for
				String yoil = i + ""; // 요일을 String으로 변환, i값을 사용한다
				String upDown = j + ""; // 요일을 String으로 , j값을 사용한다

				String addrResult = seoulGoKr + openApiKey + returnData + line + "/" + yoil + "/" + upDown + "/"
						+ insertStation;
				// 주소생성
				System.out.println(addrResult); // 주소확인
				URL url = new URL(addrResult.toString());

				HttpURLConnection conn = (HttpURLConnection) url.openConnection();

				conn.setRequestMethod("GET");
				if (conn.getResponseCode() >= 500) { // 에러団 처리
					map.put("statue", "fail");
					// 실패라고 처리 후
					return null; // java団에서 null 처리 부탁
				} else { // 정상 실행시 200
					try {
						SAXBuilder builder = new SAXBuilder();
						// url에 xml이 있는경우
						Document jdomdoc = builder.build(url);
						Element root = jdomdoc.getRootElement();
						// root는 데이터 전체를 받는다.
						// 이중 row를 여러 개체임으로 children을 쓴다.
						List<Element> list = root.getChildren("row"); // row 파트 저장
						for (int k = 0; k < list.size(); k++) {
							Element person_E = list.get(k);
							map.put("statue", "success");
							map.put("firstTime" + yoil + upDown, person_E.getChild("FIRST_TIME").getValue());// 첫차
							// 시간
							map.put("firstStation" + yoil + upDown, person_E.getChild("F_SUBWAYSNAME").getValue());// 막차
							// 출발역명
							map.put("lastTime" + yoil + upDown, person_E.getChild("LAST_TIME").getValue());// 막차
							// 시간
							map.put("lastStation" + yoil + upDown, person_E.getChild("L_SUBWAYENAME").getValue());// 막차
							// 도착역명
							// 각 데이터는 firstTime11 firstTime12 firstTime31 firstTime32식으로 저장
						}
					} catch (Exception e) { // 에러시 예외처리,api의 경우 에러가 날 확률이 있다.
						e.printStackTrace();
						map.put("statue", "fail");
					}
				}
			} // for2
		} // for1
		return map; // 출구번호와 출구정보를 반환

	}

}
