package com.spring.qna.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.spring.qna.vo.ReplyVO;
import com.spring.qna.vo.UtilVO;

public interface ReplyMapper
{

	public int create(ReplyVO replyVO);
	
	public List<ReplyVO> readList(@Param("util") UtilVO util, @Param("p_no") Long p_no);

	public ReplyVO readOne(Long p_no);
	
	public int update(ReplyVO replyVO);

	public int delete(Long p_no);

	public int getReplyCount(Long p_no);
	
}