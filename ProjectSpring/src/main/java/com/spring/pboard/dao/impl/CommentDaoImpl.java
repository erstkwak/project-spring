package com.spring.pboard.dao.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pboard.dao.CommentDao;
import com.spring.pboard.vo.CommentVO;

@Repository("commentDao")
public class CommentDaoImpl implements CommentDao {

	@Autowired
	private  SqlSession sqlSession;
	
    @Inject
    public CommentDaoImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	// 댓글 조회
	@Override
	public List<CommentVO> list(int idx) throws Exception {
		return sqlSession.selectList("Comment.CommentList", idx);
	}

	// 댓글 작성
	@Override
	public int write(HashMap<String, Object> map) throws Exception {
		return sqlSession.insert("Comment.CommentInsert", map);
	}

	// 댓글 수정
	@Override
	public void modify(CommentVO vo) throws Exception {
		sqlSession.update("Comment.CommentUpdate", vo);
	}

	// 댓글 삭제
	@Override
	public void delete(CommentVO vo) throws Exception {
		sqlSession.delete("Comment.CommentDelete", vo);
	}
}
