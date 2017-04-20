package ikuzo.kimi.densha.vo;

public class Station {

	private String station_cd;
	private String station_nm; // 역 이름
	private String line_num;
	private String fr_code;
	private String cyber_st_code;
	private String xpoint;
	private String ypoint;
	private String xpoint_wgs;
	private String ypoint_wgs;

	public Station(String station_cd, String station_nm, String line_num, String fr_code, String cyber_st_code,
			String xpoint, String ypoint, String xpoint_wgs, String ypoint_wgs) {
		super();
		this.station_cd = station_cd;
		this.station_nm = station_nm;
		this.line_num = line_num;
		this.fr_code = fr_code;
		this.cyber_st_code = cyber_st_code;
		this.xpoint = xpoint;
		this.ypoint = ypoint;
		this.xpoint_wgs = xpoint_wgs;
		this.ypoint_wgs = ypoint_wgs;
	}

	public Station() {
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

	public String getLine_num() {
		return line_num;
	}

	public void setLine_num(String line_num) {
		this.line_num = line_num;
	}

	public String getFr_code() {
		return fr_code;
	}

	public void setFr_code(String fr_code) {
		this.fr_code = fr_code;
	}

	public String getCyber_st_code() {
		return cyber_st_code;
	}

	public void setCyber_st_code(String cyber_st_code) {
		this.cyber_st_code = cyber_st_code;
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

	@Override
	public String toString() {
		return "Station [station_cd=" + station_cd + ", station_nm=" + station_nm + ", line_num=" + line_num
				+ ", fr_code=" + fr_code + ", cyber_st_code=" + cyber_st_code + ", xpoint=" + xpoint + ", ypoint="
				+ ypoint + ", xpoint_wgs=" + xpoint_wgs + ", ypoint_wgs=" + ypoint_wgs + "]";
	}

}
