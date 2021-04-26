<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/css/bootstrap.min.css">
<style>
#passCheck-body {
	margin-bottom: 0px;
	padding-bottom: 100px;
	padding-top: 100px;
	font-size: 16px;
	background-color: #e9e9e9;
}

footer {
	margin-top: 0px;
}

#article-body {
	text-align: left;
}

form {
	width: 400px;
	margin: 0 auto;
}

.form-control {
	font-size: 16px;
}
</style>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div id="passCheck-body">
	<div id="wrap">
		<div id="article-body">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<form action="passCheck" method="post">
							<legend style="text-align: center;">비밀번호 확인</legend>
							<input type="hidden" name="mem_id" value="${login.mem_id}">
							<div class="form-group has-feedback">
								<label class="control-label" for="mem_name">성명</label> <input
									class="form-control" type="text" id="mem_name" name="mem_name"
									value="${login.mem_name}" readonly />
							</div>
							<div class="form-group has-feedback">
								<label class="control-label" for="mem_pw">패스워드</label> <input
									class="form-control" type="password" id="mem_pw" name="mem_pw" />
							</div>
							<div style="color: red;">
								<c:if test="${msg == false}">
											비밀번호가 맞지 않습니다.
										</c:if>
							</div>
							<div class="form-group has-feedback" style="text-align: center;">
								<button class="btn btn-success" type="submit" id="submit">확인</button>
								<button class="cancle btn btn-danger" type="button">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cancle").on("click", function() {
			location.href = "/";
		})

		$("#submit").on("click", function() {
			if ($("#mem_pw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#mem_pw").focus();
				return false;
			}
		});
	})
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>