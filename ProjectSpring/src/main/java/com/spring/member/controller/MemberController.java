package com.spring.member.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;



@Controller
public class MemberController {

	@Autowired
	private MemberService memberService; 

	// 로그인 폼을 띄우는 부분
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public  String loginForm() {
		return  "member/loginform";  
		// WEB-INF/views/login/loginForm.jsp 를 실행
	}

	// 로그인 처리하는 부분 - 로그인처리: session 사용한다
	@RequestMapping(value="/loginProcess", method=RequestMethod.POST)
	public ModelAndView loginProcess(HttpSession session, @RequestParam HashMap<String, Object> map, RedirectAttributes ratt) {

		ModelAndView mv = new ModelAndView();
		if( session.getAttribute("login") != null ) {   // 기존의 login이란 세션 값이 존재한다면
			session.removeAttribute("login");           // 기존값을 재거한다
		}
		
		MemberVo memberVo = memberService.memberLogin(map);

		if( memberVo !=  null ) {
			session.setAttribute("isLogOn", true);
			session.setAttribute("login", memberVo); // 세션에 "login" <- memberVo
			mv.setViewName("redirect:/");
		} else {
			ratt.addFlashAttribute("msg", false);
			mv.setViewName("redirect:/login");
		}		
		return  mv;
	}  

	// 로그아웃 처리
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ModelAndView logout( HttpSession session	) {
		ModelAndView mv = new ModelAndView();

		session.setAttribute("isLogOn", false);
		session.removeAttribute("login");
		//session.invalidate();  // 새션 전채를 날려버림
		mv.setViewName("redirect:/");
		return mv;
	}

	// 회원 가입 처리
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public  String memberJoinForm() {
		return  "member/memberjoin";  
	}
	
	@RequestMapping(value="/memberJoin" ,method = RequestMethod.POST)
	public ResponseEntity memberjoin(@ModelAttribute("memberVo") MemberVo vo,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String         message         = null;
		ResponseEntity resEntity       = null;
		HttpHeaders    responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		int result = memberService.idcheck(vo);
		try {
			if(result == 0) {
				memberService.insertMember(vo);
				message  = "<script>";
				message += " alert('GoCamping 가족이 되어주셔서 감사합니다. 로그인창으로 이동합니다.');";
				message += " location.href='"+request.getContextPath()+"/login';";
				message += " </script>";
			} else if (result != 0) {
				message  = "<script>";
			    message += " alert('사용할수 없는 아이디 입니다. 다시 시도해 주세요');";
			    message += " location.href='"+request.getContextPath()+"/join';";
			    message += " </script>";
			}
		    
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
	
	// 회원 중복 확인
	@ResponseBody
	@RequestMapping(value="/idcheck", method=RequestMethod.POST)
	public int idcheck(MemberVo vo) {
		int result = memberService.idcheck(vo);
		return  result;
	}
	
	
	
}















