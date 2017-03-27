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

public class StationNameToStationExit {

	public ArrayList<Exit> exitInfo(String stationName) throws Exception {
		// 역 이름을 받아서 역 출구 정보를 받는 API.
		// XML 형식을 parsing하는 형태.
		System.out.println(stationName);
//		EX: http://openapi.seoul.go.kr:8088/sample/xml/gateInfo/1/5/2555/
		String seoulGoKr = "http://swopenAPI.seoul.go.kr/api/subway/";
		String openApiKey = "70426c6847696c693633424774786c";
		String returnData = "/xml/gateInfo/1/30/";
		String insertStation = stationName;
		
		String addrResult = seoulGoKr + openApiKey + returnData + URLEncoder.encode(insertStation, "UTF-8");
		System.out.println(addrResult);
		
		URL url = new URL(addrResult.toString());

		ArrayList<Exit> alist  = new ArrayList<>(); // Arraylist 으로 전송한다. 

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		if (conn.getResponseCode() >= 500) { // 에러団 처리
			
			//실패라고 처리 후 
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
					String exitNum = person_E.getChild("rowNum").getValue(); // 출구번호
					// 출구번호는 0번이 1번이다. 
					String exitInfo = person_E.getChild("cfrBuild").getValue(); // 출구정보
					String allExit = person_E.getChild("ectrcCnt").getValue(); // 출구정보
					alist.add(new Exit(exitNum,exitInfo, allExit)); // 출구번호와 출구정보 글
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return alist; // 출구번호와 출구정보를 반환
		}

	}

}
