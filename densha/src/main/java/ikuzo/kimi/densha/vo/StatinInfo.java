package ikuzo.kimi.densha.vo;

public class StatinInfo {

	private String station_cd; // 전철역코드
	private String station_nm; // 전철역명
	private String station_nm_eng; // 전철역명_영문
	private String line_num; // 호선
	private String fr_code; // 외부코드
	// (외부코드는 지하철에 역 이름과 함께 적혀있는 역번호로, 외국인의 경우 역명보다 역번호로 문의를 하는 경우가 많음)
	private String cyber_st_code; // 사이버스테이션
	// (환승역의 경우 여러 노선 중 마스터가 되는 노선의 전철역코드)
	private String branch_office_code; // 관리소코드
	private String branch_office_nm; // 관리소명
	private String regidate; // 개통일
	private String tel; // 전화번호
	private String fax; // fax번호
	private String post_code; // 우편번호
	private String address; // 주소
	private String minwon; // 현장민원소
	private String infotesk; // 관광안내소
	private String culture; // 문화공간
	private String ticket; // 항공권판매
	private String obstacle; // 장애인시설
	private String meetplace; // 만남의장소
	private String parking; // 주차장
	private String bicycle; // 자전거보관소
	private String muin; // 무인민원발급기
	private String office; // 역무실
	private String nursing; // 수유방
	private String elevator; // 엘레베이터
	private String escalator; // 에스컬레이터
	private String wheelchair; // 휠체어리프트시설
	private String speedgate; // 스피드게이트
	private String speedgatetoilet; // 화장실
	private String station_nm_han; // 역명한자
	private String ure; // 유래
	private String xpoint; // x좌표
	private String ypoint; // y좌표
	private String xpoint_wgs; // x좌표(wgs)
	private String ypoint_wgs; // y좌표(wgs)

	public StatinInfo(String station_cd, String station_nm, String station_nm_eng, String line_num, String fr_code,
			String cyber_st_code, String branch_office_code, String branch_office_nm, String regidate, String tel,
			String fax, String post_code, String address, String minwon, String infotesk, String culture, String ticket,
			String obstacle, String meetplace, String parking, String bicycle, String muin, String office,
			String nursing, String elevator, String escalator, String wheelchair, String speedgate,
			String speedgatetoilet, String station_nm_han, String ure, String xpoint, String ypoint, String xpoint_wgs,
			String ypoint_wgs) {
		super();
		this.station_cd = station_cd;
		this.station_nm = station_nm;
		this.station_nm_eng = station_nm_eng;
		this.line_num = line_num;
		this.fr_code = fr_code;
		this.cyber_st_code = cyber_st_code;
		this.branch_office_code = branch_office_code;
		this.branch_office_nm = branch_office_nm;
		this.regidate = regidate;
		this.tel = tel;
		this.fax = fax;
		this.post_code = post_code;
		this.address = address;
		this.minwon = minwon;
		this.infotesk = infotesk;
		this.culture = culture;
		this.ticket = ticket;
		this.obstacle = obstacle;
		this.meetplace = meetplace;
		this.parking = parking;
		this.bicycle = bicycle;
		this.muin = muin;
		this.office = office;
		this.nursing = nursing;
		this.elevator = elevator;
		this.escalator = escalator;
		this.wheelchair = wheelchair;
		this.speedgate = speedgate;
		this.speedgatetoilet = speedgatetoilet;
		this.station_nm_han = station_nm_han;
		this.ure = ure;
		this.xpoint = xpoint;
		this.ypoint = ypoint;
		this.xpoint_wgs = xpoint_wgs;
		this.ypoint_wgs = ypoint_wgs;
	}

