<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>
  .td1 {
    width: 178px;
    text-align: center;
  }

  .td2 {
    width: 178px;
    text-align: left;
  }

  .td3 {
    width: 178px;
    text-align: center;
  }

  .td4 {
    width: 178px;
    text-align: left;
  }

  .td5 {
    width: 578px;
    text-align: left;
  }

  #cont {
    height: 300px;
    text-align: left;
  }

  [type=text] {
    width: 570px;
  }

  textarea {
    width: 570px;
    height: 400px;
  }
  #update-body {
    background-color: #e9e9e9;
    padding-bottom: 50px;
  }
 	table, tr, td, th {
		padding: 10px;
		border: 1px solid black;
		background-color: white;
	}
</style>

<section class="image-head-wrapper"
	style="background-image: url('/images/campingboard.jpg'); background-repeat: round; width:100%; height: 500px;">
	<div class="inner-wrapper">
		<h1 style="font-size: 35px;">캠핑 후기</h1>
	</div>
</section>

<div id="update-body">
<section style="text-align:center;">
  <table id="updateTable" style="margin:0 auto;">
    <colgroup>
      <col width="100px" />
      <col width="600px" />
    </colgroup>
    <input type="hidden" name="idx" id="idx" value="${ pboardView.idx }" />
    <tr>
      <td>작성자</td>
      <td><input type="text" name="writer" id="writer" class="form-control" value="${pboardView.mem_id }"
          readonly /> <!-- 로그인된 유저아이디  -->
      </td><br>
    </tr>
    <tr>
      <td>글제목</td>
      <td><input type="text" name="title" id="title" class="form-control" value="${ pboardView.title }" /></td><br>
    </tr>
    <tr>
      <td>글내용</td>
      <td>
        <textarea name="cont" class="form-control" id="cont">${ pboardView.cont }</textarea><br>
      </td>
    </tr>
    <tr>
      <td>사진 선택</td>
      <td id="tdfile">
        <input type="file" name="upfile" class="file" id="사진등록" accept="image/*"><br>
      </td>
    </tr>
    <tr>
      <td colspan="2" style="text-align: center;">
        <input type="submit" value="수정" id="btnUpdate" class="form-control btn btn-default" style="width: 150px;" />
        <a href="/PBoard/List"><input type="button" class="form-control btn btn-default" value="목록" style="width: 150px;" id="btnWrite" /></a>
      <br>
      </td>
      <br>
    </tr>
  </table>
</section>
</div>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-storage.js"></script>
<script type="text/javascript" src="/js/firebase.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
  integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
  crossorigin="anonymous"></script>