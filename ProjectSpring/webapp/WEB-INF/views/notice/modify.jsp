<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>
	#main {background-color: #e9e9e9; padding-bottom: 100px;}
	form {background-color: white; padding: 30px;}
</style>

<section class="image-head-wrapper" style="background-image: url('/images/noticeimage.jpg'); width:100%; height: 500px;">
	<div class="inner-wrapper">
		<h1 style="font-size: 35px;">공지사항</h1>
	</div>
</section>
<div class="clearfix"></div>

<div id="wrap">
	<div id="article-body">
		<section class="blog" id="main">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<form role="form" id="writeForm" method="post" style="width: 800px; margin: 0 auto;" action="${path}/notice/modify">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title" style="text-align: center;">게시글 수정</h3><br>
								</div>
								<div class="box-body">
									<input type="hidden" name="nb_no" value="${board.nb_no}">
									<div class="form-group">
										<label for="nb_title">제목</label>
										<input class="form-control" id="nb_title" name="nb_title" placeholder="제목을 입력해주세요"
											value="${board.nb_title}">
									</div>
									<div class="form-group">
										<label for="nb_content">내용</label>
										<textarea class="form-control" id="nb_content" name="nb_content" rows="10" placeholder="내용을 입력해주세요"
											style="resize: none;">${board.nb_content}</textarea>
									</div>
									<div class="form-group">
										<label for="mem_id">작성자</label>
										<input class="form-control" id="mem_id" name="mem_id" value="${board.mem_id}" readonly>
									</div>
								</div>
								<div class="box-footer" style="text-align: center;">
										<button type="submit" class="btn btn-success modBtn"><i class="fa fa-save"></i>수정</button>&nbsp;
										<button type="button" class="btn btn-warning cancelBtn"><i class="fa fa-trash"></i>취소</button>&nbsp;
										<button type="button" class="btn btn-primary listBtn"><i class="fa fa-list"></i>목록</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
							
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>

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