package com.spring.qna.vo;

import java.util.Date;
import java.util.List;
import lombok.Data;

@Data
public class PostVO
{

	private Long   p_no;
	private String p_title;
	private String p_content;
	private String mem_id;
	private int    p_replycount;
	private Date   p_writedate;
	private Date   p_updatedate;
	
	private List<PostAttachVO> attachList;

}