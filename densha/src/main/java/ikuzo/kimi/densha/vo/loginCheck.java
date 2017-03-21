package ikuzo.kimi.densha.vo;

public class loginCheck {

	String id; // 접속자 아이디
	String ipAddress; // 접속자 아이피주소
	String recentLogin; // 접속자 최근 접속 기록

	public loginCheck(String id, String ipAddress, String recentLogin) {
		super();
		this.id = id;
		this.ipAddress = ipAddress;
		this.recentLogin = recentLogin;
	}

	public loginCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getRecentLogin() {
		return recentLogin;
	}

	public void setRecentLogin(String recentLogin) {
		this.recentLogin = recentLogin;
	}

	@Override
	public String toString() {
		return "loginCheck [id=" + id + ", ipAddress=" + ipAddress + ", recentLogin=" + recentLogin + "]";
	}

}
