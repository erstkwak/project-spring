package com.spring.pboard.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pboard.dao.PBoardDao;
import com.spring.pboard.vo.Criteria;
import com.spring.pboard.vo.PBoardVo;
import com.spring.pboard.vo.Search;

@Repository("pboardDao")
public class PBoardDaoImpl implements PBoardDao {

	@Autowired
	private  SqlSession sqlSession;
	
	@Override
	public List<PBoardVo> getPBoardList(Criteria vo) {
		return sqlSession.selectList("PBoard.PBoardListWithPaging", vo ); 
	}

	@Override
	public List<PBoardVo> getPBoardList(Search search) {
		List<PBoardVo> pboardList = sqlSession.selectList("PBoard.PBoardList", search);
		return   pboardList;
	}
	
	
	@Override
	public int listCount(Search search) {
		return sqlSession.selectOne("PBoard.ListCount", search);
	}
		
	@Override
	public void insertPBoard(HashMap<String, Object> map) {
		sqlSession.insert("PBoard.PBoardInsert", map);		
	}

	@Override
	public PBoardVo pboardView(int idx) {
		PBoardVo vo =  sqlSession.selectOne("PBoard.PBoardView", idx );
		return   vo;
	}

	@Override
	public void updatePBoard(PBoardVo vo) {
		
		sqlSession.update("PBoard.PBoardUpdate", vo );
	}

	@Override
	public void deletePBoard(int idx) {
		
		sqlSession.delete("PBoard.PBoardDelete", idx );
		
	}

	@Override
	public PBoardVo read(int idx) {
		return sqlSession.selectOne("PBoard.Read", idx);
	}



}









