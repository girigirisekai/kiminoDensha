package ikuzo.kimi.densha.vo;


public class Subway {
	//변수
	private String subwayNum;	//지하철번호
	private String carNum;		//칸번호
	private String humanNum;	//사람수
	private String elderlySeat1;//노약자석1
	private String elderlySeat2;//노약자석2
	private String elderlySeat3;//노약자석3
	
	//생성자
	public Subway(){
		super();
	}
	
	public Subway(String subwayNum, String carNum, String humanNum, String elderlySeat1, String elderlySeat2,
			String elderlySeat3) {
		this.subwayNum = subwayNum;
		this.carNum = carNum;
		this.humanNum = humanNum;
		this.elderlySeat1 = elderlySeat1;
		this.elderlySeat2 = elderlySeat2;
		this.elderlySeat3 = elderlySeat3;
	}
	
	//메소드
	//get,set메소드
	public String getSubwayNum() {
		return subwayNum;
	}

	public void setSubwayNum(String subwayNum) {
		this.subwayNum = subwayNum;
	}

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public String getHumanNum() {
		return humanNum;
	}

	public void setHumanNum(String humanNum) {
		this.humanNum = humanNum;
	}

	public String getElderlySeat1() {
		return elderlySeat1;
	}

	public void setElderlySeat1(String elderlySeat1) {
		this.elderlySeat1 = elderlySeat1;
	}

	public String getElderlySeat2() {
		return elderlySeat2;
	}

	public void setElderlySeat2(String elderlySeat2) {
		this.elderlySeat2 = elderlySeat2;
	}

	public String getElderlySeat3() {
		return elderlySeat3;
	}

	public void setElderlySeat3(String elderlySeat3) {
		this.elderlySeat3 = elderlySeat3;
	}
	
	//toString메소드
	@Override
	public String toString() {
		return "Subway [subwayNum=" + subwayNum + ", carNum=" + carNum + ", humanNum=" + humanNum + ", elderlySeat1="
				+ elderlySeat1 + ", elderlySeat2=" + elderlySeat2 + ", elderlySeat3=" + elderlySeat3 + "]";
	}
	
	
}
