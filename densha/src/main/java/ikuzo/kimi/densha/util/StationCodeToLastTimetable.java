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

	public HashMap<String, Object> lastTimetable(String stationCode, String lineNum, String yoils, String upDowns)
			throws Exception {
		// 역 코드을 받아서 역 막차 정보 API.
		// XML 형식을 parsing하는 형태.
		System.out.println(stationCode);
		// EX:
		// http://openAPI.seoul.go.kr:8088/(인증키)/xml/SearchFirstAndLastTrainbyIDService/1/5/1/1/1/0151/
		String seoulGoKr = "http://openAPI.seoul.go.kr:8088/";
		String openApiKey = "70426c6847696c693633424774786c";
		String returnData = "/xml/SearchFirstAndLastTrainbyIDService/1/5/";
		String line = lineNum + "/"; // 호선
		String yoil = yoils + "/"; // 1 평일, 2 토요일, 3 휴일 공휴일
		String upDown = upDowns + "/"; // 1. 상행선, 내선 | 2. 하행선, 내선
		String insertStation = stationCode; // 역코드

		String addrResult = seoulGoKr + openApiKey + returnData + line + yoil + upDown + insertStation;
		System.out.println(addrResult);

		URL url = new URL(addrResult.toString());

		HashMap<String, Object> map = new HashMap<>(); // Hashmap 으로 전송한다.

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

				List<Element> list = root.getChildren("row");

				for (int i = 0; i < list.size(); i++) {
					Element person_E = list.get(i);
					map.put("statue", "success");
					map.put("firstTime", person_E.getChild("FIRST_TIME").getValue());// 첫차
																					// 시간
					map.put("firstStation", person_E.getChild("F_SUBWAYSNAME").getValue());// 막차
																							// 출발역명
					map.put("lastTime", person_E.getChild("LAST_TIME").getValue());// 막차
																					// 시간
					map.put("lastStation", person_E.getChild("L_SUBWAYENAME").getValue());// 막차
																							// 도착역명

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return map; // 출구번호와 출구정보를 반환
		}

	}

}
