<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/css/bootstrap.min.css">

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>
	.table>tbody>tr>td {padding: 20px;}
	.table {background-color: white;}
	#updateForm-body {padding-top: 100px; padding-bottom: 100px; background-color: #e9e9e9;}
  #pagingDiv {display: flex; justify-content: center; align-items: center;}
	#pagingDiv ul li {list-style: none; display: inline-block;}
	#pagingDiv li.active a {color: #fff; background: #343A40; border-color: #343A40;}
	.pagination>li>a, .pagination>li>span {color: black;}
	.pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus, .pagination>li>span:hover {color: black;}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<div id="updateForm-body">
  <div id="wrap">
    <div id="article-body">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <table class="table table-bordered table-hover">
              <legend style="text-align: center;">회원 리스트</legend>
              <tr>
                <td>아이디</td>
                <td>비밀번호</td>
                <td>이름</td>
                <td>이메일</td>
                <td>가입일</td>
                <td>수정</td>
                <td>삭제</td>
              </tr>
              <c:forEach var="member" items="${ memberList }">
                <tr>
                  <td>${ member.mem_id }</td>
                  <td>${ member.mem_pw }</td>
                  <td>${ member.mem_name }</td>
                  <td>${ member.mem_email }</td>
                  <td>${ member.mem_regdate }</td>
                  <td><a href="/updateMemberForm?mem_id=${ member.mem_id }">수정</a></td>
                  <td><a href="/Admin/delMember?mem_id=${ member.mem_id }">삭제</a></td>
                </tr>
              </c:forEach>
            </table>
            <div id="pagingDiv">
              <ul class="pagination">
                <c:if test="${pageMaker.prev}">
                  <li class="page-item"><a class="page-link"
                      href="memberList${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
                  </li>
                </c:if>
                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                  <li class="page-item"><a class="page-link" href="memberList${pageMaker.makeQuery(idx)}">${idx}</a>
                  </li>
                </c:forEach>
                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                  <li class="page-item"><a class="page-link"
                      href="memberList${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
                  </li>
                </c:if>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
  
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>