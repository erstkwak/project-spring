<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<style>
</style>

</head>
<body>
   <!-- Header -->
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   
  <caption>회원리스트</caption>
  <table class="table table-striped table-bordered">
    <tr>
      <td>아이디</td>
      <td>비밀번호</td>
      <td>이름</td>
      <td>이메일</td>
      <td>가입일</td>
      <td>수정</td>
      <td>삭제</td>
    </tr>
    <c:forEach var="member" items="${ memberList }">
    <tr>
      <td>${ member.mem_id }</td>
      <td>${ member.mem_pw }</td>
      <td>${ member.mem_name }</td>
      <td>${ member.mem_email }</td>
      <td>${ member.mem_regdate }</td>
      <td><a href="/updateMemberForm?mem_id=${ member.mem_id }">수정</a></td>
      <td><a href="/Admin/delMember?mem_id=${ member.mem_id }">삭제</a></td>
    </tr>
    </c:forEach>
  </table>
  <div id="pagingDiv ">
    <ul class="pagination justify-content-center">
    <c:if test="${pageMaker.prev}">
    	<li class="page-item"><a class="page-link" href="memberList${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li class="page-item"><a class="page-link" href="memberList${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li class="page-item"><a class="page-link" href="memberList${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
    </ul>
  </div>
</body>
</html>