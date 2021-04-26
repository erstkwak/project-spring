package com.spring.pboard.service;

import java.util.HashMap;
import java.util.List;

import com.spring.pboard.vo.Criteria;
import com.spring.pboard.vo.PBoardVo;
import com.spring.pboard.vo.Search;

public interface PBoardService {
	
	List<PBoardVo> getPBoardList(Criteria vo);
	
	int listCount(Search search);
	
	void insertPBoard(HashMap<String, Object> map);

	PBoardVo pboardView(int idx); 

	void deletePBoard(int idx);

	void updatePBoard(PBoardVo vo);

	PBoardVo read(int idx);

	List<PBoardVo> getPBoardList(Search search);
	

}
