<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<style>
</style>

</head>
<body>
   <!-- Header -->
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
   
   <!-- 회원 조회 -->
   <a href="/memberList">회원조회</a>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
   <a href="/addNewGoodsForm">상품등록</a>
   <hr>
   <caption>상품리스트</caption>
  <table class="table table-striped table-bordered">
    <tr>
      <td>상품번호</td>
      <td>상품이름</td>
      <td>판매가격</td>
      <td>포인트</td>
      <td>배송비</td>
      <td>상품등록일</td>
      <td>수정</td>
      <td>삭제</td>
    </tr>
    <c:forEach var="goods" items="${ goodsList }">
    <tr>
      <td>${ goods.goods_idx }</td>
      <td>${ goods.goods_name }</td>
      <td>${ goods.goods_price }</td>
      <td>${ goods.goods_point }</td>
      <td>${ goods.delivery_price }</td>
      <td>${ goods.goods_regdate }</td>
      <td><a href="/updateGoodsForm?goods_idx=${ goods.goods_idx }">수정</a></td>
      <td><a href="/deleteGoods?goods_idx=${ goods.goods_idx }">삭제</a></td>
    </tr>
    </c:forEach>
    
    
  </table>
  <div id="pagingDiv ">
    <ul class="pagination justify-content-center">
    <c:if test="${pageMaker.prev}">
    	<li class="page-item"><a class="page-link" href="memberList${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li class="page-item"><a class="page-link" href="memberList${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li class="page-item"><a class="page-link" href="memberList${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
    </ul>
  </div>
</body>
</html>
