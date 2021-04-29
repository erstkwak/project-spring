package com.spring.notice.dao;

import java.util.List;

import com.spring.notice.vo.BoardVO;
import com.spring.notice.vo.Criteria;

public interface BoardDao {
//게시판
//////////////////////////////////////////\
	//리스트
	List<BoardVO> list(Criteria cri);
	//상세보기
	BoardVO view(Integer nb_no);
	//글쓰기
	void write(BoardVO boardVO);
	//수정
	void update(BoardVO boardVO);
	//삭제
	void delete(Integer nb_no);
	//조회수
	void increase(Integer nb_no);
	//게시글 전체수 - 페이징처리 위해서 
	Integer getTotalCount(Criteria cri);
	
	// 게시글 하나 - 댓글의 수
	void updateReplyCnt(Integer nb_no, int amount) throws Exception;
	
}
