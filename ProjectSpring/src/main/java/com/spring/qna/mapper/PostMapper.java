package com.spring.qna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.spring.qna.vo.PostVO;
import com.spring.qna.vo.UtilVO;

@Mapper
public interface PostMapper
{
	
	public void create(PostVO postVO);

	public Integer createSelectKey(PostVO postVO);

	public List<PostVO> readList(UtilVO utilVO);
	
	public PostVO readOne(Long p_no);
	
	public int update(PostVO postVO);
	
	public int delete(Long p_no);
	
	public void updateReplyCount(@Param("p_no") Long p_no, @Param("amount") int amount);

	public int getPostCount(UtilVO utilVO);
	
}