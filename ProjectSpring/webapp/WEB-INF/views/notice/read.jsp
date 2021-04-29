<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style>
</style>
</head>
<body>
<!-- header.jsp -->
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<!-- 페이지 소개 이미지 -->
<section class="image-head-wrapper" style="background-image: url('/images/qnabanner.jpg');">
	<div class="inner-wrapper">
		<h1 style="font-size: 30px;">공지사항 게시판 상세보기</h1>
	</div>
</section>
	
<div class="clearfix"></div>

<div id="wrap">
<div id="article-body">
<section class="blog" id="main">
	<div class="container">
<!-- 게시글 -->	
	<div class="col-md-10 col-sm-10 col-xs-12">
	    <div class="box box-primary">
	        <div class="box-header with-border">
	            <h3 class="box-title">글제목 : ${board.nb_title}</h3>
	        </div>
	        <div class="box-body" style="height:500px">
	            ${board.nb_content}
	        </div>
	        <div class="box-footer">
	            <div class="user-block">
	                <span class="username">
	                    <a href="#">${board.mem_id}</a>
	                </span>
	                <span class="description"><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${board.nb_regdate}"/></span>
	            </div>
	        </div>
	        <div class="box-footer">
	            <form role="form" method="post">
	                <input type="hidden" id="nb_no" name="nb_no" value="${board.nb_no}">
	            </form>
	            <div class="pull-right">
	            	<button type="submit" class="btn btn-primary listBtn"><i class="fa fa-list"></i>목록</button>
	            	<c:if test="${isLogOn == true and login.mem_id=='admin'}">
		                <button type="submit" class="btn btn-warning modBtn"><i class="fa fa-edit"></i>수정</button>
		                <button type="submit" class="btn btn-danger delBtn"><i class="fa fa-trash"></i>삭제</button>
	                </c:if>
	            </div>
	        </div>
	    </div>
	</div>
	</div>
</section>	

<!-- 댓글 -->
<section class="content container-fluid">
  <div class="col-lg-12">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">댓글 작성</h3>
        </div>
        <div class="box-body">
            <div class="form-group">
                <label for="newReplyText">댓글 내용</label>
                <input class="form-control" id="newReplyText" name="newReplyText" placeholder="댓글 내용을 입력해주세요">
            </div>
            <div class="form-group">
                <label for="newReplyWriter">댓글 작성자</label>
                <input class="form-control" id="newReplyWriter" name="newReplyWriter" value="${login.mem_id}" readonly >
            </div>
            <div class="form-group">
                <label for="replyAddBtn">댓글 저장</label>
                <input type="hidden" name="nb_no" value="${board.nb_no}">
                <button type="button" class="btn btn-primary btn-block replyAddBtn" id="replyAddBtn"><i class="fa fa-save"></i> 저장</button>
            </div>
        </div>
        <!-- 댓글목록 -->
        <div class="box-footer">
            <ul id="replies">
			
            </ul>
        </div>
        <!-- 페이징 -->
        <div class="box-footer">
            <div class="text-center">
                <ul class="pagination pagination-sm no-margin">

                </ul>
            </div>
        </div>
    </div>
  </div>
</section>  
  
  <div class="modal fade" id="modifyModal" role="dialog" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">댓글 수정창</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="nr_no">댓글 번호</label>
                    <input class="form-control" id="nr_no" name="nr_no" readonly>
                </div>
                <div class="form-group">
                    <label for="nr_content">댓글 내용</label>
                    <input class="form-control" id="nr_content" name="nr_content" placeholder="댓글 내용을 입력해주세요">
                </div>
                <div class="form-group">
                
                    <label for="mem_id">댓글 작성자</label>
                    <input class="form-control" id="mem_id" name="mem_id"  value="${login.mem_id}"  readonly>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-success modalModBtn">수정</button>
                <button type="button" class="btn btn-danger modalDelBtn">삭제</button>
            </div>
        </div>
    </div>
  </div>

</div>
</div>
<!-- footer.jsp -->
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

</body>
<script src="/js/reply.js"></script>

