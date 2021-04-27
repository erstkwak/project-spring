package com.spring.rest.vo;

public class Address {
	private String currentPage; // 현재 페이지 번호 
	private String countPerPage; //체이지당 출력할 결과 
	private String keyword; // 주소 검색어
	
	public String getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
	
	public String getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(String countPerPage) {
		this.countPerPage = countPerPage;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
