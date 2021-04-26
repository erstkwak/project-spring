package com.spring.pboard.vo;

import java.util.List;

import lombok.Data;

@Data
public class CommentPageVO {

	private int replyCount;
	private List<CommentVO> list;
	
	  
}