	public StatinInfo() {
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

	public String getStation_nm_eng() {
		return station_nm_eng;
	}

	public void setStation_nm_eng(String station_nm_eng) {
		this.station_nm_eng = station_nm_eng;
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

	public String getBranch_office_code() {
		return branch_office_code;
	}

	public void setBranch_office_code(String branch_office_code) {
		this.branch_office_code = branch_office_code;
	}

	public String getBranch_office_nm() {
		return branch_office_nm;
	}

	public void setBranch_office_nm(String branch_office_nm) {
		this.branch_office_nm = branch_office_nm;
	}

	public String getRegidate() {
		return regidate;
	}

	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMinwon() {
		return minwon;
	}

	public void setMinwon(String minwon) {
		this.minwon = minwon;
	}

	public String getInfotesk() {
		return infotesk;
	}

	public void setInfotesk(String infotesk) {
		this.infotesk = infotesk;
	}

	public String getCulture() {
		return culture;
	}

	public void setCulture(String culture) {
		this.culture = culture;
	}

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public String getObstacle() {
		return obstacle;
	}

	public void setObstacle(String obstacle) {
		this.obstacle = obstacle;
	}

	public String getMeetplace() {
		return meetplace;
	}

	public void setMeetplace(String meetplace) {
		this.meetplace = meetplace;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getBicycle() {
		return bicycle;
	}

	public void setBicycle(String bicycle) {
		this.bicycle = bicycle;
	}

	public String getMuin() {
		return muin;
	}

	public void setMuin(String muin) {
		this.muin = muin;
	}

	public String getOffice() {
		return office;
	}

	public void setOffice(String office) {
		this.office = office;
	}

	public String getNursing() {
		return nursing;
	}

	public void setNursing(String nursing) {
		this.nursing = nursing;
	}

	public String getElevator() {
		return elevator;
	}

	public void setElevator(String elevator) {
		this.elevator = elevator;
	}

	public String getEscalator() {
		return escalator;
	}

	public void setEscalator(String escalator) {
		this.escalator = escalator;
	}

	public String getWheelchair() {
		return wheelchair;
	}

	public void setWheelchair(String wheelchair) {
		this.wheelchair = wheelchair;
	}

	public String getSpeedgate() {
		return speedgate;
	}

	public void setSpeedgate(String speedgate) {
		this.speedgate = speedgate;
	}

	public String getSpeedgatetoilet() {
		return speedgatetoilet;
	}

	public void setSpeedgatetoilet(String speedgatetoilet) {
		this.speedgatetoilet = speedgatetoilet;
	}

	public String getStation_nm_han() {
		return station_nm_han;
	}

	public void setStation_nm_han(String station_nm_han) {
		this.station_nm_han = station_nm_han;
	}

	public String getUre() {
		return ure;
	}

	public void setUre(String ure) {
		this.ure = ure;
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
		return "StatinInfo [station_cd=" + station_cd + ", station_nm=" + station_nm + ", station_nm_eng="
				+ station_nm_eng + ", line_num=" + line_num + ", fr_code=" + fr_code + ", cyber_st_code="
				+ cyber_st_code + ", branch_office_code=" + branch_office_code + ", branch_office_nm="
				+ branch_office_nm + ", regidate=" + regidate + ", tel=" + tel + ", fax=" + fax + ", post_code="
				+ post_code + ", address=" + address + ", minwon=" + minwon + ", infotesk=" + infotesk + ", culture="
				+ culture + ", ticket=" + ticket + ", obstacle=" + obstacle + ", meetplace=" + meetplace + ", parking="
				+ parking + ", bicycle=" + bicycle + ", muin=" + muin + ", office=" + office + ", nursing=" + nursing
				+ ", elevator=" + elevator + ", escalator=" + escalator + ", wheelchair=" + wheelchair + ", speedgate="
				+ speedgate + ", speedgatetoilet=" + speedgatetoilet + ", station_nm_han=" + station_nm_han + ", ure="
				+ ure + ", xpoint=" + xpoint + ", ypoint=" + ypoint + ", xpoint_wgs=" + xpoint_wgs + ", ypoint_wgs="
				+ ypoint_wgs + "]";
	}

}
