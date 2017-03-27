package ikuzo.kimi.densha.util;

import java.io.BufferedInputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class StationNameToPath {
			// 역 이름과 이름으로 경로 만들기
			// 2가지 경로가 있다(최단시간, 최소환승)
			// json으로 보낸다
			// http://data.seoul.go.kr/openinf/openapiview.jsp?infId=OA-12762&tMenu=11
			// http://swopenapi.seoul.go.kr/api/subway/(API키)/xml/shortestRoute/1/2/%EB%91%94%EC%B4%8C%EB%8F%99/%EA%B0%95%EB%82%A8/
			
	public String getPath(String stationStart, String stationEnd) throws Exception {
		
		String seoulGoKr = "http://swopenapi.seoul.go.kr/api/subway/";
		String openApiKey = "70426c6847696c693633424774786c";
		String returnData = "/json/shortestRoute/1/2/";
		String insertStationStart = stationStart; // 시작 역이름
		String insertStationEnd = stationEnd; // 도착 역이름

		// 한국어 UTF 엔코딩으로 변경하기 위한 団 (%20 단어 형태)
		try {
			insertStationStart = URLEncoder.encode(insertStationStart, "UTF-8");
			insertStationEnd = URLEncoder.encode(insertStationEnd, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String addrResult = seoulGoKr + openApiKey + returnData + insertStationStart  +"/"+ insertStationEnd;
		// 링크 생성
		System.out.println(addrResult);
		URL url = new URL(addrResult.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		System.out.println(conn.getResponseCode());
		
		StringBuffer alist = new StringBuffer();
		if (conn.getResponseCode() >= 500) {
			return "";

		} else { // 정상 실행시 200

			BufferedInputStream reader = new BufferedInputStream(url.openStream());
			StringBuffer buffer = new StringBuffer();
			int i;
			byte[] b = new byte[4096];
			while ((i = reader.read(b)) != -1) {
				buffer.append(new String(b, 0, i));
			}
			return buffer.toString(); // String으로 보내기 json jsp단 처리 
		}

	}


}
