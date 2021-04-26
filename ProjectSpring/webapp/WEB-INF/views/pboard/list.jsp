<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-storage.js"></script>
<script type="text/javascript" src="/js/firebase.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
  <body>
       <section class="image-head-wrapper" style="style-align:center; background-image: url('/images/banner.jpg');width:1200px;height:500px;margin:0 auto;">
       </section>
       
       <div style="width:1200px;margin:0 auto;">
       <img style="text-align:center;"  src="/images/p_view.jpg">
       <%-- <caption><h1 style="text-align : center;">여행 후기</h1></caption> --%>
	       <div class="row" style="text-align:center;">
		       <c:forEach var="pboardList" items="${ pboardList }">
		         <div class="col-md-4" style=" height:400px; flex:auto;">
		           <h2><a href="/PBoard/View?idx=${ pboardList.idx }">${ pboardList.title }</a></h2>
		           <p><a href="/PBoard/View?idx=${ pboardList.idx }"><img src="${ pboardList.img_url }" style="width: 300px; height: 300px;" onerror="this.src='/images/none.png'" alt="My Image" id="photo"></a></p>
		         </div><!--/.col-xs-6.col-lg-4-->
		        </c:forEach> 
	        </div><!--/row-->
       </div>
       
       
    <div class="container">
      <div class="row row-offcanvas row-offcanvas-right" align="center">
      	<div class="col-md-1">
        </div>
        <div class="col-md-10" style="text-align : center">
            <div>
         	  <a href="/PBoard/WriteForm"><input type="button" value="캠핑후기 쓰기"  id="btnWrite" class="form-control" /></a>
		    </div>
			<div>
				<select name="searchType">
				    <option value="title" <c:if test="${search.searchType eq 'title'}">selected</c:if>>제목</option>
			        <option value="cont" <c:if test="${search.searchType eq 'cont'}">selected</c:if>>내용</option>
				    <option value="title_cont" <c:if test="${search.searchType eq 'title_cont'}">selected</c:if>>제목+내용</option>
				    <option value="mem_id" <c:if test="${search.searchType eq 'mem_id'}">selected</c:if>>작성자</option>
				</select>
				<input type="text" name="keyword" value="${search.keyword}"/>
				<button type="button" id="searchBtn">검색</button>
			</div>
			  <div id="pagingDiv ">
		    <ul class="pagination justify-content-center">
		    <c:if test="${pageMaker.prev}">
		    	<a class="page-link" href="List${pageMaker.makeQuery(pageMaker.startPage - 1)}">[<]</a>
		    </c:if> 
		
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		    	<a class="page-link" href="List${pageMaker.makeQuery(idx)}">[${idx}]</a>
		    </c:forEach>
		
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		    	<a class="page-link" href="List${pageMaker.makeQuery(pageMaker.endPage + 1)}">[>]</a>
		    </c:if> 
		    </ul>
		  </div>
        </div>
        <div class="col-md-1">
        </div>
      </div>
      <hr>
    </div>
    </body>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
	<script>
		document.getElementById("searchBtn").onclick = function () {
			let searchType = document.getElementsByName("searchType")[0].value;
			let keyword =  document.getElementsByName("keyword")[0].value;
			location.href = "/PBoard/List?page=1&perPageNum=20" + "&searchType=" + searchType + "&keyword=" + keyword;
		};
	</script>	
    
</html>




<%@ include file="/WEB-INF/views/includes/footer.jsp" %>








