<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<section class="image-head-wrapper" style="background-image: url('/images/banner5.jpg');">
  <div class="inner-wrapper">
    <h1>고캠핑 쇼핑몰에 오신것을 환영합니다!</h1>
  </div>
</section>
<div class="clearfix"></div>

<section class="resort-overview-block">
  <div class="container">
    <div class="row">

    
    <c:forEach var="list" items="${shoppingList}">
      <div class="col-md-6 col-sm-12 col-xs-12 remove-padd-right">
        <div class="side-A">
          <div class="product-thumb">
            <div class="image">
               <c:url value="/displayImg" var="url">
    	         <c:param name="filename" value="${list.uploadpath}/s_${list.img_name}_${list.filename}" />
    	       </c:url>
		
              <a href="single-blog.html"><img alt="image" class="img-responsive" src="${url}"></a>
            </div>
          </div>
        </div>
        <div class="side-B">
          <div class="product-desc-side">
            <h3><a href="single-blog.html">${ list.goods_name }</a></h3>
            <p>${ list.goods_info }</p>
            <p>${ list.goods_price }원</p>
            <div class="links"><a href="single-blog.html">구매하기</a></div>
          </div>
        </div>
      </div>
      
      <div class="clear"></div>
      <br>
      </c:forEach>
      

      <div class="clearfix"></div> 
    </div>
  </div>
          <div id="pagingDiv ">
    <ul class="pagination justify-content-center">
    <c:if test="${pageMaker.prev}">
    	<li class="page-item"><a class="page-link" href="shopping${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li class="page-item"><a class="page-link" href="shopping${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li class="page-item"><a class="page-link" href="shopping${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
    </ul>
  </div>
</section>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>