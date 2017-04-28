package ikuzo.kimi.densha.util;

import java.io.BufferedInputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class StationNameToRealtimeArrive {
	
	public String ArriveTime(String stationName) throws Exception{
		// 역 이름으로 실시간 정보 출력
		// json으로 보내기 위한 단계이다.
		System.out.println(stationName);
//		http://swopenAPI.seoul.go.kr/api/subway/(인증키)/json/realtimeStationArrival/0/5/서울
		String seoulGoKr = "http://swopenAPI.seoul.go.kr/api/subway/";
		String openApiKey = "416e574575696c693436756e7a6375";
		String returnData = "/json/realtimeStationArrival/0/30/";
		String insertStation = stationName;
		
		// UTF 엔코딩으로 변경하기 위한 団 (%20 단어 형태)
		try {
			insertStation = URLEncoder.encode(stationName, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String addrResult = seoulGoKr + openApiKey + returnData + insertStation;
		// 링크 생성
		System.out.println(addrResult);
		URL url = new URL(addrResult.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		System.out.println(conn.getResponseCode());
		// ArrayList<String> alist = new ArrayList<>();
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
			return buffer.toString(); // String으로 보내기 
		}
		
	}

}
