package ikuzo.kimi.densha.util;

public class Exit {

	private String exitNum;
	private String info;

	public Exit(String exitNum, String info) {
		super();
		this.exitNum = exitNum;
		this.info = info;
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

	@Override
	public String toString() {
		return "Exit [exitNum=" + exitNum + ", info=" + info + "]";
	}

}
