package ikuzo.kimi.densha.example;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;


public class realSeatAndHuman {

	public ArrayList<SeatAndHuman> getSeatAndHuman(String carNum) throws Exception {
		// 열차 넘버를 받아서 열차의 전체 인원과 각 량당 인원과 노약자석의 좌석의 상황
		// XML 형식을 parsing하는 형태.
	
		
		System.out.println(carNum);

		String link = "http://localhost:8888/densha/apiservice/xml?subwaynum=";
		String insertCarnum = carNum; // 역코드

		String addrResult = link + insertCarnum;

		System.out.println(addrResult);

		URL url = new URL(addrResult.toString());

		ArrayList<SeatAndHuman> alist = new ArrayList<>(); // ArrayList 으로 전송한다.

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET"); // GET으로 보내줍니다.
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

				// 차량의 번호와 차량의 전체인원수
				String subNum = root.getChild("SUBWAYNUM").getValue();
				String allh = root.getChild("ALLHUMAN").getValue();

				List<Element> list = root.getChildren("row");
				// row의 값들을 리스트로 받는다.

				for (int i = 0; i < list.size(); i++) {
					Element rows = list.get(i);
					// 도착시간 급행선 출발지하철 역 도착 지하철 역
					String subwaynums = rows.getChild("SUBWAYNUM").getValue();
					String carNums = rows.getChild("CARNUM").getValue();
					String human = rows.getChild("HUMANNUM").getValue();
					String elderlySeat1 = rows.getChild("ELDERLYSEAT1").getValue();
					String elderlySeat2 = rows.getChild("ELDERLYSEAT2").getValue();
					String elderlySeat3 = rows.getChild("ELDERLYSEAT3").getValue();
					String elderlySeat4 = rows.getChild("ELDERLYSEAT4").getValue();
					String elderlySeat5 = rows.getChild("ELDERLYSEAT5").getValue();
					String elderlySeat6 = rows.getChild("ELDERLYSEAT6").getValue();
					String elderlySeat7 = rows.getChild("ELDERLYSEAT7").getValue();
					String elderlySeat8 = rows.getChild("ELDERLYSEAT8").getValue();
					String elderlySeat9 = rows.getChild("ELDERLYSEAT9").getValue();
					String elderlySeat10 = rows.getChild("ELDERLYSEAT10").getValue();
					String elderlySeat11 = rows.getChild("ELDERLYSEAT11").getValue();
					String elderlySeat12 = rows.getChild("ELDERLYSEAT12").getValue();
					SeatAndHuman vo = new SeatAndHuman(subwaynums, carNums, human, elderlySeat1, elderlySeat2,
							elderlySeat3, elderlySeat4, elderlySeat5, elderlySeat6, elderlySeat7, elderlySeat8,
							elderlySeat9, elderlySeat10, elderlySeat11, elderlySeat12);
					alist.add(vo); // 저장
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return alist; // 정보 반환
		}

	}

}
