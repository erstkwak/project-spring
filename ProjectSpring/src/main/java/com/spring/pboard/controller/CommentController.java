package com.spring.pboard.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.pboard.service.CommentService;
import com.spring.pboard.vo.CommentVO;

@Controller
@RequestMapping("/comment/*")
public class CommentController {

 	@Resource(name="commentService")
	private CommentService commentService;
 	
 	 // 댓글 조회
 	@RequestMapping(value="/list", method = RequestMethod.GET)
 	public String commentList(int idx, Model model) throws Exception {
 		
 		List<CommentVO> comment = null;
 		comment = commentService.list(idx);
 		model.addAttribute("comment", comment);
 		
 		return "comment";
 	}
	
	// 댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWirte(CommentVO vo) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("mem_id", vo.getMem_id()); 
		 map.put("idx", vo.getIdx());
		 map.put("comment_content", vo.getComment_content()); 
		 map.put("comment_regdate", vo.getComment_regdate());
		
		 commentService.write( map );
		 System.out.println(vo.getComment_num());
		return "good";
	}
	
	
	// 댓글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public  String  commentdelete(CommentVO vo) throws Exception {
		commentService.delete( vo );
		return "good";
		
	}
}
