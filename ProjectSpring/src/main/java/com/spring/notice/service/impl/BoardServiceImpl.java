package com.spring.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.notice.dao.BoardDao;
import com.spring.notice.service.BoardService;
import com.spring.notice.vo.BoardVO;
import com.spring.notice.vo.Criteria;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao boardDao;
	
//게시판 
////////////////////////
    @Override
    public List<BoardVO> list(Criteria cri) {
    	return boardDao.list(cri);
    }
    
    //조회수 - 트랜젝션처리 => 상세보기 할 떄 
    @Transactional(isolation = Isolation.READ_COMMITTED)
    @Override
    public BoardVO view(Integer nb_no) {
    	boardDao.increase(nb_no);
        return boardDao.view(nb_no);
    }
    
    @Override
    public void write(BoardVO boardVO) {
    	boardDao.write(boardVO);
    }
    
    @Override
    public void update(BoardVO boardVO){
    	boardDao.update(boardVO);
    }
    
    @Override
    public void delete(Integer nb_no){
    	boardDao.delete(nb_no);
    }
    
    @Override
    public Integer getTotalCount(Criteria cri){
    	return boardDao.getTotalCount(cri);
    }
    
}
