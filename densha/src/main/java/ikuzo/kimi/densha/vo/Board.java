package ikuzo.kimi.densha.vo;

public class Board {
	
	private int boardnum;
	private String id;
	private String type;
	private String title;
	private String content;
	private String inputdate;
	private int hits;
	private String originalfile;
	private String savedfile;
	private String secret;
	private String secretpassword;
	private int totalreply;
	
	public Board(){};
	
	public Board(int boardnum, String id, String type, String title, String content, String inputdate, int hits,
			String originalfile, String savedfile, String secret, String secretpassword, int totalreply) {
		super();
		this.boardnum = boardnum;
		this.id = id;
		this.type = type;
		this.title = title;
		this.content = content;
		this.inputdate = inputdate;
		this.hits = hits;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
		this.secret = secret;
		this.secretpassword = secretpassword;
		this.totalreply = totalreply;
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
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
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

	/**
	 * @return the hits
	 */
	public int getHits() {
		return hits;
	}

	/**
	 * @param hits the hits to set
	 */
	public void setHits(int hits) {
		this.hits = hits;
	}

	/**
	 * @return the originalfile
	 */
	public String getOriginalfile() {
		return originalfile;
	}

	/**
	 * @param originalfile the originalfile to set
	 */
	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}

	/**
	 * @return the savedfile
	 */
	public String getSavedfile() {
		return savedfile;
	}

	/**
	 * @param savedfile the savedfile to set
	 */
	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}

	/**
	 * @return the secret
	 */
	public String getSecret() {
		return secret;
	}

	/**
	 * @param secret the secret to set
	 */
	public void setSecret(String secret) {
		this.secret = secret;
	}

	/**
	 * @return the secretpassword
	 */
	public String getSecretpassword() {
		return secretpassword;
	}

	/**
	 * @param secretpassword the secretpassword to set
	 */
	public void setSecretpassword(String secretpassword) {
		this.secretpassword = secretpassword;
	}

	/**
	 * @return the totalreply
	 */
	public int getTotalreply() {
		return totalreply;
	}

	/**
	 * @param totalreply the totalreply to set
	 */
	public void setTotalreply(int totalreply) {
		this.totalreply = totalreply;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Board [boardnum=" + boardnum + ", id=" + id + ", type=" + type + ", title=" + title + ", content="
				+ content + ", inputdate=" + inputdate + ", hits=" + hits + ", originalfile=" + originalfile
				+ ", savedfile=" + savedfile + ", secret=" + secret + ", secretpassword=" + secretpassword
				+ ", totalreply=" + totalreply + "]";
	}
	
	

}
