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


@Controller
public class SubwayDataController {
	
	@Autowired
	SubwayDAO dao;
	Logger logger=LoggerFactory.getLogger(SubwayDataController.class);
	
	// 지하철 내부 데이터 끌어오기
	@RequestMapping(value="subwayInsert", method=RequestMethod.GET)
	public void prac(String subwayNum, String carNum, String humanNum, String elderlySeat1, String elderlySeat2, String elderlySeat3, Model model){
		
		//수신 값 확인
		logger.debug("지하철번호: {}", subwayNum);
		logger.debug("칸번호: {}", carNum);
		logger.debug("사람수: {}", humanNum);
		logger.debug("노약자석1: {}", elderlySeat1);
		logger.debug("노약자석2: {}", elderlySeat2);
		logger.debug("노약자석3: {}", elderlySeat3);	
		
		//들어온 값이 null일 때 오류 방지를 위해 0으로 치환
		if(humanNum==null){
			humanNum="0";
		}
		if(elderlySeat1==null){
			elderlySeat1="0";
		}
		if(elderlySeat2==null){
			elderlySeat2="0";
		}
		if(elderlySeat3==null){
			elderlySeat3="0";
		}
		
		//필요하면 사용
		/*model.addAttribute("subwayNum", subwayNum);
		model.addAttribute("carNum", carNum);
		model.addAttribute("humanNum", humanNum);
		model.addAttribute("elderlySeat1", elderlySeat1);
		model.addAttribute("elderlySeat2", elderlySeat2);
		model.addAttribute("elderlySeat3", elderlySeat3);*/
		
		//DB저장을 위해 Subway vo객체에 저장
		Subway subway=new Subway(subwayNum, carNum, humanNum, elderlySeat1, elderlySeat2, elderlySeat3);
		//vo객체 정보 확인
		logger.debug("지하철정보: {}",subway);
		
		//먼저 같은 지하철번호와 칸 번호의 데이터가 있는지 확인하기
		logger.debug("select");
		
		
	} 
	
	@ResponseBody //ajax 지하철 내부의 좌석과 혼잡도  데이터 가져오는 부분
	@RequestMapping(value = "/subwaySensorGet", method = RequestMethod.POST)
	public ArrayList <Subway> subwaySensorGet(String subwayNum) {
		ArrayList <Subway> subwayList = new ArrayList<>();
	
		 subwayList= dao.selectSubwayArray(subwayNum);
	
		//지하철 넘버, 칸넘버를 넣어야 한다.
		logger.debug("검색값확인: {}", subwayList);
		
		return subwayList;
	}
}
