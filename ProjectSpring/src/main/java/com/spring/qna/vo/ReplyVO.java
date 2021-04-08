package com.spring.qna.vo;

import java.util.Date;
import lombok.Data;

@Data
public class ReplyVO 
{
	
	private Long   r_no;
	private String r_reply;
	private String mem_id;
	private Date   r_writedate;
	private Date   r_updatedate;
	private Long   p_no;
	
}