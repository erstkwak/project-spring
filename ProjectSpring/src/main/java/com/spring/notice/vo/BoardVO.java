package com.spring.notice.vo;

import java.util.Date;

public class BoardVO {
	private String mem_id;
	private int    nb_no ;
	private String nb_title;
	private String nb_content;
	private Date   nb_regdate;
	private Date   nb_modate;
	private int    nb_replycount;
	private int    nb_count;
	private int    nb_likecheck;
	private int    nb_available;
	
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}

	public BoardVO(String mem_id, int nb_no, String nb_title, String nb_content, Date nb_regdate, Date nb_modate,
			int nb_replycount, int nb_count, int nb_likecheck, int nb_available) {
		this.mem_id = mem_id;
		this.nb_no = nb_no;
		this.nb_title = nb_title;
		this.nb_content = nb_content;
		this.nb_regdate = nb_regdate;
		this.nb_modate = nb_modate;
		this.nb_replycount = nb_replycount;
		this.nb_count = nb_count;
		this.nb_likecheck = nb_likecheck;
		this.nb_available = nb_available;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getNb_no() {
		return nb_no;
	}

	public void setNb_no(int nb_no) {
		this.nb_no = nb_no;
	}

	public String getNb_title() {
		return nb_title;
	}

	public void setNb_title(String nb_title) {
		this.nb_title = nb_title;
	}

	public String getNb_content() {
		return nb_content;
	}

	public void setNb_content(String nb_content) {
		this.nb_content = nb_content;
	}

	public Date getNb_regdate() {
		return nb_regdate;
	}

	public void setNb_regdate(Date nb_regdate) {
		this.nb_regdate = nb_regdate;
	}

	public Date getNb_modate() {
		return nb_modate;
	}

	public void setNb_modate(Date nb_modate) {
		this.nb_modate = nb_modate;
	}

	public int getNb_replycount() {
		return nb_replycount;
	}

	public void setNb_replycount(int nb_replycount) {
		this.nb_replycount = nb_replycount;
	}

	public int getNb_count() {
		return nb_count;
	}

	public void setNb_count(int nb_count) {
		this.nb_count = nb_count;
	}

	public int getNb_likecheck() {
		return nb_likecheck;
	}

	public void setNb_likecheck(int nb_likecheck) {
		this.nb_likecheck = nb_likecheck;
	}

	public int getNb_available() {
		return nb_available;
	}

	public void setNb_available(int nb_available) {
		this.nb_available = nb_available;
	}

	@Override
	public String toString() {
		return "NoticeBoardVO [mem_id=" + mem_id + ", nb_no=" + nb_no + ", nb_title=" + nb_title + ", nb_content="
				+ nb_content + ", nb_regdate=" + nb_regdate + ", nb_modate=" + nb_modate + ", nb_replycount="
				+ nb_replycount + ", nb_count=" + nb_count + ", nb_likecheck=" + nb_likecheck + ", nb_available="
				+ nb_available + "]";
	}
	
}
