package com.spring.notice.vo;

import java.util.Date;

public class BoardReplyVO {
	
	private String mem_id;
	private int    nr_no ;
	private String nr_content;
	private Date   nr_regdate;
	private Date   nr_modate;
	private int    nr_available;
	private int    nb_no;
	
	public BoardReplyVO() {
		// TODO Auto-generated constructor stub
	}

	public BoardReplyVO(String mem_id, int nr_no, String nr_content, Date nr_regdate, Date nr_modate,
			int nr_available, int nb_no) {
		super();
		this.mem_id = mem_id;
		this.nr_no = nr_no;
		this.nr_content = nr_content;
		this.nr_regdate = nr_regdate;
		this.nr_modate = nr_modate;
		this.nr_available = nr_available;
		this.nb_no = nb_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getNr_no() {
		return nr_no;
	}

	public void setNr_no(int nr_no) {
		this.nr_no = nr_no;
	}

	public String getNr_content() {
		return nr_content;
	}

	public void setNr_content(String nr_content) {
		this.nr_content = nr_content;
	}

	public Date getNr_regdate() {
		return nr_regdate;
	}

	public void setNr_regdate(Date nr_regdate) {
		this.nr_regdate = nr_regdate;
	}

	public Date getNr_modate() {
		return nr_modate;
	}

	public void setNr_modate(Date nr_modate) {
		this.nr_modate = nr_modate;
	}

	public int getNr_available() {
		return nr_available;
	}

	public void setNr_available(int nr_available) {
		this.nr_available = nr_available;
	}

	public int getNb_no() {
		return nb_no;
	}

	public void setNb_no(int nb_no) {
		this.nb_no = nb_no;
	}

	@Override
	public String toString() {
		return "NoticeBoardReplyVO [mem_id=" + mem_id + ", nr_no=" + nr_no + ", nr_content=" + nr_content
				+ ", nr_regdate=" + nr_regdate + ", nr_modate=" + nr_modate + ", nr_available=" + nr_available
				+ ", nb_no=" + nb_no + "]";
	}

	
}
