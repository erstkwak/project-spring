package com.spring.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.member.vo.MemberVo;
import com.spring.mypage.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	private MypageService mypageService;

	// 마이페이지 메인으로 이동
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public  String mypage() {
		return  "mypage/mypageMain";  
	}

	// 비밀번호 확인 폼
	@RequestMapping(value="/passCheckForm", method=RequestMethod.GET)
	public  String passCheckForm() {
		return  "mypage/passCheckForm";  
	}

	// 비밀번호 확인
	@RequestMapping(value="/passCheck", method=RequestMethod.POST)
	public ModelAndView passCheck(HttpSession session, @RequestParam HashMap<String, Object> map, RedirectAttributes ratt) {

		ModelAndView mv = new ModelAndView();
		MemberVo memberVo = mypageService.passCheck(map);

		if( memberVo !=  null ) {
			session.setAttribute("isLogOn", true);
			session.setAttribute("login", memberVo); 
			mv.setViewName("mypage/updateForm");
		} else {
			ratt.addFlashAttribute("msg", false);
			mv.setViewName("redirect:passCheckForm");
		}		
		return  mv;
	}  

	// 회원정보 수정
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
	public ResponseEntity memberjoin(HttpSession session, @ModelAttribute("memberVo") MemberVo vo,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String         message         = null;
		ResponseEntity resEntity       = null;
		HttpHeaders    responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			mypageService.memberUpdate(vo);
			session.removeAttribute("login"); 
			session.setAttribute("login", vo);
		    message  = "<script>";
		    message += " alert('회원 수정이 완료되었습니다.');";
		    message += " location.href='"+request.getContextPath()+"/';";
		    message += " </script>";
		    
		} catch(Exception e) {
			message  = "<script>";
		    message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/join';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		
		return resEntity;
	}

	@RequestMapping(value="/memberDelForm", method=RequestMethod.GET)
	public String memberDelForm() {
				
		return "mypage/memberDelForm";   
	}
	
	@RequestMapping(value="/memberDelete", method=RequestMethod.POST)
	public String memberDelete(MemberVo vo, HttpSession session, RedirectAttributes ratt) {
		MemberVo member = (MemberVo) session.getAttribute("login");
		String sessionPass = member.getMem_pw();
		
		String voPass = vo.getMem_pw();
		
		if(!(sessionPass.equals(voPass))) {
			ratt.addFlashAttribute("msg", false);
			return "redirect:memberDelForm";   
		}
		mypageService.deleteMember(vo);
		session.invalidate();
		
		return "redirect:/";   
	}
	

	




}
