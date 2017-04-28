package ikuzo.kimi.densha.example;

public class SeatAndHuman {

	private String subwayNum; // 지하철번호
	private String carNum; // 칸번호
	private String humanNum; // 사람수
	private String humanPercent; // 사람수
	private String elderlySeat1;// 노약자석1
	private String elderlySeat2;// 노약자석2
	private String elderlySeat3;// 노약자석3
	private String elderlySeat4;// 노약자석4
	private String elderlySeat5;// 노약자석5
	private String elderlySeat6;// 노약자석6
	private String elderlySeat7;// 노약자석7
	private String elderlySeat8;// 노약자석8
	private String elderlySeat9;// 노약자석9
	private String elderlySeat10;// 노약자석10
	private String elderlySeat11;// 노약자석11
	private String elderlySeat12;// 노약자석12

	// 생성자
	public SeatAndHuman() {
		super();
	}

	public SeatAndHuman(String subwayNum, String carNum, String humanNum, String humanPercent, String elderlySeat1,
			String elderlySeat2, String elderlySeat3, String elderlySeat4, String elderlySeat5, String elderlySeat6,
			String elderlySeat7, String elderlySeat8, String elderlySeat9, String elderlySeat10, String elderlySeat11,
			String elderlySeat12) {
		super();
		this.subwayNum = subwayNum;
		this.carNum = carNum;
		this.humanNum = humanNum;
		this.humanPercent = humanPercent;
		this.elderlySeat1 = elderlySeat1;
		this.elderlySeat2 = elderlySeat2;
		this.elderlySeat3 = elderlySeat3;
		this.elderlySeat4 = elderlySeat4;
		this.elderlySeat5 = elderlySeat5;
		this.elderlySeat6 = elderlySeat6;
		this.elderlySeat7 = elderlySeat7;
		this.elderlySeat8 = elderlySeat8;
		this.elderlySeat9 = elderlySeat9;
		this.elderlySeat10 = elderlySeat10;
		this.elderlySeat11 = elderlySeat11;
		this.elderlySeat12 = elderlySeat12;
	}

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

	public String getElderlySeat4() {
		return elderlySeat4;
	}

	public void setElderlySeat4(String elderlySeat4) {
		this.elderlySeat4 = elderlySeat4;
	}

	public String getElderlySeat5() {
		return elderlySeat5;
	}

	public void setElderlySeat5(String elderlySeat5) {
		this.elderlySeat5 = elderlySeat5;
	}

	public String getElderlySeat6() {
		return elderlySeat6;
	}

	public void setElderlySeat6(String elderlySeat6) {
		this.elderlySeat6 = elderlySeat6;
	}

	public String getElderlySeat7() {
		return elderlySeat7;
	}

	public void setElderlySeat7(String elderlySeat7) {
		this.elderlySeat7 = elderlySeat7;
	}

	public String getElderlySeat8() {
		return elderlySeat8;
	}

	public void setElderlySeat8(String elderlySeat8) {
		this.elderlySeat8 = elderlySeat8;
	}

	public String getElderlySeat9() {
		return elderlySeat9;
	}

	public void setElderlySeat9(String elderlySeat9) {
		this.elderlySeat9 = elderlySeat9;
	}

	public String getElderlySeat10() {
		return elderlySeat10;
	}

	public void setElderlySeat10(String elderlySeat10) {
		this.elderlySeat10 = elderlySeat10;
	}

	public String getElderlySeat11() {
		return elderlySeat11;
	}

	public void setElderlySeat11(String elderlySeat11) {
		this.elderlySeat11 = elderlySeat11;
	}

	public String getElderlySeat12() {
		return elderlySeat12;
	}

	public void setElderlySeat12(String elderlySeat12) {
		this.elderlySeat12 = elderlySeat12;
	}

	@Override
	public String toString() {
		return "SeatAndHuman [subwayNum=" + subwayNum + ", carNum=" + carNum + ", humanNum=" + humanNum
				+ ", humanPercent=" + humanPercent + ", elderlySeat1=" + elderlySeat1 + ", elderlySeat2=" + elderlySeat2
				+ ", elderlySeat3=" + elderlySeat3 + ", elderlySeat4=" + elderlySeat4 + ", elderlySeat5=" + elderlySeat5
				+ ", elderlySeat6=" + elderlySeat6 + ", elderlySeat7=" + elderlySeat7 + ", elderlySeat8=" + elderlySeat8
				+ ", elderlySeat9=" + elderlySeat9 + ", elderlySeat10=" + elderlySeat10 + ", elderlySeat11="
				+ elderlySeat11 + ", elderlySeat12=" + elderlySeat12 + "]";
	}

}
