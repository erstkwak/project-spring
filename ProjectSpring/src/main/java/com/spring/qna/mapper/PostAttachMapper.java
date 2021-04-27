package com.spring.qna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.qna.vo.PostAttachVO;

@Mapper
public interface PostAttachMapper
{
	
	public void create(PostAttachVO postAttachVO);
	
	public List<PostAttachVO> read(Long p_no);
	
	public void deleteList(Long p_no);
	
	public void deleteOne(String a_uuid);
	
	public List<PostAttachVO> getOldFiles();

}