<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>
	#writeTable input[type=text] {
		width: 550px;
		height: 300px
	}
	#writeTable textarea {
		width: 550px;
		height: 300px;
	}
	.contact-block {
		padding-bottom: 50px;
		background-color: #e9e9e9;
	}
</style>

<section class="contact-block" style="text-align:center;">
	<table style="margin:0 auto;">
		<tr>
			<td style="text-align:center; width:100px; height:50px;">작성자</td>
			<td><input type="text" name="writer" id="writer" class="form-control" value="${login.mem_id }"
					style="height:50px; width:100%;" readonly /><br></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td><input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력해주세요" style="height:50px; width:100%;" /><br></td>
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
</textarea><br>
			</td>
		</tr>
		<tr>
			<td>사진 선택</td>
			<td id="tdfile">
				<input type="file" name="upfile" class="file" id="사진등록" accept="image/*" class="form-control"><br>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="form-inline" style="padding-left: 80px;">
			<div class="form-group">
				<input type="submit" value="확인" id="final-submit-btn" class="form-control" style="width: 150px;"/>
			</div>
			<div class="form-group">
				<a href="/PBoard/List">
					<input type="button" value="목록" id="btnWrite" class="form-control" style="width: 150px;" />
				</a>
			</div>
			</td>
		</tr>
	</table>
</section>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.1.2/firebase-storage.js"></script>
<script type="text/javascript" src="/js/firebase.js"></script>