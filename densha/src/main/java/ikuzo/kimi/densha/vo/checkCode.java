package ikuzo.kimi.densha.vo;

public class checkCode {

	String id;				//인증 확인 임시 아이디
	String password;		//인증 확인 임시 비밀번호
	String question;		//인증 확인 임시 비밀번호 확인 문제
	String answer;			//인증 확인 임시 비밀번호 확인 답안
	String checkCode;		//인증 확인 랜덤 인증코드
	String checkSendingTime;//인증 확인 버튼 클릭했을 때 시간

	public checkCode(String id, String password, String question, String answer, String checkCode,
			String checkSendingTime) {
		super();
		this.id = id;
		this.password = password;
		this.question = question;
		this.answer = answer;
		this.checkCode = checkCode;
		this.checkSendingTime = checkSendingTime;
	}

	public checkCode() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}

	public String getCheckSendingTime() {
		return checkSendingTime;
	}

	public void setCheckSendingTime(String checkSendingTime) {
		this.checkSendingTime = checkSendingTime;
	}

	@Override
	public String toString() {
		return "checkCode [id=" + id + ", password=" + password + ", question=" + question + ", answer=" + answer
				+ ", checkCode=" + checkCode + ", checkSendingTime=" + checkSendingTime + "]";
	}

}
