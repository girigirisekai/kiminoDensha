package ikuzo.kimi.densha.vo;

public class Member {

	String id;					// 유저 아이디
	String password;			// 유저 패스워드
	String type;				// 사용자 or 관리자
	String question;			// 비밀번호 확인 문제
	String answer;				// 비밀번호 확인 문제 답

	public Member(String id, String password, String type, String question, String answer) {
		super();
		this.id = id;
		this.password = password;
		this.type = type;
		this.question = question;
		this.answer = answer;
	}

	public Member() {
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", type=" + type + ", question=" + question + ", answer="
				+ answer + "]";
	}

}
