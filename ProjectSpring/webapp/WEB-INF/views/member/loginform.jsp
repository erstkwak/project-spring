<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>
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
   
   <h3>회원 로그인 창</h3>
     <section id="container">
    <form action="loginProcess" method="post">
      <div class="form-group has-feedback">
        <label class="control-label" for="mem_id">아이디</label>
        <input class="form-control" type="text" id="mem_id" name="mem_id" style="width: 40%;">
      </div>
	  <div class="form-group has-feedback">
		<label class="control-label" for="mem_pw">패스워드</label>
		<input class="form-control" type="password" id="mem_pw" name="mem_pw" style="width: 40%;"/>
	  <div style="color: red;">
	    <c:if test="${msg == false}">
	      비밀번호가 맞지 않습니다.
	    </c:if>
	  </div>
	  </div>
		<div class="form-group has-feedback">
		<button class="btn btn-success" type="submit" id="submit">로그인</button>
		<button class="cancle btn btn-danger" type="button">취소</button>
	  </div>   
      
    </form>

  </section>
       
       <a href="#">아이디 찾기</a>  | 
	   <a href="#">비밀번호 찾기</a> | 
	   <a href="/join">회원가입</a>    | 
	   <a href="#">고객 센터</a>
   
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>