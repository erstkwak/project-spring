<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>
	#main {background-color: #e9e9e9; padding-bottom: 50px;}
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
						<form action="${path}/notice/write" method="post"  style="width: 800px; margin: 0 auto;">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title" style="text-align: center;">게시글 작성</h3><br>
								</div>
								<div class="box-body">
									<div class="form-group">
										<label for="nb_title">제목</label> <input class="form-control" name='nb_title' id="nb_title"
											placeholder="제목을 입력하세요.">
									</div>
									<div class="form-group">
										<label for="nb_content">내용</label>
										<textarea class="form-control" rows="10" name='nb_content' id="nb_content"
											placeholder="내용을 입력하세요."></textarea>
									</div>
									<div class="form-group">
										<label for="mem_id">작성자</label> <input class="form-control" name='mem_id' id="mem_id"
											value="${login.mem_id}" readonly>
									</div>
									<div style="text-align: center;">
										<button class="btn btn-success" type="submit">등록</button>
										&nbsp;
										<button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i>초기화</button>&nbsp;
										<button class="btn btn-info" type="button" id="golist">목록</button>
									</div>
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
	$(document).ready(function (e) {

		$('#golist').on('click', function (e) {
			location = '/notice/list';
		});

	});
</script>