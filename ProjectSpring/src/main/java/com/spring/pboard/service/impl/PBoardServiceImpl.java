package com.spring.pboard.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pboard.dao.PBoardDao;
import com.spring.pboard.service.PBoardService;
import com.spring.pboard.vo.Criteria;
import com.spring.pboard.vo.PBoardVo;
import com.spring.pboard.vo.Search;

@Service("pboardService")
public class PBoardServiceImpl implements PBoardService {

	@Autowired
	private   PBoardDao  pboardDao;
	
	@Override
	public List<PBoardVo> getPBoardList(Search search) {
		List<PBoardVo> pboardList  = pboardDao.getPBoardList(search);	
		return   pboardList;
	}
	@Override
	public List<PBoardVo> getPBoardList(Criteria vo) {
		List<PBoardVo> lists = (List<PBoardVo>) pboardDao.getPBoardList(vo);
		return lists;
	}

	@Override
	public void insertPBoard(HashMap<String, Object> map) {
		pboardDao.insertPBoard( map );
		
	}

	@Override
	public PBoardVo pboardView(int idx) {
		
		PBoardVo   vo   =  pboardDao.pboardView(  idx  );
		
		return  vo;
	}

	@Override
	 public void updatePBoard(PBoardVo vo) {
		pboardDao.updatePBoard(vo);
		
	}

	@Override
	public void deletePBoard(int idx) {
		
		pboardDao.deletePBoard( idx );
		
	}

	@Override
	public int listCount(Search search) {
		int count = pboardDao.listCount(search);
		return count;
	}
	@Override
	public PBoardVo read(int idx) {
		return pboardDao.read(idx);
	}



}
