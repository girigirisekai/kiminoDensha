package ikuzo.kimi.densha.vo;

public class StationNearInfo {

	private String line_num; // 호선
	private String line_name; // 호선명
	private String fr_code; // 외부코드
	// (외부코드는 지하철에 역 이름과 함께 적혀있는 역번호로, 외국인의 경우 역명보다 역번호로 문의를 하는 경우가 많음)
	private String station_cd; // 전철역코드
	private String station_nm; // 전철역명
	private String exit_no; // 출구번호
	private String seq; // 일련번호
	private String area_nm; // 역세권명
	private String tel; // 전화번호
	private String homepage; // 홈페이지
	private String post_cd; // 우편번호
	private String address; // 주소
	private String point_x; // x좌표
	private String point_y; // y좌표
	private String tooltip; // 툴팁
	private String vr_path; // vr 경로
	private String icon_cd; // 아이콘
	private String show_yn; // 출력여부

	public StationNearInfo(String line_num, String line_name, String fr_code, String station_cd, String station_nm,
			String exit_no, String seq, String area_nm, String tel, String homepage, String post_cd, String address,
			String point_x, String point_y, String tooltip, String vr_path, String icon_cd, String show_yn) {
		super();
		this.line_num = line_num;
		this.line_name = line_name;
		this.fr_code = fr_code;
		this.station_cd = station_cd;
		this.station_nm = station_nm;
		this.exit_no = exit_no;
		this.seq = seq;
		this.area_nm = area_nm;
		this.tel = tel;
		this.homepage = homepage;
		this.post_cd = post_cd;
		this.address = address;
		this.point_x = point_x;
		this.point_y = point_y;
		this.tooltip = tooltip;
		this.vr_path = vr_path;
		this.icon_cd = icon_cd;
		this.show_yn = show_yn;
	}

	public StationNearInfo() {
		super();
	}

	public String getLine_num() {
		return line_num;
	}

	public void setLine_num(String line_num) {
		this.line_num = line_num;
	}

	public String getLine_name() {
		return line_name;
	}

	public void setLine_name(String line_name) {
		this.line_name = line_name;
	}

	public String getFr_code() {
		return fr_code;
	}

	public void setFr_code(String fr_code) {
		this.fr_code = fr_code;
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

	public String getExit_no() {
		return exit_no;
	}

	public void setExit_no(String exit_no) {
		this.exit_no = exit_no;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getArea_nm() {
		return area_nm;
	}

	public void setArea_nm(String area_nm) {
		this.area_nm = area_nm;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getPost_cd() {
		return post_cd;
	}

	public void setPost_cd(String post_cd) {
		this.post_cd = post_cd;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPoint_x() {
		return point_x;
	}

	public void setPoint_x(String point_x) {
		this.point_x = point_x;
	}

	public String getPoint_y() {
		return point_y;
	}

	public void setPoint_y(String point_y) {
		this.point_y = point_y;
	}

	public String getTooltip() {
		return tooltip;
	}

	public void setTooltip(String tooltip) {
		this.tooltip = tooltip;
	}

	public String getVr_path() {
		return vr_path;
	}

	public void setVr_path(String vr_path) {
		this.vr_path = vr_path;
	}

	public String getIcon_cd() {
		return icon_cd;
	}

	public void setIcon_cd(String icon_cd) {
		this.icon_cd = icon_cd;
	}

	public String getShow_yn() {
		return show_yn;
	}

	public void setShow_yn(String show_yn) {
		this.show_yn = show_yn;
	}

	@Override
	public String toString() {
		return "StationNearInfo [line_num=" + line_num + ", line_name=" + line_name + ", fr_code=" + fr_code
				+ ", station_cd=" + station_cd + ", station_nm=" + station_nm + ", exit_no=" + exit_no + ", seq=" + seq
				+ ", area_nm=" + area_nm + ", tel=" + tel + ", homepage=" + homepage + ", post_cd=" + post_cd
				+ ", address=" + address + ", point_x=" + point_x + ", point_y=" + point_y + ", tooltip=" + tooltip
				+ ", vr_path=" + vr_path + ", icon_cd=" + icon_cd + ", show_yn=" + show_yn + "]";
	}

}
