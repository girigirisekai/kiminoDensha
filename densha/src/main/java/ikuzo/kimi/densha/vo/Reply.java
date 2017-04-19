package ikuzo.kimi.densha.vo;

public class Reply {
	
	private int replynum;
	private int boardnum;
	private String id;
	private String text;
	private String inputdate;
	
	public Reply(){}
	
	public Reply(int replynum, int boardnum, String id, String text, String inputdate) {
		super();
		this.replynum = replynum;
		this.boardnum = boardnum;
		this.id = id;
		this.text = text;
		this.inputdate = inputdate;
	}
	/**
	 * @return the replynum
	 */
	public int getReplynum() {
		return replynum;
	}
	/**
	 * @param replynum the replynum to set
	 */
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	/**
	 * @return the boardnum
	 */
	public int getBoardnum() {
		return boardnum;
	}
	/**
	 * @param boardnum the boardnum to set
	 */
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}
	/**
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}
	/**
	 * @return the inputdate
	 */
	public String getInputdate() {
		return inputdate;
	}
	/**
	 * @param inputdate the inputdate to set
	 */
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Reply [replynum=" + replynum + ", boardnum=" + boardnum + ", id=" + id + ", text=" + text
				+ ", inputdate=" + inputdate + "]";
	}
	
	
	

}
