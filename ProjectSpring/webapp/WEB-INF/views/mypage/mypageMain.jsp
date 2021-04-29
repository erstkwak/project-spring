<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>
	#myPage-body {margin-bottom: 0px; padding-bottom: 50px; font-size: 16px; background-color: #e9e9e9; }
	.table {background-color: white;}
	#wrapper {width: 1000px;}
	.table>tbody>tr>td {padding: 30px;}
	.table>tbody>tr>td:nth-of-type(1) {text-align: center;}
	#main {padding-top: 50px;}
</style>

<div id="myPage-body">
<section class="blog" id="main">
  <div class="container">
	<div class="row">
	  <div class="col-md-12 col-sm-12 col-xs-12">
		<div id="wrapper" style="margin: 0 auto;">
		  <table class="table">
			<caption>
			  <h2 style="text-align: center;">회원 정보</h2>
			</caption>
			<tr>
			  <td>이름</td>
			  <td colspan="2">${login.mem_name}</td>
			</tr>
			<tr>
			  <td>이메일</td>
			  <td colspan="2">${login.mem_email}</td>
			</tr>
			<tr>
			  <td>전화번호</td>
			  <td colspan="2">${login.mem_phone}</td>
			</tr>
			<tr>
			  <td>주소</td>
			  <td>${login.mem_address }</td>
			  <td>${login.mem_detailaddress }</td>
			</tr>
			<tr style="text-align: center;">
			  <td colspan="3">
			    <input type="button" class="btn btn-success" value="회원정보관리" id="btnUpdate" />
			    <input type="button" class="cancle btn btn-danger" value="회원탈퇴" id="btnDelete" />
			  </td>
			</tr>
		</table>
	    </div>
	  </div>
    </div>
  </div>
</section>
</div>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(function() {
	  $('input[type=button]').on('click', function(event) {
		  var btn = event.target;
		  var href = '';
		  switch( btn.id ) {
		  
		  case 'btnUpdate':
			  href     = '/passCheckForm';
		  	  break;
		  case 'btnDelete':
			  href     = '/memberDelForm';
		  	  break;

		  }
		  location.href = href;
	  })
 });
</script>