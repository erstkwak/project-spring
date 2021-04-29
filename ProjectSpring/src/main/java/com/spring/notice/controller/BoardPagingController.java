package com.spring.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.notice.service.BoardService;
import com.spring.notice.vo.BoardVO;
import com.spring.notice.vo.Criteria;

@Controller("BoardPagingController")
@RequestMapping("/notice/")
public class BoardPagingController {
	
	@Autowired
	private BoardService boardService;
/////////////////////////////
	// 목록 페이지 이동
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) {
		System.out.println(cri);
		int totalCount = boardService.getTotalCount(cri);
		cri.calc(totalCount);
		model.addAttribute("boardList", boardService.list(cri));
		model.addAttribute("cri", cri);
		
		//System.out.println(boardService.list(cri).get(1));
		return "/notice/list";
	}
	// 글쓰기 페이지 이동
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() {
	    return "/notice/write";
	}
	// 글쓰기 처리
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(BoardVO boardVO,
	                        RedirectAttributes redirectAttributes) throws Exception {

		boardService.write(boardVO);
	    redirectAttributes.addFlashAttribute("msg", "regSuccess");

	    return "redirect:/notice/list";
	}
	// 조회 페이지 이동
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("nb_no") Integer nb_no,
	                   Model model) throws Exception {
		
	    model.addAttribute("board", boardService.view(nb_no));

	    return "/notice/read";
	}
	// 수정 페이지 이동
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("nb_no") Integer nb_no,
	                        Model model) throws Exception {

	    model.addAttribute("board", boardService.view(nb_no));

	    return "/notice/modify";
	}
	// 수정 처리
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardVO boardVO,
	                         RedirectAttributes redirectAttributes) throws Exception {

		boardService.update(boardVO);
	    redirectAttributes.addFlashAttribute("msg", "modSuccess");

	    return "redirect:/notice/list";
	}
	// 삭제 처리
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("nb_no") Integer nb_no,
	                     RedirectAttributes redirectAttributes) throws Exception {

		boardService.delete(nb_no);
	    redirectAttributes.addFlashAttribute("msg", "delSuccess");

	    return "redirect:/notice/list";
	}
	
	//조회수 - 트랜젝션처리 seriveImpl
	
	//게시글 전체수
	
	
}