<script>
	$(document).ready(function () {
//게시판
	    var formObj = $("form[role='form']");
	    //console.log(formObj);
	    $(".modBtn").on("click", function () {
	        formObj.attr("action", "/notice/modify");
	        formObj.attr("method", "get");
	        formObj.submit();
	    });
	    $(".delBtn").on("click", function () {
	       formObj.attr("action", "/notice/remove");
	       formObj.submit();
	    });
	    $(".listBtn").on("click", function () {
	       self.location = "/notice/list"
	    });

//댓글
	var nb_no = ${board.nb_no};
	//console.log("게시글번호 = " + nb_no);
	var page = 1;
	getRepliesPaging(page);
	
	// 댓글 저장 버튼 클릭 이벤트 발생시
	$("#replyAddBtn").on("click", function () {
	    // 화면으로부터 입력 받은 변수값의 처리
	    var replyText = $("#newReplyText");
	    var replyWriter = $("#newReplyWriter");

	    var replyTextVal = replyText.val();
	    var replyWriterVal = replyWriter.val();
	    
	    var nb_no = $('#nb_no').val();	    
		console.log(nb_no);
	    // AJAX 통신 : POST
	    $.ajax({
	        type : "post",
	        url : "/reply/register",
	        headers : {
	            "Content-type" : "application/json",
	            "X-HTTP-Method-Override" : "POST"
	        },
	        dataType : "text",
	        data : JSON.stringify({
	            nb_no : nb_no,
	            mem_id : replyWriterVal,
	            nr_content : replyTextVal
	        }),
	        success : function (result) {
	            // 성공적인 댓글 등록 처리 알림
	            if (result == "regSuccess") {
	                alert("댓글 등록 완료!");
	            }
	            getRepliesPaging(page);
	            replyText.val(""); // 댓글 내용 초기화
	            //replyWriter.val(""); // 댓글 작성자 초기화
	        }
	    });
	});
//댓글의 값 세팅	
	$("#replies").on("click", ".replyLi button", function () {
	    var reply = $(this).parent();

	    var nr_no = reply.attr("data-nr_no");
	    var nr_content = reply.find(".nr_content").text();
	    var mem_id = reply.find(".mem_id").text();

	    $("#nr_no").val(nr_no);
	    $("#nr_content").val(nr_content);
	    $("#mem_id").val(mem_id);

	});
//[모달]댓글 삭제 버튼 누르면 호출	
	$(".modalDelBtn").on("click", function () {
	    // 댓글 번호
	    var replyNo = $(this).parent().parent().find("#nr_no").val();
	    // AJAX통신 : DELETE
	    $.ajax({
	        type : "delete",
	        url : "/reply/delete/" + replyNo,
	        headers : {
	            "Content-type" : "application/json",
	            "X-HTTP-Method-Override" : "DELETE"
	        },
	        dataType : "text",
	        success : function (result) {
	            console.log("result : " + result);
	            if (result == "delSuccess") {
	                alert("댓글 삭제 완료!");
	            	$("#modifyModal").removeClass("in");
	            	$(".modal-backdrop").remove();
	            	$("#modifyModal").hide();
	                //$("#modifyModal").modal('hide'); // Modal 닫기
	                getRepliesPaging(page);
	            }
	        }
	    });
	});	
//[모달]댓글 수정 버튼 누르면 호출		
	$(".modalModBtn").on("click", function () {
	    // 댓글 선택자
	    var reply = $(this).parent().parent();
	    // 댓글번호
	    var nr_no = reply.find("#nr_no").val();
	    // 수정한 댓글내용
	    var nr_content = reply.find("#nr_content").val();
	    // AJAX통신 : PUT
	    $.ajax({
	        type : "put",
	        url : "/reply/update/" + nr_no,
	        headers : {
	            "Content-type" : "application/json",
	            "X-HTTP-Method-Override" : "PUT"
	        },
	        data : JSON.stringify(
	            {nr_content : nr_content}
	        ),
	        dataType : "text",
	        success : function (result) {
	            console.log("result : " + result);
	            if (result == "modSuccess") {
	                alert("댓글 수정 완료!");
	                $("#modifyModal").removeClass("in");
	            	$(".modal-backdrop").remove();
	            	$("#modifyModal").hide();
	                //$("#modifyModal").modal("hide"); // Modal 닫기
	                getRepliesPaging(page);
	            }
	        }
	    });
	});

//댓글 페이징
// 댓글 목록 페이징 함수
	function getRepliesPaging(page, nb_no) {
		var nb_no = ${board.nb_no};
		console.log("게시글번호 = " + nb_no);
	    $.getJSON("/reply/" + nb_no + "/" + page, function (data) {
	        console.log(data);
	        var str = "";
	        
	        $(data.replies).each(function () {
	            str += "<li data-nr_no='" + this.nr_no + "' class='replyLi'>"
	                +  "<p class='nr_content'>" + this.nr_content+ "</p>"
	                +  "<p class='mem_id'>" + this.mem_id + "</p>"
	                +  "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
	                +  "</li>"
	                +  "<hr/>";
	        });
	        $("#replies").html(str);
	        // 페이지 번호 출력 호출
	        printPageNumbers(data.criteria);
	    });
	}
// 댓글 목록 페이지 번호 출력 함수
	function printPageNumbers(criteria) {
	    var str = "";
	    // 이전 버튼 활성화
	    if (criteria.prev) {
	        str += "<li><a href='"+(criteria.startPage-1)+"'>이전</a></li>";
	    }
	    // 페이지 번호
	    for (var i = criteria.startPage, len = criteria.endPage; i <= len; i++) {
	        var strCalss = criteria.page == i ? 'class=active' : '';
	        str += "<li "+strCalss+"><a href='"+i+"'>"+i+"</a></li>";
	    }
	    // 다음 버튼 활성화
	    if (criteria.next) {
	        str += "<li><a href='"+(criteria.endPage + 1)+"'>다음</a></li>";
	    }
	    $(".pagination-sm").html(str);
	}
// 목록페이지 번호 변수 선언, 1로 초기화(첫번째 페이지)
	var replyPageNum = 1;
// 목록페이지 번호 클릭 이벤트
	$(".pagination").on("click", "li a", function (event) {
		var nb_no = ${board.nb_no};
		console.log("클릭 댓글페이지_게시글번호 = "+ nb_no);
	    event.preventDefault();
	    replyPageNum = $(this).attr("href"); // 목록 페이지 번호 추출
	    getRepliesPaging(replyPageNum, nb_no); // 목록 페이지 호출
	});	

	});
</script>
</html>