<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage Main</title>
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(function() {
	  $('input[type=button]').on('click', function(event) {
		  var btn = event.target;
		  var href = '';
		  switch( btn.id ) {
		  
		  case 'btnUpdate':
			  href     = '/passCheckForm';
		  	  break;
		  case 'btnDelete':
			  href     = '/memberDelForm';
		  	  break;

		  }
		  location.href = href;
		  
	  })
 });
</script>
</head>
<body>

   <!-- Header -->
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
   
   <!-- 회원 정보 조회 -->
   <table>
     <caption><h2>회원 정보</h2></caption>
     <tr>
       <td>이름</td>
       <td colspan="2">${login.mem_name}</td>
     </tr>
     <tr>
       <td>이메일</td>
       <td colspan="2">${login.mem_email}</td>
     </tr>
     <tr>
       <td>전화번호</td>
       <td colspan="2">${login.mem_phone}</td>
     </tr>
     <tr>
       <td>주소</td>
       <td>${login.mem_address }</td>
       <td>${login.mem_detailaddress }</td>
     </tr>
     <tr>
       <td colspan="3">
         <input type="button" value="회원정보관리" id="btnUpdate"/>
         <input type="button" value="회원탈퇴" id="btnDelete"/>
       </td>
     </tr>
   </table>
   
   <%@ include file="/WEB-INF/views/includes/footer.jsp" %>