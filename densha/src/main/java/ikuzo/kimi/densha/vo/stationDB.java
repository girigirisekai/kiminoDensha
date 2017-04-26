package ikuzo.kimi.densha.vo;

public class stationDB {

	private String station_nm; // NM1
	private String station_nm2; // NM2
	private String station_cd; // NM2
	private String xpoint_wgs; // 위도 x
	private String ypoint_wgs; // 경도 y
	private String line_num;
	private String cyber_st_code;

	public stationDB(String station_nm, String station_nm2, String station_cd, String xpoint_wgs, String ypoint_wgs,
			String line_num, String cyber_st_code) {
		super();
		this.station_nm = station_nm;
		this.station_nm2 = station_nm2;
		this.station_cd = station_cd;
		this.xpoint_wgs = xpoint_wgs;
		this.ypoint_wgs = ypoint_wgs;
		this.line_num = line_num;
		this.cyber_st_code = cyber_st_code;
	}

	public stationDB() {
		super();
	}

	public String getStation_cd() {
		return station_cd;
	}

	public void setStation_cd(String station_cd) {
		this.station_cd = station_cd;
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

	public String getXpoint_wgs() {
		return xpoint_wgs;
	}

	public void setXpoint_wgs(String xpoint_wgs) {
		this.xpoint_wgs = xpoint_wgs;
	}

	public String getYpoint_wgs() {
		return ypoint_wgs;
	}

	public void setYpoint_wgs(String ypoint_wgs) {
		this.ypoint_wgs = ypoint_wgs;
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
		return "stationDB [station_nm=" + station_nm + ", station_nm2=" + station_nm2 + ", station_cd=" + station_cd
				+ ", xpoint_wgs=" + xpoint_wgs + ", ypoint_wgs=" + ypoint_wgs + ", line_num=" + line_num
				+ ", cyber_st_code=" + cyber_st_code + "]";
	}

}
