package com.spring.member.vo;

public class MemberVo {
	// fields
	private int    mem_idx;
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_gender;
	private String mem_birth;
	private String mem_email;
	private String mem_phone;
	private String mem_zipcode;
	private String mem_address;
	private String mem_detailaddress;
	private String mem_regdate;
	private String mem_withdraw;
	private int mem_point;
	
	// constructor
	public MemberVo() {}
	
	public MemberVo(int mem_idx, String mem_id, String mem_pw, String mem_name, String mem_gender, String mem_birth,
			String mem_email, String mem_phone, String mem_zipcode, String mem_address, String mem_detailaddress,
			String mem_regdate, String mem_withdraw, int mem_point) {
		this.mem_idx = mem_idx;
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_gender = mem_gender;
		this.mem_birth = mem_birth;
		this.mem_email = mem_email;
		this.mem_phone = mem_phone;
		this.mem_zipcode = mem_zipcode;
		this.mem_address = mem_address;
		this.mem_detailaddress = mem_detailaddress;
		this.mem_regdate = mem_regdate;
		this.mem_withdraw = mem_withdraw;
		this.mem_point = mem_point;
	}
	
	// getter & setter
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_zipcode() {
		return mem_zipcode;
	}
	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public String getMem_detailaddress() {
		return mem_detailaddress;
	}
	public void setMem_detailaddress(String mem_detailaddress) {
		this.mem_detailaddress = mem_detailaddress;
	}
	public String getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(String mem_regdate) {
		this.mem_regdate = mem_regdate;
	}
	public String getMem_withdraw() {
		return mem_withdraw;
	}
	public void setMem_withdraw(String mem_withdraw) {
		this.mem_withdraw = mem_withdraw;
	}
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}

	// toString
	@Override
	public String toString() {
		return "MemberVo [mem_idx=" + mem_idx + ", mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name
				+ ", mem_gender=" + mem_gender + ", mem_birth=" + mem_birth + ", mem_email=" + mem_email
				+ ", mem_phone=" + mem_phone + ", mem_zipcode=" + mem_zipcode + ", mem_address=" + mem_address
				+ ", mem_detailaddress=" + mem_detailaddress + ", mem_regdate=" + mem_regdate + ", mem_withdraw="
				+ mem_withdraw + ", mem_point=" + mem_point + "]";
	}
	

	
}
