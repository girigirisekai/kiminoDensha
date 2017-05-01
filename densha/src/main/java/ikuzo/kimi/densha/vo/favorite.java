package ikuzo.kimi.densha.vo;

public class favorite {

	String id; // 즐겨찾기 등록한 아이디
	String favoriteName; // 즐겨찾기 명
	String stationCode; // 즐겨찾기 역 코드번호
	String favoriteOrder; // 즐겨찾기 등록 시간
	String line; // 호선
	String fcode; // 외부코드

	public favorite(String id, String favoriteName, String stationCode, String favoriteOrder, String line,
			String fcode) {
		super();
		this.id = id;
		this.favoriteName = favoriteName;
		this.stationCode = stationCode;
		this.favoriteOrder = favoriteOrder;
		this.line = line;
		this.fcode = fcode;
	}

	public favorite() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFavoriteName() {
		return favoriteName;
	}

	public void setFavoriteName(String favoriteName) {
		this.favoriteName = favoriteName;
	}

	public String getStationCode() {
		return stationCode;
	}

	public void setStationCode(String stationCode) {
		this.stationCode = stationCode;
	}

	public String getFavoriteOrder() {
		return favoriteOrder;
	}

	public void setFavoriteOrder(String favoriteOrder) {
		this.favoriteOrder = favoriteOrder;
	}

	public String getLine() {
		return line;
	}

	public void setLine(String line) {
		this.line = line;
	}

	public String getFcode() {
		return fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}

	@Override
	public String toString() {
		return "favorite [id=" + id + ", favoriteName=" + favoriteName + ", stationCode=" + stationCode
				+ ", favoriteOrder=" + favoriteOrder + ", line=" + line + ", fcode=" + fcode + "]";
	}

}
