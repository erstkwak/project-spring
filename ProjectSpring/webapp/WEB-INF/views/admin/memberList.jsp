<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>
	/* 본문 */
	#list-body {font-size: 16px; padding-bottom: 50px; }
	tr, th, td {text-align: center;}
	td:nth-of-type(2) {text-align: left;}
	/* 페이징 스타일 */
	#pagingDiv {display: flex; justify-content: center; align-items: center;}
	.pagination>li>a, .pagination>li>span {color: black;}
	.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {background-color: white; border-color: black; color: black}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<div id="list-body">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div id="wrapper">
						<table class="table table-hover">
							<caption>
								<h2 style="text-align: center;">회원 리스트</h2>
							</caption>
							<thead>
								<tr class="active">
									<th scope="col">아이디</th>
									<th scope="col">비밀번호</th>
									<th scope="col">이름</th>
									<th scope="col">이메일</th>
									<th scope="col">가입일</th>
									<th scope="col">수정</th>
									<th scope="col">삭제</th>
								</tr>
							</thead>         
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
  
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>