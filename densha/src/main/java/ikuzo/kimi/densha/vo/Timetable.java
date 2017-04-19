package ikuzo.kimi.densha.vo;

public class Timetable {

	private String arriveTimeUp; // 도착시간
	private String expressLineUp; // 급행선
	private String startStsNameUp; // 출발역
	private String endStsNameUp; // 도착역

	public Timetable() {
		super();
	}

	public Timetable(String arriveTimeUp, String expressLineUp, String startStsNameUp, String endStsNameUp) {
		super();
		this.arriveTimeUp = arriveTimeUp;
		this.expressLineUp = expressLineUp;
		this.startStsNameUp = startStsNameUp;
		this.endStsNameUp = endStsNameUp;
	}

	public String getArriveTimeUp() {
		return arriveTimeUp;
	}

	public void setArriveTimeUp(String arriveTimeUp) {
		this.arriveTimeUp = arriveTimeUp;
	}

	public String getExpressLineUp() {
		return expressLineUp;
	}

	public void setExpressLineUp(String expressLineUp) {
		this.expressLineUp = expressLineUp;
	}

	public String getStartStsNameUp() {
		return startStsNameUp;
	}

	public void setStartStsNameUp(String startStsNameUp) {
		this.startStsNameUp = startStsNameUp;
	}

	public String getEndStsNameUp() {
		return endStsNameUp;
	}

	public void setEndStsNameUp(String endStsNameUp) {
		this.endStsNameUp = endStsNameUp;
	}

	@Override
	public String toString() {
		return "Timetable [arriveTimeUp=" + arriveTimeUp + ", expressLineUp=" + expressLineUp + ", startStsNameUp="
				+ startStsNameUp + ", endStsNameUp=" + endStsNameUp + "]";
	}

}
