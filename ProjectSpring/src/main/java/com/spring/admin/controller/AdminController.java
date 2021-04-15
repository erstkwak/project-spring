package com.spring.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.admin.service.AdminService;
import com.spring.admin.vo.Criteria;
import com.spring.admin.vo.PageMaker;
import com.spring.member.vo.MemberVo;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	// Admin Main
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String loginForm() {
		return "admin/adminMain";  
	}

	// Member List
//	@RequestMapping(value="/memberList", method=RequestMethod.GET)
//	public ModelAndView memberList() {
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		List<MemberVo> memberList = adminService.getMemberList(map);
//		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("admin/memberList");
//		mv.addObject("memberList", memberList);
//		
//		return mv;  
//	}
	
	// Member List with paging
	@RequestMapping(value="/memberList", method=RequestMethod.GET)
	public String memberList(Criteria cri, Model model) {
		
		model.addAttribute("memberList", adminService.getMemberList(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/memberList";
	}
	
	@RequestMapping(value="/updateMemberForm", method=RequestMethod.GET)
	public String updateMemberForm(MemberVo vo, Model model) {
		
		model.addAttribute("update", adminService.read(vo.getMem_id()));
		
		return "admin/updateForm";
	}
	
	@RequestMapping(value="/updateMember", method=RequestMethod.GET)
	public String updateMember(MemberVo vo) {
		
		adminService.updateMember(vo);
		
		return "redirect:/memberList";
	}
	
	
	@RequestMapping("/Admin/delMember")
	public String delete(String mem_id) {
		adminService.deleteMember(mem_id);
		
		return "redirect:/memberList";   
	}
}
