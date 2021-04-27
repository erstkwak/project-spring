package com.spring.qna.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.spring.qna.mapper.PostMapper;
import com.spring.qna.mapper.ReplyMapper;
import com.spring.qna.vo.ReplyPageVO;
import com.spring.qna.vo.ReplyVO;
import com.spring.qna.vo.UtilVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;

	@Autowired
	private PostMapper postMapper;

	@Transactional
	public int register(ReplyVO replyVO) {
		postMapper.updateReplyCount(replyVO.getP_no(), 1);
		return replyMapper.create(replyVO);
	}

	public List<ReplyVO> getList(UtilVO utilVO, Long p_no) {
		return replyMapper.readList(utilVO, p_no);
	}

	public ReplyVO getOne(Long r_no) {
		return replyMapper.readOne(r_no);
	}

	public int modify(ReplyVO replyVO) {
		return replyMapper.update(replyVO);
	}

	@Transactional
	public int remove(Long r_no) {
		ReplyVO replyVO = replyMapper.readOne(r_no);
		postMapper.updateReplyCount(replyVO.getP_no(), -1);
		return replyMapper.delete(r_no);
	}

	public ReplyPageVO getListPage(UtilVO utilVO, Long p_no) {
		return new ReplyPageVO(replyMapper.getReplyCount(p_no), replyMapper.readList(utilVO, p_no));
	}

}