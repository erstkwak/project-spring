package com.spring.pboard.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.pboard.service.CommentService;
import com.spring.pboard.service.PBoardService;
import com.spring.pboard.vo.CommentVO;
import com.spring.pboard.vo.Criteria;
import com.spring.pboard.vo.PBoardVo;
import com.spring.pboard.vo.Paging;
import com.spring.pboard.vo.Search;

@Controller
@RequestMapping("/PBoard/*")
public class PBoardController {
	
	
	@Autowired
	private  PBoardService  pboardService;
	@Autowired 
	private CommentService commentService;
	
	
	@RequestMapping(value="/List", method=RequestMethod.GET)
	public String pboardList(Criteria cri, Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType
			, @RequestParam(value = "keyword", required = false, defaultValue = "" ) String keyword) {
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		List<PBoardVo> pboardList = pboardService.getPBoardList(search);
		
		//전체 게시글 수
		model.addAttribute("pboardList1", pboardService.getPBoardList(search));
		model.addAttribute("pboardList2", pboardService.getPBoardList(cri));
		
		model.addAttribute("pboardList", pboardList);

		Paging pageMaker = new Paging();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(pboardService.listCount(search));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "pboard/list";
		
		  }
	
	 @RequestMapping("/PBoard/WriteForm") 
	 public String writeForm( ) {
		 return "pboard/writeform"; 
	 }
	 
	 @RequestMapping("/PBoard/Write") 
	 public @ResponseBody String write ( PBoardVo vo ) {
		 
	HashMap<String, Object> map = new HashMap<String, Object>();
	 map.put("mem_id", vo.getMem_id()); 
	 map.put("title", vo.getTitle());
	 map.put("cont", vo.getCont()); 
	 map.put("img_url", vo.getImg_url());
	 map.put("regdate", vo.getRegdate());
	 
	 pboardService.insertPBoard( map );
	 return "good"; 
	 }
	 
	@RequestMapping("/PBoard/View")
	public  String  view ( int idx, Model model ) throws Exception {
		
		PBoardVo vo = pboardService.pboardView( idx );
		model.addAttribute("pboard", vo);
		
		// 댓글 조회
		List<CommentVO> comment = null;
		comment = commentService.list(idx);
		model.addAttribute("comment", comment);
		
		
		return "pboard/view";
		
	}  
	
	@RequestMapping(value="/PBoard/UpdateForm" , method= { RequestMethod.GET, RequestMethod.POST})
	public  String  updateForm(@RequestParam("idx") int idx, Model model) {
		
		PBoardVo vo = pboardService.pboardView( idx );
		
		model.addAttribute("pboardView", vo );
		return "pboard/update";
	}
	
	@RequestMapping(value="/PBoard/Update", method= { RequestMethod.GET, RequestMethod.POST})
	public  String  update(  PBoardVo vo ) {
		
		pboardService.updatePBoard( vo );	
		
		return "redirect:/PBoard/List";
		
	} 
	
	@RequestMapping("/PBoard/Delete")
	public  String  delete( int idx ) {
		pboardService.deletePBoard( idx );
		return "redirect:/PBoard/List";
		
	}
}











