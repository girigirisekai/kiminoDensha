package ikuzo.kimi.densha.util;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

public class StationCodeToStationInfo {

	public HashMap<String, Object> stationInfo(String stationCode) throws Exception {
		// 역코드(역외코드 아님)를 받아서 역의 정보를 가져오는 api.
		// XML 형식을 parsing하는 형태.
		System.out.println(stationCode);
//		EX: http://openapi.seoul.go.kr:8088/sample/xml/SearchSTNInfoByIDService/1/5/2555/
		String seoulGoKr = "http://openAPI.seoul.go.kr:8088/";
		String openApiKey = "70426c6847696c693633424774786c";
		String returnData = "/xml/SearchSTNInfoByIDService/1/3/";
		String insertStation = stationCode;

		String addrResult = seoulGoKr + openApiKey + returnData + insertStation;
		System.out.println(addrResult);
		
		URL url = new URL(addrResult.toString());

		HashMap<String, Object> map = new HashMap<>(); // hashmap 으로 전송한다. 

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		if (conn.getResponseCode() >= 500) { // 에러団 처리
			map.put("statue", "fail"); 
			//실패라고 처리 후 
			return map; // java団에서 statue검사후 처리 부탁
			
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
					//값 이름은 전부 소문자 처리 STATION_NM : 역이름
					map.put("stationname",person_E.getChild("STATION_NM").getValue()); // 전화번호
					map.put("tel",person_E.getChild("TEL").getValue()); // 전화번호
					map.put("address",person_E.getChild("ADDRESS").getValue()); // 주소
					map.put("obstacle",person_E.getChild("OBSTACLE").getValue()); // 장애인시설 
					map.put("parking",person_E.getChild("PARKING").getValue()); // 주차시설
					map.put("bicycle",person_E.getChild("BICYCLE").getValue()); // 자전거
					map.put("minwon",person_E.getChild("MUIN").getValue()); // 민원기
					map.put("nurse",person_E.getChild("NURSING").getValue()); // 수유방
					map.put("toilet",person_E.getChild("TOILET").getValue()); // 화장실위치
					map.put("mapX",person_E.getChild("XPOINT_WGS").getValue()); // 지도상좌표X
					map.put("mapY",person_E.getChild("YPOINT_WGS").getValue()); // 지도상좌표Y
					map.put("orignalStation",person_E.getChild("CYBER_ST_CODE").getValue());//기본역
					// 사이버스테이션 코드는 환승역의 경우 기본이 되는 역 표시이다.					
					// 자세한 건 API정보& key 엑셀문서 참조
					System.out.println(person_E.getChild("ADDRESS").getValue());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return map; // return 해쉬맵
		}

	}

}
