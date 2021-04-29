<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기형식</title>
<style>
</style>
</head>
<body>
<!-- header.jsp -->
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
	<!-- 페이지 소개 이미지 -->
	<section class="image-head-wrapper"
		style="background-image: url('/images/qnabanner.jpg');">
		<div class="inner-wrapper">
			<h1 style="font-size: 30px;">공지사항 게시판 글작성</h1>
		</div>
	</section>
	<div class="clearfix"></div>

	<div id="wrap">
		<div id="article-body">
			<section class="blog" id="main">
				<div class="container">
					<div class="row">
						<div class="col-md-10 col-sm-10 col-xs-12">

							<form action="${path}/notice/write" method="post">
							<div class="box box-primary">
								<div class="box-header with-border">
					                <h3 class="box-title">게시글 작성</h3>
					            </div>
								<div class="box-body">
									<div class="form-group">
										<label for="nb_title">제목</label> <input class="form-control"
											name='nb_title' id="nb_title" placeholder="제목을 입력하세요.">
									</div>
									<div class="form-group">
										<label for="nb_content">내용</label>
										<textarea class="form-control" rows="10" name='nb_content'
											id="nb_content" placeholder="내용을 입력하세요."></textarea>
									</div>
									<div class="form-group">
										<label for="mem_id">작성자</label> <input class="form-control"
											name='mem_id' id="mem_id" value="${login.mem_id}" readonly>
									</div>
									<div style="text-align: center;">
										<button class="btn btn-dark btn-lg" type="submit">등록</button>
										&nbsp;
										<button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
										<button class="btn btn-dark btn-lg" type="button" id="golist">목록</button>
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
	<!-- footer.jsp -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
</body>
<script>
  $(document).ready(function(e) {

    $('#golist').on('click', function(e) {
      location = '/notice/list';
    });

  });
</script>
</html>