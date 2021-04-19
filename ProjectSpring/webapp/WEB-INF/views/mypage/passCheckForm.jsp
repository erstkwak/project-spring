<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pass Check</title>
<title>비밀번호 확인</title>
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript">
$(document).ready(function(){
	// 취소
	$(".cancle").on("click", function(){
		location.href = "/";
	})

	$("#submit").on("click", function(){
		if($("#mem_pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#mem_pw").focus();
			return false;
		}	
	});
})

</script>
</head>
<body>

   <!-- Header -->
   <%@ include file="/WEB-INF/views/common/header.jsp" %>
   
   <caption><h2>비밀번호 확인</h2></caption>
   <form action="passCheck" method="post">
   <input type="hidden" name="mem_id" value="${login.mem_id}">
   
   <div class="form-group has-feedback">
		<label class="control-label" for="mem_name">성명</label>
		<input class="form-control" type="text" id="mem_name" name="mem_name" value="${login.mem_name}" style="width: 40%;" readonly/>
	  </div>
	  <div class="form-group has-feedback">
		<label class="control-label" for="mem_pw">패스워드</label>
		<input class="form-control" type="password" id="mem_pw" name="mem_pw" style="width: 40%;"/>
	  </div>
	  <div style="color: red;">
	    <c:if test="${msg == false}">
	      비밀번호가 맞지 않습니다.
	    </c:if>
	  </div>
		<div class="form-group has-feedback">
		<button class="btn btn-success" type="submit" id="submit">확인</button>
		<button class="cancle btn btn-danger" type="button">취소</button>
	  </div>   
  </form>   
</body>
</html>