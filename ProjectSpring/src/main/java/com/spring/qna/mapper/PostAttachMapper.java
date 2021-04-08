package com.spring.qna.mapper;

import java.util.List;

import com.spring.qna.vo.PostAttachVO;

public interface PostAttachMapper
{
	
	public void create(PostAttachVO postAttachVO);
	
	public List<PostAttachVO> read(Long p_no);
	
	public void deleteList(Long p_no);
	
	public void deleteOne(String a_uuid);
	
	public List<PostAttachVO> getOldFiles();

}