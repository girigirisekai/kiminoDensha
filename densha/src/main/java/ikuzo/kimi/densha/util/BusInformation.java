package ikuzo.kimi.densha.util;

public class BusInformation {

	private String num;
	private String type;
	private String exit;

	public BusInformation(String num, String type, String exit) {
		super();
		this.num = num;
		this.type = type;
		this.exit = exit;
	}

	public BusInformation() {
		super();
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getExit() {
		return exit;
	}

	public void setExit(String exit) {
		this.exit = exit;
	}

	@Override
	public String toString() {
		return "BusInformation [num=" + num + ", type=" + type + ", exit=" + exit + "]";
	}

}
