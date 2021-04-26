package com.spring.pboard.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.pboard.dao.CommentDao;
import com.spring.pboard.service.CommentService;
import com.spring.pboard.vo.CommentVO;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	
	@Inject
	private CommentDao commentDao;
	
	    @Override
	    public List<CommentVO> list(int idx) throws Exception {
	    	return commentDao.list(idx);
	    }

		@Override
		public int write(HashMap<String, Object> map) throws Exception {
			return commentDao.write(map);
		}

		@Override
		public void modify(CommentVO vo) throws Exception {
			commentDao.modify(vo);
		}

		@Override
		public void delete(CommentVO vo) throws Exception {
			commentDao.delete(vo);
		}

}
