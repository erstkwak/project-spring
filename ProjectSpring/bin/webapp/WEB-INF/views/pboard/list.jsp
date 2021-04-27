<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>
	#main {
		padding-bottom: 50px;
		background-color: #e9e9e9;
	}
	#article {margin: 0 auto;}
	.pagination>li>a, .pagination>li>span {color: black;}
</style>

<section class="image-head-wrapper"
	style="background-image: url('/images/campingboard.jpg'); background-repeat: round; width:100%; height: 500px;">
	<div class="inner-wrapper">
		<h1 style="font-size: 35px;">캠핑 후기</h1>
	</div>
</section>
<div class="clearfix"></div>
<section class="blog" id="main">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div id="wrapper">
					<div class="col-md-12 col-sm-12 col-xs-12" id="article">
					<c:forEach var="pboardList" items="${ pboardList }">
						<div class="col-md-4 col-sm-6 col-xs-12" style="height: 400px; flex: auto;">
							<h3><a href="/PBoard/View?idx=${ pboardList.idx }">${ pboardList.title }</a></h3>
							<br><p><a href="/PBoard/View?idx=${ pboardList.idx }"><img src="${ pboardList.img_url }"
										style="width: 300px; height: 300px;" onerror="this.src='/images/none.png'" alt="My Image"
										id="photo"></a></p>
						</div>
					</c:forEach>
				</div>
					<div class="col-md-12 col-sm-12 col-xs-12 form-inline" style="text-align: center;">
						<div class="form-group">
						<select name="searchType" class="form-control" >
							<option value="title" <c:if test="${search.searchType eq 'title'}">selected</c:if>>제목</option>
							<option value="cont" <c:if test="${search.searchType eq 'cont'}">selected</c:if>>내용</option>
							<option value="title_cont" <c:if test="${search.searchType eq 'title_cont'}">selected</c:if>>제목+내용
							</option>
							<option value="mem_id" <c:if test="${search.searchType eq 'mem_id'}">selected</c:if>>작성자</option>
						</select>&nbsp;
					</div>
						<div class="form-group">
						<input type="text" name="keyword" value="${search.keyword}" class="form-control" /></div>&nbsp;
						
						<button type="button" id="searchBtn" class="btn btn-default">검색</button>&nbsp;
						<a href="/PBoard/WriteForm">
							<input type="button" value="캠핑후기 쓰기" id="btnWrite" class="btn btn-default" />
						</a>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;">
						<div id="pagingDiv">
							<ul class="pagination justify-content-center">
								<c:if test="${pageMaker.prev}">
									<li class="pagingBtn page-item"><a class="page-link pagingBtn shadow-none" href="List${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전< /a>
									</li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<li class="pagingBtn page-item pagingBtn"><a class="page-link pagingBtn shadow-none" href="List${pageMaker.makeQuery(idx)}">${idx}</a>
									</li>
									</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="pagingBtn page-item"></li><a class="page-link pagingBtn shadow-none" href="List${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
								</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-storage.js"></script>
<script type="text/javascript" src="/js/firebase.js"></script>
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
<script>
	document.getElementById("searchBtn").onclick = function () {
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword = document.getElementsByName("keyword")[0].value;
		location.href = "/PBoard/List?page=1&perPageNum=20" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>