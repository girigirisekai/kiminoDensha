package ikuzo.kimi.densha.vo;

public class favorite {

	String id; // 즐겨찾기 등록한 아이디
	String favoriteName; // 즐겨찾기 명
	String stationCode; // 즐겨찾기 역 코드번호
	String favoriteOrder; // 즐겨찾기 등록 시간

	public favorite(String id, String favoriteName, String stationCode, String favoriteOrder) {
		super();
		this.id = id;
		this.favoriteName = favoriteName;
		this.stationCode = stationCode;
		this.favoriteOrder = favoriteOrder;
	}

	public favorite() {
		super();
		// TODO Auto-generated constructor stub
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

	@Override
	public String toString() {
		return "favorite [id=" + id + ", favoriteName=" + favoriteName + ", stationCode=" + stationCode
				+ ", favoriteOrder=" + favoriteOrder + "]";
	}

}
