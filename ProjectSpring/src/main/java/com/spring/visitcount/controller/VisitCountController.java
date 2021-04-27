package com.spring.visitcount.controller;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.spring.visitcount.dao.VisitCountDao;

//총방문자, 하루 방문자
@WebListener
public class VisitCountController implements HttpSessionListener{
	/*
	 * 세션이 생성되었을 때 호출됨
	 */
	@Override
    public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("-----리스너 실행-----");
		HttpSession session = arg0.getSession(); 
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
		VisitCountDao visitCountDao = (VisitCountDao)wac.getBean("visitCountDao");
    	System.out.println(visitCountDao);
    	
        int todayCount = 0;
        int totalCount = 0;
        // 전체 방문자 수 +1
        try {
        	visitCountDao.setVisitTotalCount();

            // 오늘 방문자 수
            todayCount = visitCountDao.getVisitTodayCount();
            // 전체 방문자 수
            totalCount = visitCountDao.getVisitTotalCount();
         	System.out.println("todayCount =" + todayCount);
         	System.out.println("totalCount =" + totalCount);
        } catch (Exception e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
        }
        
        // 세션 속성에 담아준다.
        session.setAttribute("totalCount", totalCount); // 전체 방문자 수
        session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
    }
	
	/*
	 * 세션이 제거되었을 때 호출됨
	 */
	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
	}

}
	
