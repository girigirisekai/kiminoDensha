package ikuzo.kimi.densha.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

public class StationNameToPath3 {
			// 역 이름과 이름으로 경로 만들기
			// 2가지 경로가 있다(최단시간, 최소환승)
			// json으로 보낸다
			// http://data.seoul.go.kr/openinf/openapiview.jsp?infId=OA-12762&tMenu=11
			// http://swopenapi.seoul.go.kr/api/subway/(API키)/xml/shortestRoute/1/2/%EB%91%94%EC%B4%8C%EB%8F%99/%EA%B0%95%EB%82%A8/
	
	private String xml;
	
	public ArrayList<String> getPath(String stationStart, String stationEnd) throws Exception {
		
		ArrayList<String> sList = new ArrayList<>();
		
		String seoulGoKr = "http://swopenapi.seoul.go.kr/api/subway/";
		String openApiKey = "70426c6847696c693633424774786c";
		String returnData = "/xml/shortestRoute/1/1/";
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
					String minStatnNm2 = person_E.getChild("minStatnNm").getValue();
					String minTravelMsg = person_E.getChild("minTravelMsg").getValue();
					String minStatnNm = minStatnNm2.replaceAll(" ", "");
					//sList = (ArrayList<String>) Arrays.asList(shtStatnNm.split(" ,"));
					String [] array = minStatnNm.split(",");
					for (int l = 0; l < array.length ; l++){
						//array[l].trim();
						sList.add(array[l]);
						//System.out.format("sList[%d] = %s%n", l, array[l]);
					}
					//sList.add("참고");
					for (int j = 0; j < sList.size(); j++){
					     System.out.format("sList[%d] = %s%n", j, sList.get(j));
					 }
					sList.add(minTravelMsg);
					//Timetable timetbl = new Timetable(arriveTime, expressSubway, startStation, endStation);
					//alist.add(timetbl); // 저장
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return sList;
		}

	}
	
	public void example(){
		/*json처리 코드는 다음과 같다.
		$.ajax({
			url : 'subway', //url link
			type : 'post', // 방식
			data : { // 넘길 역이나 이름
				station : insertStation
			},
			dataType : 'json', // 받는 형식 
			success : gogo // 처리할 function단
		})
		======================================
		function gogo(result) {
			var text = '';
			$.each(result, function(index, item) {
				$.each(item.row, function(index, items) { // 2개 고정
					var norikae = items.shtTransferMsg.substr(shtTransferMsg.indexOf(',')+2,shtTransferMsg.indexOf(','));
					text += '<table>';
					text += '<td> 거쳐갈 역 : ' + items.shtStatnNm + '</td>';
					text += '<td> 걸리는 시간: ' + items.shtTransferMsg + '</td>';
					text += '<td> 최단시간 경유 지하철역수: ' + items.shtStatnCnt + '</td>';
					text += '<td> 걸리는 시간: ' + items.shtTravelTm + '</td>';
					text += '<td> 최소환승 경유 지하철역명: ' + items.minStatnNm + '</td>';
					text += '<td> 최소환승 환승 지하철역명: ' + items.minTransferMsg + '</td>';
					text += '<td> 최소환승 경유 지하철역수: ' + items.minStatnCnt + '</td>';
					text += '<td> 최소환승 도착 예정시간: ' + items.minTravelTm + '</td>';
					
					
					text += '</tr>';
					text += '</table>';

				});

			});

			$('#done').html(text);

		}*/
	}

}
