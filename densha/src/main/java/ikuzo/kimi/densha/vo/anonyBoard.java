package ikuzo.kimi.densha.vo;

public class anonyBoard {

	private int num; // rownum
	private String text; // text
	private String name; // id
	private String writedate; // 글 쓴날짜
	private String originalfile; // 파일
	private String savefile; // 저장된 파일

	public anonyBoard() {
		super();
	}

	public anonyBoard(int num, String text, String name, String writedate, String originalfile, String savefile) {
		super();
		this.num = num;
		this.text = text;
		this.name = name;
		this.writedate = writedate;
		this.originalfile = originalfile;
		this.savefile = savefile;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getOriginalfile() {
		return originalfile;
	}

	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}

	public String getSavefile() {
		return savefile;
	}

	public void setSavefile(String savefile) {
		this.savefile = savefile;
	}

	@Override
	public String toString() {
		return "anonyBoard [num=" + num + ", text=" + text + ", name=" + name + ", writedate=" + writedate
				+ ", originalfile=" + originalfile + ", savefile=" + savefile + "]";
	}

}
