<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/commons.css" />
<style>
  #writeTable  input[type=text] { width:550px; height:300px} 
  #writeTable  textarea         { width:550px;  height:300px;                                  
  } 
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
<script>
</script>
</head>
<body>


            <!--end-->
<section class="contact-block" style="text-align:center;">
            <!-- 새글 쓰기 -->
	   <!-- <form action="/PBoard/Write"  method="POST" id="form1"
	        enctype="multipart/form-data"> -->
   <%-- <table class="table"  id="writeTable" style="width:200px;margin:0 auto;'">
	    <caption><h2>새글쓰기</h2></caption>
	    <tr style="height:200px;">
	      <td style="text-align:center; width:100px; height:50px;">작성자</td>
	      <td>
	      	<input type="text" name="writer"  id="writer" value="${login.mem_id }" class="form-control"  style="height:50px;" readonly/> <!-- 로그인된 유저아이디  -->
	      </td>
	    </tr> 
	    <tr style="height:200px;">
	      <td style="text-align:center; width:100px; height:50px;">글제목</td>
	      <td><input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력해주세요"/></td>
	    </tr> 
	    <tr>
	      <td>글내용</td>
	      <td>
	      <textarea class="form-control" rows="3">

"캠핑후기 쓰기전 필독! 주의하세요!""
	
* 욕설이나, 비방글을 남길시 즉시 게시글 삭제 될 것입니다. 
* 캠핑 후기 게시판은 광고목적으로 만들어진 게시판이 아닙니다.
  광고글 작성시 게시글 삭제와 계정 탈퇴 처리 될 것입니다. 
 
------------------------------------------------------------------------- "
	</textarea></td>
	    </tr> 
	    <tr>
	      <td>사진 선택</td>
	      <td id="tdfile">
	        <input type="file" name="upfile" class="file" id="사진등록" accept="image/*" class="form-control"><br>   
	      </td>
	    </tr> 
	    <tr>      
	      <td colspan="2">
	        <!-- <a><input type="button" value="확인"   id="final-submit-btn"/></a> -->
	        <input type="submit" value="확인"  id="final-submit-btn"  class="form-control"/>
	        <a href="/PBoard/List"><input type="button" value="목록"  id="btnWrite" class="form-control" /></a>
	      </td>
	    </tr> 
	   </table>    --%>
	   
	   
	   <table style="margin:0 auto;">
		  <colgroup>
		    <col width="100px"/>
		    <col width="600px"/>
		  </colgroup>
		
		  
	      <tr>
		      <td style="text-align:center; width:100px; height:50px;">작성자</td>
		      <td><input type="text" name="writer"  id="writer" class="form-control"  value="${login.mem_id }" style="height:50px; width:100%;" readonly /></td>
	      </tr>
	      <tr>
	      		<td>글제목</td>
	      		<td><input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력해주세요"/></td>
	      </tr>
	       <tr>
		      <td>글내용</td>
		      <td>
   		      <textarea class="form-control" id="cont" rows="3" style="width:550px; height:300px">

"캠핑후기 쓰기전 필독! 주의하세요!""
	
* 욕설이나, 비방글을 남길시 즉시 게시글 삭제 될 것입니다. 
* 캠핑 후기 게시판은 광고목적으로 만들어진 게시판이 아닙니다.
  광고글 작성시 게시글 삭제와 계정 탈퇴 처리 될 것입니다. 
 
------------------------------------------------------------------------- "
</textarea></td>
	      </tr>
		 <tr>
	      <td>사진 선택</td>
	      <td id="tdfile">
	        <input type="file" name="upfile" class="file" id="사진등록" accept="image/*" class="form-control"><br>   
	      </td>
	    </tr> 
	    <tr>      
	      <td colspan="2">
	        <!-- <a><input type="button" value="확인"   id="final-submit-btn"/></a> -->
	        <input type="submit" value="확인"  id="final-submit-btn"  class="form-control"/>
	        <a href="/PBoard/List"><input type="button" value="목록"  id="btnWrite" class="form-control" /></a>
	      </td>
	    </tr>
		</table>
</section>

</body>
</html>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
