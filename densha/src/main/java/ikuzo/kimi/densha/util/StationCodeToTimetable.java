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

public class StationCodeToTimetable {

	public ArrayList<Timetable> timetable(String stationCode, String yoils, String upDowns)
			throws Exception {
		// 역 코드을 받아서 역 시간표 정보 API.
		// XML 형식을 parsing하는 형태.
		System.out.println(stationCode);
		// EX:http://openapi.seoul.go.kr:8088/(sample)/xml/SearchSTNTimeTableByIDService/1/5/0151/1/1/
		String seoulGoKr = "http://openAPI.seoul.go.kr:8088/";
		String openApiKey = "70426c6847696c693633424774786c";
		String returnData = "/xml/SearchSTNTimeTableByIDService/1/250/";
		String yoil = yoils + "/"; // 1 평일, 2 토요일, 3 휴일 공휴일
		String upDown = upDowns + "/"; // 1. 상행선, 내선 | 2. 하행선, 내선
		String insertStation = stationCode + "/"; // 역코드

		String addrResult = seoulGoKr + openApiKey + returnData + insertStation+ yoil + upDown;
		System.out.println(addrResult);

		URL url = new URL(addrResult.toString());

		ArrayList<Timetable> alist = new ArrayList<>(); // ArrayList 으로 전송한다.

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		if (conn.getResponseCode() >= 500) { // 에러団 처리

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
					// 도착시간 급행선 출발지하철 역 도착 지하철 역
					String arriveTime = person_E.getChild("ARRIVETIME").getValue();
					String expressSubway = person_E.getChild("EXPRESS_YN").getValue();
					String startStation = person_E.getChild("SUBWAYSNAME").getValue();
					String endStation = person_E.getChild("SUBWAYENAME").getValue();
					Timetable timetbl = new Timetable(arriveTime, expressSubway, startStation, endStation);
					alist.add(timetbl); // 저장
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return alist; // 정보 반환
		}

	}

}
