package com.spring.pboard.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.pboard.vo.Criteria;
import com.spring.pboard.vo.PBoardVo;
import com.spring.pboard.vo.Search;


public interface PBoardDao {
	

	List<PBoardVo> getPBoardList(Criteria vo);
	
	List<PBoardVo> getPBoardList(Search search);

	int listCount(Search search);

	void insertPBoard(HashMap<String, Object> map);

	PBoardVo pboardView(int idx);

	void updatePBoard(PBoardVo vo);

	void deletePBoard(int idx);

	PBoardVo read(int idx);
	

}
