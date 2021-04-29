<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<style>
	/* 본문 */
	#list-body {font-size: 16px; padding-bottom: 50px; }
	tr, th, td {text-align: center;}
	td:nth-of-type(2) {text-align: left;}
	/* 페이징 스타일 */
	#pagingDiv {display: flex; justify-content: center; align-items: center;}
	.pagination>li>a, .pagination>li>span {color: black;}
	.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {background-color: white; border-color: black; color: black}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		// 등록
		$(".add").on("click", function() {
			location.href = "/addNewGoodsForm";
		})
	})
</script>


<div id="list-body">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div id="wrapper">
						<table class="table table-hover">
							<caption>
								<h2 style="text-align: center;">상품관리</h2>
							<button class="add btn btn-default" type="button">상품등록</button>
							</caption>
							<thead>
								<tr class="active">
									<th scope="col">상품번호</th>
									<th scope="col">상품이름</th>
									<th scope="col">판매가격</th>
									<th scope="col">포인트</th>
									<th scope="col">배송비</th>
									<th scope="col">상품등록일</th>
									<th scope="col">수정</th>
									<th scope="col">삭제</th>
								</tr>
							</thead>

							<c:forEach var="goods" items="${ goodsList }">
								<tr>
									<td>${ goods.goods_idx }</td>
									<td>${ goods.goods_name }</td>
									<td>${ goods.goods_price }</td>
									<td>${ goods.goods_point }</td>
									<td>${ goods.delivery_price }</td>
									<td>${ goods.goods_regdate }</td>
									<td><a
										href="/updateGoodsForm?goods_idx=${ goods.goods_idx }">수정</a></td>
									<td><a href="/deleteGoods?goods_idx=${ goods.goods_idx }">삭제</a></td>
								</tr>
							</c:forEach>

						</table>
						<div id="pagingDiv">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="pagingBtn page-item"><a
										class="page-link pagingBtn shadow-none"
										href="admin${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li class="pagingBtn page-item pagingBtn"><a
										class="page-link shadow-none"
										href="admin${pageMaker.makeQuery(idx)}">${idx}</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="pagingBtn page-item"><a
										class="page-link pagingBtn shadow-none"
										href="admin${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
								</c:if>
							</ul>

						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
