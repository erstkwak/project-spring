package com.spring.pboard.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.pboard.vo.CommentVO;

public interface CommentDao {
	
	// 댓글 조회
	public List<CommentVO> list(int idx) throws Exception;
	
	// 댓글 조회
	public int write(HashMap<String, Object> map) throws Exception;
	
	// 댓글 수정
	public void modify(CommentVO vo) throws Exception;
	
	// 댓글 삭제
	public void delete(CommentVO vo) throws Exception;
}
