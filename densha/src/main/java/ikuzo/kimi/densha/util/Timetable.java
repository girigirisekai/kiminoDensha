package ikuzo.kimi.densha.util;

public class Timetable {

	private String arriveTime; // 도착시간
	private String expressLine; // 급행선
	private String startStsName; // 출발역
	private String endStsName; // 도착역

	public Timetable(String arriveTime, String expressLine, String startStsName, String endStsName) {
		super();
		this.arriveTime = arriveTime;
		this.expressLine = expressLine;
		this.startStsName = startStsName;
		this.endStsName = endStsName;
	}

	public Timetable() {
		super();
	}

	public String getArriveTime() {
		return arriveTime;
	}

	public void setArriveTime(String arriveTime) {
		this.arriveTime = arriveTime;
	}

	public String getExpressLine() {
		return expressLine;
	}

	public void setExpressLine(String expressLine) {
		this.expressLine = expressLine;
	}

	public String getStartStsName() {
		return startStsName;
	}

	public void setStartStsName(String startStsName) {
		this.startStsName = startStsName;
	}

	public String getEndStsName() {
		return endStsName;
	}

	public void setEndStsName(String endStsName) {
		this.endStsName = endStsName;
	}

	@Override
	public String toString() {
		return "Timetable [arriveTime=" + arriveTime + ", expressLine=" + expressLine + ", startStsName=" + startStsName
				+ ", endStsName=" + endStsName + "]";
	}

}
