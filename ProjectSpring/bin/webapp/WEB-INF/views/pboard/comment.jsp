<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/commons.css" />
<style>
    h2          { text-align: center; font-size:50px;}
    #leftbox      { width: 200px; }
    a       { text-decoration: none; color:black;  }
    a:hover { text-decoration: none; color:red;  }
    table     {  width:800px; margin:0 auto;  }
	table, td {  border:1px solid black;
	    border-collapse:collapse;	    
	}
	td                {  padding:10px;  }
   .tdcont {  height:300px; vertical-align: top; text-align: center;  }
   .tdfile {  height:100px; vertical-align: top;  }
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
<div id="replies">
</div>
		<tr>
			<input type="hidden" id="idx" name="idx" value="${pboard.idx}">
			<td><label>댓글 작성자</label> <input type="text" id="mem_id" name="mem_id" value="${login.mem_id }" redonly></td>
			<td><textarea rows="5" cols="50" id="comment_content" name="comment_content"></textarea></td>
			<td><button id="comment_submit" name="comment_submit">댓글 작성</button></td>
		</tr>	
		<c:forEach items="${comment}" var="comment">
	<tr>
			<input type="hidden" id="idx" name="idx" value="${comment.idx}">
			<input type="hidden" id="comment_num" name="comment_num" value="${comment.comment_num}">
			<td>${comment.mem_id} / ${comment.comment_regdate}</td>
			<td colspan="3" >${comment.comment_content }<button id="comment_delete" name="comment_delete">삭제</button></td>
	</tr>	
		</c:forEach>
	</table>
</body>
</html>

