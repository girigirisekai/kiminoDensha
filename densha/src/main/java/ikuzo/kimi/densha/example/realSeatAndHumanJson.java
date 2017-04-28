package ikuzo.kimi.densha.example;

import java.io.BufferedInputStream;
import java.net.HttpURLConnection;
import java.net.URL;


public class realSeatAndHumanJson {
		
	public String getSeatAndHuman(String carNum) throws Exception {

		String link = "http://localhost:8888/densha/apiservice/json?subwaynum=";
		String insertCarnum = carNum; // 역코드

		// 한국어 UTF 엔코딩으로 변경하기 위한 団 (%20 단어 형태)
		
		String addrResult = link + insertCarnum;
		// 링크 생성
		System.out.println(addrResult);
		URL url = new URL(addrResult.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET"); // GET형식으로 보내야 합니다.
		System.out.println(conn.getResponseCode());
		
		if (conn.getResponseCode() >= 500) {
			return null;

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
