package com.spring.pboard.vo;

import lombok.Data;

@Data
public class CommentVO {
	private int idx;
	private String mem_id;
	private int comment_num;
	private String comment_content;
	private String comment_regdate;
	
	
}
