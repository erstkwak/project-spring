package com.spring.notice.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.notice.dao.BReplyDao;
import com.spring.notice.vo.BoardReplyVO;
import com.spring.notice.vo.Criteria;

@Repository("bReplyDao")
public class BReplyDaoImpl implements BReplyDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardReplyVO> list(Integer nb_no) throws Exception {
		return sqlSession.selectList("BReplyMapper.list", nb_no);
	}

	@Override
	public void create(BoardReplyVO replyVO) throws Exception {
		sqlSession.insert("BReplyMapper.create", replyVO);
	}

	@Override
	public void update(BoardReplyVO replyVO) throws Exception {
		sqlSession.update("BReplyMapper.update", replyVO);
	}

	@Override
	public void delete(Integer nr_no) throws Exception {
		sqlSession.delete("BReplyMapper.delete", nr_no);
	}

//댓글 페이징
	@Override
	public List<BoardReplyVO> listPaging(Integer nb_no, Criteria criteria) throws Exception {

	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("nb_no", nb_no);
	    paramMap.put("criteria", criteria);

	    return sqlSession.selectList("BReplyMapper.listPaging", paramMap);
	}

	@Override
	public int countReplies(Integer nb_no) throws Exception {
	    return sqlSession.selectOne("BReplyMapper.countReplies", nb_no);
	}
	
//댓글의 게시글 번호 조회 
	// ReplyDAOImpl
	@Override
	public int getArticleNo(Integer nr_no) throws Exception {
	    return sqlSession.selectOne("BReplyMapper.getArticleNo", nr_no);
	}
}
