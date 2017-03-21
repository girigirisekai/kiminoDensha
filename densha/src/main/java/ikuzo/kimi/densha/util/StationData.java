package ikuzo.kimi.densha.util;

public class StationData {

	private String StationCode;
	private String StationFrCode;
	private String mapX;
	private String mapY;

	public StationData(String stationCode, String stationFrCode, String mapX, String mapY) {
		super();
		StationCode = stationCode;
		StationFrCode = stationFrCode;
		this.mapX = mapX;
		this.mapY = mapY;
	}

	public StationData() {
		super();
	}

	public String getStationCode() {
		return StationCode;
	}

	public void setStationCode(String stationCode) {
		StationCode = stationCode;
	}

	public String getStationFrCode() {
		return StationFrCode;
	}

	public void setStationFrCode(String stationFrCode) {
		StationFrCode = stationFrCode;
	}

	public String getMapX() {
		return mapX;
	}

	public void setMapX(String mapX) {
		this.mapX = mapX;
	}

	public String getMapY() {
		return mapY;
	}

	public void setMapY(String mapY) {
		this.mapY = mapY;
	}

	@Override
	public String toString() {
		return "StationData [StationCode=" + StationCode + ", StationFrCode=" + StationFrCode + ", mapX=" + mapX
				+ ", mapY=" + mapY + "]";
	}

}
