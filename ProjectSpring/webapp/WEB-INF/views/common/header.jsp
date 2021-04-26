<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="UTF-8" />

<div>
    <c:choose>
      <c:when test="${isLogOn==true and not empty login }">
        ${ login.mem_name  } 님 
        <a href="/logout">로그아웃</a> &nbsp;
        <a href="/mypage">마이페이지</a> &nbsp;<br>
      </c:when>
      <c:otherwise>
        <a href="/login">로그인</a>&nbsp;
        <a href="/join">회원가입</a>&nbsp;
        <a href="/shopping/main">쇼핑하기</a>&nbsp;
      </c:otherwise>
    </c:choose>
    <c:if test="${isLogOn==true and login.mem_id=='admin' }">
   		 관리자로 로그인 하셨습니다
       	<a href="/admin">관리자</a>
    </c:if>
</div>

   
   
   
   
   
   
   
   
   
   
   
   
   