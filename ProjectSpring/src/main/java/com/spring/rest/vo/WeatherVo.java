package com.spring.rest.vo;

public class WeatherVo {
	private String LAT;
	private String LNG;
	private String MODE;
	
	public WeatherVo() {
		// TODO Auto-generated constructor stub
	}

	public WeatherVo(String lAT, String lNG, String mODE) {
		super();
		LAT = lAT;
		LNG = lNG;
		MODE = mODE;
	}

	public String getLAT() {
		return LAT;
	}

	public void setLAT(String lAT) {
		LAT = lAT;
	}

	public String getLNG() {
		return LNG;
	}

	public void setLNG(String lNG) {
		LNG = lNG;
	}

	public String getMODE() {
		return MODE;
	}

	public void setMODE(String mODE) {
		MODE = mODE;
	}

	@Override
	public String toString() {
		return "WeatherVo [LAT=" + LAT + ", LNG=" + LNG + ", MODE=" + MODE + "]";
	}
	
}
