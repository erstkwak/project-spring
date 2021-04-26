package com.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session 객체를 가져옴
		HttpSession  session = request.getSession();

		String  requestUrl = request.getRequestURL().toString();
		if(requestUrl.contains("/login")) {
			return true;
		}

		Object obj = session.getAttribute("login");
		if (obj == null ) {
			// 로그인 되어있지 않다면 /login으로 이동하시오
			response.sendRedirect("/login");
			return false; // 더이상 컨트롤러 요청으로 가지 않도록 false를 반환함
		}

		return super.preHandle(request, response, handler);
	}

	// postHandle() : controller가 실행되고 화면이 보여지기 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
}
