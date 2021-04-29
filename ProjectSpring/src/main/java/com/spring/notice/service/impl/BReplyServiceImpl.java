package com.spring.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.notice.dao.BReplyDao;
import com.spring.notice.dao.BoardDao;
import com.spring.notice.service.BReplyService;
import com.spring.notice.vo.BoardReplyVO;
import com.spring.notice.vo.Criteria;

@Service("bReplyService")
public class BReplyServiceImpl implements BReplyService{
	
	@Autowired
	private BReplyDao replyDAO;
	
	@Autowired
	private BoardDao boardDAO;
	
	@Override
	public List<BoardReplyVO> list(Integer nb_no) throws Exception {
		return replyDAO.list(nb_no);
	}

	@Override
	public void create(BoardReplyVO replyVO) throws Exception {
		replyDAO.create(replyVO);
	}

	@Override
	public void update(BoardReplyVO replyVO) throws Exception {
		replyDAO.update(replyVO);
	}

	@Override
	public void delete(Integer nr_no) throws Exception {
		replyDAO.delete(nr_no);
	}
	
//댓글페이징
	@Override
	public List<BoardReplyVO> getRepliesPaging(Integer nb_no, Criteria criteria) throws Exception {
	    return replyDAO.listPaging(nb_no, criteria);
	}

	@Override
	public int countReplies(Integer nb_no) throws Exception {
		 return replyDAO.countReplies(nb_no);
	}
	
//댓글의 게시글 번호 조회 	
	// 댓글 등록
	@Transactional // 트랜잭션 처리
	@Override
	public void addReply(BoardReplyVO replyVO) throws Exception {
	    replyDAO.create(replyVO); // 댓글 등록
	    boardDAO.updateReplyCnt(replyVO.getNb_no(), 1); // 댓글 갯수 증가
	}
	// 댓글 삭제
	@Transactional // 트랜잭션 처리
	@Override
	public void removeReply(Integer nr_no) throws Exception {
	    int nb_no = replyDAO.getArticleNo(nr_no); // 댓글의 게시물 번호 조회
	    replyDAO.delete(nr_no); // 댓글 삭제
	    boardDAO.updateReplyCnt(nb_no, -1); // 댓글 갯수 감소
	}
	
	
}
