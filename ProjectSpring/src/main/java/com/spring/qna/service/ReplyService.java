package com.spring.qna.service;

import java.util.List;

import com.spring.qna.vo.ReplyPageVO;
import com.spring.qna.vo.ReplyVO;
import com.spring.qna.vo.UtilVO;

public interface ReplyService
{
	
	public int register(ReplyVO replyVO);

	public List<ReplyVO> getList(UtilVO utilVO, Long p_no);

	public ReplyVO getOne(Long r_no);

	public int modify(ReplyVO replyVO);

	public int remove(Long r_no);

	public ReplyPageVO getListPage(UtilVO utilVO, Long p_no);

}
