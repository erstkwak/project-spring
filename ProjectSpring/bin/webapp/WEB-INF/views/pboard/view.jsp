<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="/css/commons.css" /> -->
<style>
/*     h2          { text-align: center; font-size:50px;}
    #leftbox      { width: 200px; }
    table     {  width:800px; margin:0 auto;  }
	td                {  padding:10px;  }
   .tdcont {  height:300px; vertical-align: top; text-align: center;  }
   .tdfile {  height:100px; vertical-align: top;  } */
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-storage.js"></script>
<script type="text/javascript" src="/js/firebase.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

</head>
<body>   
   <table>
   <caption><h1>여행 후기</h1></caption>
   <tr>
     <td class="form-control" >글번호</td>
     <td colspan="3" class="form-control"> ${ pboard.idx }</td>
   </tr> 
   <tr>
     <td class="form-control" >작성일자</td>
     <td colspan="3" class="form-control"> ${ pboard.regdate }</td>
   </tr> 
   <tr>
     <td class="form-control" >제목</td>
     <td colspan="3" class="form-control"> ${ pboard.title }</td>
   </tr> 
   <tr>
     <td class="form-control" >아이디</td>
     <td colspan="3" class="form-control"> ${ pboard.mem_id }</td>
   </tr> 
   <tr >
     <td  class="form-control" >내용</td>
     
	<td colspan="3" class="form-control" style="font-size: 15px; width: 800px; height: 800px; text-align:center"><br><img src="${ pboard.img_url }" style="width: 80%; height: 80%;" onerror="this.src='/images/none.png'" alt="My Image"><br>${ pboard.cont }</td>
   </tr> 
   <tr>
     <td colspan="4">
            <a href="/PBoard/WriteForm"><input type="button" value="새글쓰기"   id="btnWrite"/></a>
            <a href="/PBoard/UpdateForm?idx=${ pboard.idx }"><input type="button" value="수정"   id="btnWrite"/></a>
             <a href="/PBoard/Delete?idx=${ pboard.idx }"><input type="button" value="삭제"   id="btnDelete"/></a>
            <a href="/PBoard/List"><input type="button" value="목록"   id="btnWrite"/></a>
     </td>
   </tr>
   <%@ include file="/WEB-INF/views/pboard/comment.jsp" %>
	</table>
</body>
</html>









<%@ include file="/WEB-INF/views/includes/footer.jsp" %>



