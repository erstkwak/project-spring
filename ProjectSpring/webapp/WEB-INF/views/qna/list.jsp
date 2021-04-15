<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- 페이지 소개 이미지 -->
<section class="image-head-wrapper" style="background-image: url('/img/qnabanner.jpg');">
	<div class="inner-wrapper">
		<h1 style="font-size: 30px;">Q&A 게시판</h1>
	</div>
</section>
<div class="clearfix"></div>
<!-- 본문 -->
<section class="blog" id="main">
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-sm-10 col-xs-12">
				<div id="wrapper">
					<table class="table table-hover">
						<thead class="thead-dark">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<c:forEach var="post" items="${postList}">
							<tr>
								<td><c:out value="${post.p_no}" /></td>
								<td><a class='move' href='<c:out value="${post.p_no}"/>'><c:out value="${post.p_title}" /><b> [	<c:out value="${post.p_replycount}" /> ] </b></a></td>
								<td><c:out value="${post.mem_id}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${post.p_writedate}" /></td>
							</tr>
						</c:forEach>
					</table>
					<form id='searchForm' class="form-group" action="/qna/list" method='get'>
						<div id="test" class="form-row">
							<select class="custom-select custom-select-lg" id="searchSelectTag" name='type'>
								<option value="" <c:out value="${paging.util.type == null ? 'selected' : ''}" />>검색 조건</option>
								<option value="T" <c:out value="${paging.util.type eq 'T' ? 'selected' : ''}" />>제목</option>
								<option value="C" <c:out value="${paging.util.type eq 'C' ? 'selected' : ''}" />>내용</option>
								<option value="W" <c:out value="${paging.util.type eq 'W' ? 'selected' : ''}" />>작성자</option>
								<option value="TC" <c:out value="${paging.util.type eq 'TC' ? 'selected' : ''}" />>제목 or 내용</option>
								<option value="TW" <c:out value="${paging.util.type eq 'TW' ? 'selected' : ''}" />>제목 or 작성자</option>
								<option value="TWC" <c:out value="${paging.util.type eq 'TWC' ? 'selected' : ''}" />>제목 or 내용 or 작성자</option>
							</select>
							&nbsp;<input type='text' name='keyword' id="keywordInput" class="form-control form-control-lg"
								value='<c:out value="${paging.util.keyword}"/>' />
							<input type='hidden' name='pageNum' value='<c:out value="${paging.util.pageNum}"/>' />
							<input type='hidden' name='amount' value='<c:out value="${paging.util.amount}"/>' />
							&nbsp;<button type="button" class="btn btn-dark btn-lg" id="searchBtn">검색</button>
							&nbsp;<button type="button" class="btn btn-dark btn-lg" id="writeBtn">글쓰기</button>
						</div>
					</form>
					<form id='actionForm' action="/qna/list" method='get'>
						<input type='hidden' name='pageNum' value='${paging.util.pageNum}'>
						<input type='hidden' name='amount' value='${paging.util.amount}'>
						<input type='hidden' name='type' value='<c:out value="${paging.util.type}"/>'>
						<input type='hidden' name='keyword' value='<c:out value="${paging.util.keyword}"/>'>
					</form>
					<div id="pagingDiv">
						<ul class="pagination">
							<c:if test="${paging.prev}">
								<li class="pagingBtn page-item"><a class="page-link pagingBtn shadow-none" href="${paging.start - 1}">이전</a>
								</li>
							</c:if>
							<c:forEach var="num" begin="${paging.start}" end="${paging.end}">
								<li class="pagingBtn page-item pagingBtn ${paging.util.pageNum == num ? " active" : "" } "><a class="
									page-link shadow-none" href="${num}">${num}</a></li>
							</c:forEach>
							<c:if test="${paging.next}">
								<li class="pagingBtn page-item"><a class="page-link pagingBtn shadow-none" href="${paging.end + 1}">다음</a>
								</li>
							</c:if>
						</ul>
					</div>
					<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="infoModalLabel">알림</h5>
								</div>
								<h5>
									<div class="modal-body">처리되었습니다.</div>
								</h5>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 사이드 메뉴 -->
			<aside class="col-md-2 col-sm-2 col-xs-12">
				<div class="blog-list" id="side-menu">
					<h4>사이드 메뉴</h4>
					<ul>
						<li><a href="#">사이드메뉴 1</a></li>
						<li><a href="#">사이드메뉴 2</a></li>
						<li><a href="#">사이드메뉴 3</a></li>
						<li><a href="#">사이드메뉴 4</a></li>
						<li><a href="#">사이드메뉴 5</a></li>
						<li><a href="#">사이드메뉴 6</a></li>
						<li><a href="#">사이드메뉴 7</a></li>
					</ul>
					<div class="clearfix"> </div>
				</div>
			</aside>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script>
	$(document).ready(function() {

		var result = '<c:out value="${result}" />';
		checkByModal(result);
		history.replaceState({}, null, null);

		function checkByModal(result) {
			if (result === '' || history.state) {
				return;
			}
			if (parseInt(result) > 0) {
				$('.modal-body').html(parseInt(result) + ' 번 글이 추가되었습니다.');
			}
			$('#infoModal').modal('show');
		}

		$('#writeBtn').on('click', function() {
			self.location = '/qna/register';
		});

		var actionForm = $('#actionForm');
		$('.pagingBtn a').on("click",	function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

		$('.move').on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='p_no' value='" + $(this).attr("href") + "'>");
			actionForm.attr("action",	"/qna/get");
			actionForm.submit();
		});

		var searchForm = $('#searchForm');
		$('#searchBtn').on("click",	function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색 조건을 선택하세요.");
				return false;
			}
			if (!searchForm.find("input[name='keyword']").val()) {alert("검색어를 입력하세요.");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		});

	});
</script>