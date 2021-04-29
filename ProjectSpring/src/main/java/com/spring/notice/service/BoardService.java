package com.spring.notice.service;

import java.util.List;

import com.spring.notice.vo.BoardVO;
import com.spring.notice.vo.Criteria;

public interface BoardService {
//게시판
//////////////////////////
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
	
	//조회수 - 트랜젝션처리 seriveImpl
	
	//게시글 전체수 
	Integer getTotalCount(Criteria cri);
	
}
