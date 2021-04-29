package com.spring.notice.service;

import java.util.List;

import com.spring.notice.vo.BoardReplyVO;
import com.spring.notice.vo.Criteria;

public interface BReplyService {
	
	List<BoardReplyVO> list(Integer nb_no) throws Exception;

    void create(BoardReplyVO replyVO) throws Exception;

    void update(BoardReplyVO replyVO) throws Exception;

    void delete(Integer nr_no) throws Exception;
    
//댓글페이지
    List<BoardReplyVO> getRepliesPaging(Integer nb_no, Criteria criteria) throws Exception;

    int countReplies(Integer nb_no) throws Exception;
//댓글의 게시글 번호 조회 	
    // 댓글 등록
	void addReply(BoardReplyVO replyVO) throws Exception;
	// 댓글 삭제
	void removeReply(Integer nr_no) throws Exception;
    
}
