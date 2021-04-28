<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<section class="image-head-wrapper"
	style="background-image: url('/images/campingboard.jpg'); background-repeat: round; width:100%; height: 500px;">
	<div class="inner-wrapper">
		<h1 style="font-size: 35px;">캠핑 후기</h1>
	</div>
</section>
<div class="clearfix"></div>
<div style="padding-bottom: 50px; padding-top: 50px; background-color: #e9e9e9;">
<table>
  <tr class="form-inline">
    <td class="form-control" style="width: 20%; text-align: center;">글번호</td>
    <td colspan="3" style="width: 80%;" class="form-control"> ${ pboard.idx }</td>
  </tr>
  <tr class="form-inline">
    <td class="form-control" style="width: 20%; text-align: center;">작성일자</td>
    <td colspan="3" style="width: 80%;" class="form-control"> ${ pboard.regdate }</td>
  </tr>
  <tr class="form-inline">
    <td class="form-control" style="width: 20%; text-align: center;">제목</td>
    <td colspan="3" style="width: 80%;" class="form-control"> ${ pboard.title }</td>
  </tr>
  <tr class="form-inline">
    <td class="form-control" style="width: 20%; text-align: center;">아이디</td>
    <td colspan="3" style="width: 80%;" class="form-control"> ${ pboard.mem_id }</td>
  </tr>
  <tr>
    <td class="form-control" style="text-align: center;">내용</td>

    <td colspan="3" class="form-control"
      style="font-size: 15px; width: 800px; height: 800px; text-align:center"><br><img src="${ pboard.img_url }"
        style="width: 80%; height: 80%;" onerror="this.src='/images/none.png'" alt="My Image"><br><br>${ pboard.cont
      }</td>
  </tr>
  <tr>
    <td colspan="4" style="text-align: center; background-color: white;">
      <a href="/PBoard/WriteForm"><input type="button" class="btn btn-default" value="새글쓰기" id="btnWrite" /></a>
      &nbsp;<a href="/PBoard/UpdateForm?idx=${ pboard.idx }"><input type="button" class="btn btn-default" value="수정" id="btnWrite" /></a>
      &nbsp;<a href="/PBoard/Delete?idx=${ pboard.idx }"><input type="button" class="btn btn-default" value="삭제" id="btnDelete" /></a>
      &nbsp;<a href="/PBoard/List"><input type="button" class="btn btn-default" value="목록" id="btnWrite" /></a>
    </td>
  </tr>
  <%@ include file="/WEB-INF/views/pboard/comment.jsp" %>
</table>
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