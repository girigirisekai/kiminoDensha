package ikuzo.kimi.densha.vo;

public class stationDB {

	private String station_nm2; // NM2
	private String xpoint; // 위도 x
	private String ypoint; // 경도 y

	public stationDB(String station_nm2, String xpoint, String ypoint) {
		super();
		this.station_nm2 = station_nm2;
		this.xpoint = xpoint;
		this.ypoint = ypoint;
	}

	public stationDB() {
		super();
	}

	public String getStation_nm2() {
		return station_nm2;
	}

	public void setStation_nm2(String station_nm2) {
		this.station_nm2 = station_nm2;
	}

	public String getXpoint() {
		return xpoint;
	}

	public void setXpoint(String xpoint) {
		this.xpoint = xpoint;
	}

	public String getYpoint() {
		return ypoint;
	}

	public void setYpoint(String ypoint) {
		this.ypoint = ypoint;
	}

	@Override
	public String toString() {
		return "stationDB [station_nm2=" + station_nm2 + ", xpoint=" + xpoint + ", ypoint=" + ypoint + "]";
	}

}
