package com.spring.notice.dao;

import java.util.List;

import com.spring.notice.vo.BoardReplyVO;
import com.spring.notice.vo.Criteria;

public interface BReplyDao {
	//댓글 CRUD
	List<BoardReplyVO> list(Integer nb_no) throws Exception;

    void create(BoardReplyVO replyVO) throws Exception;

    void update(BoardReplyVO replyVO) throws Exception;

    void delete(Integer nr_no) throws Exception;
    
    //댓글 페이징
    List<BoardReplyVO> listPaging(Integer nb_no, Criteria criteria) throws Exception;
    
    int countReplies(Integer nb_no) throws Exception;
    
    //댓글의 게시글 번호 조회
	int getArticleNo(Integer nr_no) throws Exception;
    
}
