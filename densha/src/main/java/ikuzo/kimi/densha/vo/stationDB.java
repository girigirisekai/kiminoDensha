package ikuzo.kimi.densha.vo;

public class stationDB {

	private String station_nm; // NM1
	private String station_nm2; // NM2
	private String xpoint; // 위도 x
	private String ypoint; // 경도 y
	private String line_num;
	private String cyber_st_code;

	public stationDB() {
		super();
	}

	public stationDB(String station_nm, String station_nm2, String xpoint, String ypoint, String line_num,
			String cyber_st_code) {
		super();
		this.station_nm = station_nm;
		this.station_nm2 = station_nm2;
		this.xpoint = xpoint;
		this.ypoint = ypoint;
		this.line_num = line_num;
		this.cyber_st_code = cyber_st_code;
	}

	public String getStation_nm() {
		return station_nm;
	}

	public void setStation_nm(String station_nm) {
		this.station_nm = station_nm;
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

	public String getLine_num() {
		return line_num;
	}

	public void setLine_num(String line_num) {
		this.line_num = line_num;
	}

	public String getCyber_st_code() {
		return cyber_st_code;
	}

	public void setCyber_st_code(String cyber_st_code) {
		this.cyber_st_code = cyber_st_code;
	}

	@Override
	public String toString() {
		return "stationDB [station_nm=" + station_nm + ", station_nm2=" + station_nm2 + ", xpoint=" + xpoint
				+ ", ypoint=" + ypoint + ", line_num=" + line_num + ", cyber_st_code=" + cyber_st_code + "]";
	}

}
