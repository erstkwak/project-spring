package com.spring.qna.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.qna.service.PostService;
import com.spring.qna.vo.PostAttachVO;
import com.spring.qna.vo.PostPageVO;
import com.spring.qna.vo.PostVO;
import com.spring.qna.vo.UtilVO;

@Controller
@RequestMapping("/qna/*")
public class PostController 
{

	@Autowired
	private PostService postService;

	@RequestMapping("/list")
	public void list(UtilVO utilVO, Model model)
	{
		model.addAttribute("list", postService.getList(utilVO));
		model.addAttribute("paging", new PostPageVO(utilVO, postService.getPostCount(utilVO)));
	}
	
	@RequestMapping("/register")
	public String register(PostVO postVO, RedirectAttributes rttr)
	{
		postService.register(postVO);
		rttr.addFlashAttribute("result", postVO.getP_no());
		return "redirect:/qna/list";
	}
	
	@RequestMapping({"/get", "/modify"})
	public void get(@RequestParam("p_no") Long p_no, @ModelAttribute("utilVO") UtilVO utilVO, Model model)
	{
		model.addAttribute("postVO", postService.getOne(p_no));
	}

	@RequestMapping("/modify")
	public String modify(PostVO postVO, @ModelAttribute("utilVO") UtilVO utilVO, RedirectAttributes rttr)
	{
		if (postService.modify(postVO)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", utilVO.getPageNum());
		rttr.addAttribute("amount", utilVO.getAmount());
		rttr.addAttribute("type", utilVO.getType());
		rttr.addAttribute("keyword", utilVO.getKeyword());
		
		return "redirect:/qna/list";
	}

	
	@RequestMapping("/remove")
	public String remove(@RequestParam("p_no") Long p_no, UtilVO utilVO, RedirectAttributes rttr)
	{
		List<PostAttachVO> attachList = postService.getAttachList(p_no);
		
		if (postService.remove(p_no)) {
			deleteFiles(attachList);
			rttr.addAttribute("result", "success");
		}
		return "redirect:/qna/list" + utilVO.getListLink();
	}

	@RequestMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<PostAttachVO>> getAttachList(Long p_no)
	{
		return new ResponseEntity<>(postService.getAttachList(p_no), HttpStatus.OK);
	}
	
	private void deleteFiles(List<PostAttachVO> attachList)
	{
		if (attachList == null || attachList.size() == 0) 
		{
			return;
		}
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("c:\\upload\\" + attach.getA_savepath() + "\\" + attach.getA_uuid() + "_" + attach.getA_filename());
				Files.deleteIfExists(file);
				
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("c:\\upload\\" + attach.getA_savepath() + "\\_s" + attach.getA_uuid() + "_" + attach.getA_filename());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
		
	}

}