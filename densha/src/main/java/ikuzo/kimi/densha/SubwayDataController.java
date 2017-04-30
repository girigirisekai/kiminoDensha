package ikuzo.kimi.densha;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ikuzo.kimi.densha.dao.SubwayDAO;
import ikuzo.kimi.densha.vo.Subway;

//지하철 정보 수신 컨트롤러
@Controller
public class SubwayDataController {
	
	//dao autowired
	@Autowired
	SubwayDAO dao;
	
	//logger객체 생성 
	Logger logger = LoggerFactory.getLogger(SubwayDataController.class);

	// 지하철 내부 데이터 수신
	//주의) value와 method 값 변환 절대 금지!!
	@RequestMapping(value = "subwayInsert", method = RequestMethod.GET)
	public void prac(String subwayNum, String carNum, String humanNum,
		String elderlySeat1, String elderlySeat2, String elderlySeat3,
		String moveNext,
		String elderlySeat4, String elderlySeat5, String elderlySeat6, 
		String elderlySeat7, String elderlySeat8, String elderlySeat9, 
		String elderlySeat10,String elderlySeat11,String elderlySeat12, 
		Model model) 
	{

		// 수신 값 확인
		logger.debug("지하철번호: {}", subwayNum);
		logger.debug("칸번호: {}", carNum);
		logger.debug("사람수: {}", humanNum);
		logger.debug("노약자석1: {}", elderlySeat1);
		logger.debug("노약자석2: {}", elderlySeat2);
		logger.debug("노약자석3: {}", elderlySeat3);
		logger.debug("옆칸 이동 변수: {}", moveNext);
		
		// 들어온 값이 null일 때 오류 방지를 위해 0으로 치환
		if (humanNum == null) {
			humanNum = "0";
		}
		if (elderlySeat1 == null) {
			elderlySeat1 = "0";
		}
		if (elderlySeat2 == null) {
			elderlySeat2 = "0";
		}
		if (elderlySeat3 == null) {
			elderlySeat3 = "0";
		}

		// 필요하면 사용
		/*
		 * model.addAttribute("subwayNum", subwayNum);
		 * model.addAttribute("carNum", carNum); model.addAttribute("humanNum",
		 * humanNum); model.addAttribute("elderlySeat1", elderlySeat1);
		 * model.addAttribute("elderlySeat2", elderlySeat2);
		 * model.addAttribute("elderlySeat3", elderlySeat3);
		 */
		
		// DB저장을 위해 Subway vo객체에 저장
		Subway subway = new Subway(subwayNum, carNum, humanNum, elderlySeat1, elderlySeat2, elderlySeat3, elderlySeat4, elderlySeat5, elderlySeat6, elderlySeat7, elderlySeat8, elderlySeat9, elderlySeat10 , elderlySeat11 , elderlySeat12);
		
		// vo객체 정보 확인
		logger.debug("전송받은 지하철 정보: {}", subway);
		
		// 먼저 같은 지하철번호와 칸 번호의 데이터가 있는지 확인하기
		logger.debug("현재 지하철  정보 DB 검색");
		Subway isExist=dao.select(subwayNum, carNum);
		logger.debug("검색한 지하철 값 : {}",isExist);
		// 같은 지하철 번호와 칸번호의 데이터가 없으면 insert문 실행
		if(isExist==null){
			logger.debug("현재 칸 지하철 정보 추가");
			if(dao.insert(subway)==1){
				logger.debug("추가 성공");
			}
			else{
				logger.debug("추가 실패");
			}
		}
		// 같은 지하철번호와 칸번호의 데이터가 있으면 update문 실행
		else{
			logger.debug("현재 칸 지하철 정보 업데이트");
			if(dao.update(subway)==1){
				logger.debug("업데이트 성공");
			}
			else{
				logger.debug("업데이트 실패");
			}
		}
		
		/* 옆 칸 지하철 정보 처리 부분
		* String형으로 VO와 DB에 변수들이 저장되어 있으므로 Int형으로 변환한 후, 
		* 인원수 증감시키고 다시 String형으로 변환해 DB에 저장
		*/
		//칸번호와 인원수 int형과 String형 변수 선언
		int carNum_Int=0;
		int carNum_Next_Int=0;
		String carNum_Next="0";
		int humanNum_Next_Int=0;
		String humanNum_Next="0";
		
		try{
			//옆칸 번호 설정
			carNum_Int=Integer.parseInt(carNum);
			carNum_Next_Int=carNum_Int-1;
			carNum_Next=Integer.toString(carNum_Next_Int);
			logger.debug("변환한  옆칸 번호: {}", carNum_Next);
		
			//옆칸 지하철 정보 불러오기 
			//옆칸에 지하철 정보가 DB에 이미 존재한다고 가정한 후 처리하므로 반드시 DB에 옆칸 지하철 데이터 존재 필수!
			Subway NextSubway=dao.select(subwayNum, carNum_Next);
			logger.debug("옆칸 지하철 정보: {}", NextSubway);
			
			//인원수 수정
			humanNum_Next=NextSubway.getHumanNum();
			humanNum_Next_Int=Integer.parseInt(humanNum_Next);
			if(moveNext.equals("1")){
				humanNum_Next_Int=humanNum_Next_Int+1;
			}
			else if(moveNext.equals("-1")){
				humanNum_Next_Int=humanNum_Next_Int-1;
				if(humanNum_Next_Int<0){
					humanNum_Next_Int=0;
				}
			}
			humanNum_Next=Integer.toString(humanNum_Next_Int);
			logger.debug("옆칸 사람 수: {}", humanNum_Next);
			
			//변환한 인원 수를 옆칸 지하철 객체에 setting 
			NextSubway.setHumanNum(humanNum_Next);
			logger.debug("변환한 옆칸 지하철 정보: {}", NextSubway);
			
			//옆칸 지하철 정보를 DB에 업데이트 
			if(dao.update(NextSubway)==1){
				logger.debug("옆칸 지하철 정보 저장 성공");
			}
			else{
				logger.debug("옆칸 지하철 정보 저장 실패");
			}
		}catch (Exception e) {
			logger.debug("형변환과 옆칸 지하철데이터 업데이트 실패");
		}	
	}

	// ajax 지하철 내부의 좌석과 혼잡도 데이터 가져오는 부분
	@ResponseBody 
	@RequestMapping(value = "subwaySensorGet", method = RequestMethod.POST)
	public ArrayList<Subway> subwaySensorGet(String subwayNum) {
		ArrayList<Subway> subwayList = new ArrayList<>();
		
		subwayList = dao.selectSubwayArray(subwayNum);
		System.out.println("들어오는  : " +subwayNum);
		
		// 지하철 넘버, 칸넘버를 넣어야 한다.
		logger.debug("검색값확인: {}", subwayList);

		return subwayList;
	}
}
