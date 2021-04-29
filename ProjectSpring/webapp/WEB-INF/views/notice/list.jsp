<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>


<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>
	#main {background-color: #e9e9e9;}
	.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {background-color: black; border-color: black;}
</style>

<!-- 페이지 소개 이미지 -->
<section class="image-head-wrapper" style="background-image: url('/images/noticeimage.jpg'); width:100%; height: 500px;">
	<div class="inner-wrapper">	
		<h1 style="font-size: 35px;">공지사항</h1>
	</div>
</section>
<div class="clearfix"></div>

<!-- 본문 -->
<section class="blog" id="main">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 50px;">
				<div class="box-header with-border"></div>
				<div id="wrapper">
					<div class="box-body">
						<table class="table table-hover" style="background-color: white;">
							<thead class="thead-dark">
								<tr>
									<th scope="col" style="text-align: center;">번호</th>
									<th scope="col" style="text-align: center;">제목</th>
									<th scope="col" style="text-align: center;">작성자</th>
									<th scope="col" style="text-align: center;">작성일</th>
									<th scope="col" style="text-align: center;">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="board" items="${boardList}">
									<tr>
										<td style="text-align: center;">
											<c:out value="${board.nb_no}" />
										</td>
										<td>
											<a href="${path}/notice/read?nb_no=${board.nb_no}">
												<c:out value="${board.nb_title}" />
											</a>
											<span class="badge bg-teal"><i class="fa fa-comment-o"></i> 댓글수 ${board.nb_replycount}</span>
										</td>
										<td style="text-align: center;">
											<c:out value="${board.mem_id}" />
										</td>
										<td style="text-align: center;">
											<fmt:formatDate pattern="yyyy-MM-dd" value="${board.nb_regdate}" />
										</td>
										<td style="text-align: center;"><span class="badge bg-red">
												<c:out value="${board.nb_count}" />
											</span></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
							<tr>
								<td colspan="5" class="form-inline" style="text-align: center;">
									<div class="form-group">
												<select name="perPageNum" id="perPageNum">
													<option ${cri.perPageNum==10?"selected='selected'":"" }>10</option>
													<option ${cri.perPageNum == 20?" selected='selected'":"" }>20</option>
													<option ${cri.perPageNum == 30?" selected='selected'":"" }>30</option>
													<option ${cri.perPageNum == 50?" selected='selected'":"" }>50</option>
													<option ${cri.perPageNum == 100?" selected='selected'":"" }>100</option>
												</select> <span style="font-size: 16px;">&nbsp;개 씩 글 보기</span>
											</div>
										</div>
								<div class=" form-group">
									<form class="navbar-form form-control">
										<div class="form-group form-row navbar-left">
											<select class="form-control navbar-left list-group" name="searchType">
												<option value="n" ${cri.searchType=="n" ?"selected='selected'":"" }>---검색분류---</option>
														<option value=" t" ${cri.searchType=="t" ?"selected='selected'":"" }>제목</option>
														<option value=" c" ${cri.searchType=="c" ?"selected='selected'":"" }>내용</option>
														<option value=" w" ${cri.searchType=="w" ?"selected='selected'":"" }>작성자</option>
														<option value=" tc" ${cri.searchType=="tc" ?"selected='selected'":"" }>제목+내용</option>
														<option value=" cw" ${cri.searchType=="cw" ?"selected='selected'":"" }>내용+작성자</option>
														<option value=" tcw" ${cri.searchType=="tcw" ?"selected='selected'":"" }>제목+내용+작성자</option>
													</select> 
													<input type=" text" class="form-control navbar-left " placeholder="검색어를 입력하세요." name="keyword"
													value="${cri.keyword }">
													<button type="submit" class="btn btn-dark btn-lg form-control" style="padding: 5px;">
														<i class="fa fa-search"></i> 검색
													</button>
										</div>
									</form>
						</div>
								
								
									<div class="form-group">
										<c:if test="${isLogOn == true and login.mem_id=='admin'}">
											<button type="button" class="btn btn-success" id="writeBtn">
												<i class="fa fa-pencil"></i>글쓰기
											</button>
										</c:if>
									</div>
								</td>
							</tr>
								<tr>
									<td colspan="5">
										<div class="box-footer">
											<div class="text-center">
												<ul class="pagination">
													<c:if test="${cri.prev }">
														<li><a
																href="/notice/list?page=${cri.startPage-1 }&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">
																<i class="glyphicon glyphicon-step-backward"></i>
															</a></li>
													</c:if>
													<c:forEach begin="${cri.startPage }" end="${cri.endPage }" var="idx">
														<li ${cri.page==idx?"class='active'":"" }><a href=" /notice/list?page=${idx
															}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx
															}</a></li>
													</c:forEach>
													<c:if test="${cri.next }">
														<li><a
																href="/notice/list?page=${cri.endPage+1 }&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">
																<i class="glyphicon glyphicon-step-forward"></i>
															</a></li>
													</c:if>
												</ul>
											</div>
										</div>
									</td>
								</tr>
							</tfoot>
						</table>

					
					</div>
				</div>
			</div>
			</div>
			</div>
			</section>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>

<script>
	$(document).ready(function() {
		var result = "${msg}";
		if (result == "regSuccess") {
		    alert("게시글 등록이 완료되었습니다.");
		} else if (result == "modSuccess") {
		    alert("게시글 수정이 완료되었습니다.");
		} else if (result == "delSuccess") {
		    alert("게시글 삭제가 완료되었습니다.");
		}
		$('#writeBtn').on('click', function() {
			location = '/notice/write';
		});
		
		// 버튼 이벤트 처리
		// 글쓰기 버튼
		$("#writeBtn").click(function(){
			location = "write.do";
		});
		// 새로고침 버튼
		$("#reloadBtn").click(function(){
			location.reload();
		});
		// 게시글에 대한 tr 이벤트 처리
		$(".data").click(function(){
			//var no = $(this).find("td:first").text();
			//location = "/notice/view?no="+no		// 글번호를 전달한다.
			location = "${path}/notice/read?nb_no=${board.nb_no}" // 글번호를 전달한다.

					+"&page=${cri.page}"	// 페이지 전달.
					+"&perPageNum=${cri.perPageNum}"  // 한 페이지에 몇 개를 출력할지 결정.
					+"&searchType=${cri.searchType}"  // 서치 타입을 결정
					+"&keyword=${cri.keyword}";  // 키워드 설정
		});
		// 표시하는 글 수를 바꾸면 이벤트 처리를 해서 다시 리스트를 불러온다.
		$("#perPageNum").change(function(){
			location = "/notice/list?"
				//+"page="+$("#page").val() // 페이지 전달한다.
				+"page=1" // 페이지 전달한다.
				+"&perPageNum="+$("#perPageNum").val() // 페이지 당 글수 전달
				+"&searchType=${cri.searchType}"  // 서치 타입을 결정
				+"&keyword=${cri.keyword}";   // 키워드 설정
		});
	});
</script>
