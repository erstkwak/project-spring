<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
</script>
</head>
<body>
<!-- header.jsp -->
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<!-- 페이지 소개 이미지 -->
<section class="image-head-wrapper" style="background-image: url('/images/qnabanner.jpg');">
	<div class="inner-wrapper">
		<h1 style="font-size: 30px;">공지사항 게시판 수정</h1>
	</div>
</section>
<div class="clearfix"></div>
<!-- 본문 -->
<section class="blog" id="main">
<div class="container">
<div class="row">
	<div class="col-lg-12">
	    <form role="form" id="writeForm" method="post" action="${path}/notice/modify">
	        <div class="box box-primary">
	            <div class="box-header with-border">
	                <h3 class="box-title">게시글 수정</h3>
	            </div>
	            <div class="box-body">
	                <input type="hidden" name="nb_no" value="${board.nb_no}">
	                <div class="form-group">
	                    <label for="nb_title">제목</label>
	                    <input class="form-control" id="nb_title" name="nb_title" placeholder="제목을 입력해주세요" value="${board.nb_title}">
	                </div>
	                <div class="form-group">
	                    <label for="nb_content">내용</label>
	                    <textarea class="form-control" id="nb_content" name="nb_content" rows="30"
	                              placeholder="내용을 입력해주세요" style="resize: none;">${board.nb_content}</textarea>
	                </div>
	                <div class="form-group">
	                    <label for="mem_id">작성자</label>
	                    <input class="form-control" id="mem_id" name="mem_id" value="${board.mem_id}" readonly>
	                </div>
	            </div>
	            <div class="box-footer">
	                <div class="pull-right">
	                    <button type="button" class="btn btn-warning cancelBtn"><i class="fa fa-trash"></i> 취소</button>
		                <button type="button" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
	                    <button type="submit" class="btn btn-success modBtn"><i class="fa fa-save"></i> 수정 저장</button>
	                </div>
	            </div>
	        </div>
	    </form>
	</div>
</div>
</div>
</section>
<!-- footer.jsp -->
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
<script>
	$(document).ready(function () {
	
	    var formObj = $("form[role='form']");
	    console.log(formObj);
	
	    $(".modBtn").on("click", function () {
	        formObj.submit();
	    });
	
	    $(".cancelBtn").on("click", function () {
	        history.go(-1);
	    });
	
	    $(".listBtn").on("click", function () {
	        self.location = "/notice/list"
	    });

	});
</script>
</html>