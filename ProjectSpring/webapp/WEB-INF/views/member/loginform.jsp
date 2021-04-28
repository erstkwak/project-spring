<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>
	#loginForm-body {margin-bottom: 0px; padding-bottom: 50px; font-size: 16px; background-color: #e9e9e9; }
	footer {margin-top: 0px;}
	#article-body {text-align: left;}
	form {width: 400px; margin: 0 auto; }
	.form-control {font-size: 16px;}
	#main {padding-top: 50px;}
</style>

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

<div id="loginForm-body" >
	<div id="wrap" >
		<div id="article-body" >
			<section class="blog" id="main" >
				<div class="container" id="loginForm" >
					<div class="row" >
						<div class="col-md-12 col-sm-12 col-xs-12" >
							<section id="container" >
								<form action="loginProcess" method="post">
									<legend style="text-align: center;">로그인</legend>
									<div class="form-group has-feedback">
										<label class="control-label" for="mem_id">아이디</label>
										<input class="form-control" type="text" id="mem_id" name="mem_id" >
									</div>
									<div class="form-group has-feedback">
										<label class="control-label" for="mem_pw">패스워드</label>
										<input class="form-control" type="password" id="mem_pw" name="mem_pw" />
										<div style="color: red;">
											<c:if test="${msg == false}">
												비밀번호가 맞지 않습니다.
											</c:if>
										</div>
									</div>
									<div class="form-group has-feedback" style="text-align: center;">
										<button class="btn btn-success" type="submit" id="submit">로그인</button>
										<button class="cancle btn btn-danger" type="button">취소</button>
									</div>
								</form>
								<div style="text-align: center;">
						      <a href="#">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp; 
							    <a href="#">비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
							    <a href="/join">회원가입</a>&nbsp;&nbsp;|&nbsp;&nbsp;
							    <a href="#">고객 센터</a>
						    </div>	
							</section>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>