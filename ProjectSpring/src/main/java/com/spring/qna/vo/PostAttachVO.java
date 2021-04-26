package com.spring.qna.vo;

import lombok.Data;

@Data
public class PostAttachVO
{

	private String  a_uuid;
	private String  a_savepath;
	private String  a_filename;
	private boolean a_isimage;
	private Long    p_no;
	
}