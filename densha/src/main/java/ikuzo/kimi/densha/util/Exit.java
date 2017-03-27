package ikuzo.kimi.densha.util;

public class Exit {

	private String exitNum;
	private String info;
	private String allExit;
	public Exit(String exitNum, String info, String allExit) {
		super();
		this.exitNum = exitNum;
		this.info = info;
		this.allExit = allExit;
	}
	public Exit() {
		super();
	}
	public String getExitNum() {
		return exitNum;
	}
	public void setExitNum(String exitNum) {
		this.exitNum = exitNum;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getAllExit() {
		return allExit;
	}
	public void setAllExit(String allExit) {
		this.allExit = allExit;
	}
	@Override
	public String toString() {
		return "Exit [exitNum=" + exitNum + ", info=" + info + ", allExit=" + allExit + "]";
	}

	
	

}
