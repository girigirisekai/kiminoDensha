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

public class StationNameToBusInfo {

	public ArrayList<BusInformation> businfo(String stationName)
			throws Exception {
		// 역 코드을 받아서 역 시간표 정보 API.
		// XML 형식을 parsing하는 형태.
		System.out.println(stationName);
		// EX:http://swopenAPI.seoul.go.kr/api/subway/(인증키)/xml/busLineToTransfer/0/5/서울
		String seoulGoKr = "http://swopenapi.seoul.go.kr/api/subway/";
		String openApiKey = "70426c6847696c693633424774786c";
		String returnData = "/xml/busLineToTransfer/0/20/";
		String insertStation = URLEncoder.encode(stationName, "UTF-8"); // 역코드
		
				
		String addrResult = seoulGoKr + openApiKey + returnData + insertStation;
		System.out.println(addrResult);

		URL url = new URL(addrResult.toString());

		ArrayList<BusInformation> alist = new ArrayList<>(); // ArrayList 으로 전송한다.

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
					String exit = person_E.getChild("ectrcNo").getValue();
					// 출구번호
					String type = person_E.getChild("rttp").getValue();
					// rttp (1:공항, 3:간선, 4:지선, 5:순환, 6:광역, 7:인천, 8:경기, 9:폐지, 0:공용)
					String num = person_E.getChild("rtnm").getValue();
					// 버스번호
					alist.add(new BusInformation(num,type,exit)); // 저장
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return alist; // 정보 반환
		}

	}

}
