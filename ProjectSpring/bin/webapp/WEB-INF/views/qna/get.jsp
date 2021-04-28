<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style>
	#get-body {font-size: 16px; padding-bottom: 50px;}
	.form-control {font-size: 16px;}
	#article-body {width: 1000px;}
	#wrap {display: flex; justify-content: center; align-items: center;}
	.replyListUl li {list-style: none;}
	.uploadResult {width: 100%;	background-color: gray;}
	.uploadResult ul {display: flex; flex-flow: row; justify-content: center;	align-items: center;}
	.uploadResult ul li {list-style: none; padding: 10px;	align-content: center; text-align: center;}
	.uploadResult ul li img {width: 100px;}
	.uploadResult ul li span {color: white;}
	.picturePreviewWrapper {position: absolute;	display: none; justify-content: center;	align-items: center; top: 0%;	width: 100%; height: 100%; background-color: gray; z-index: 100; background: rgba(255, 255, 255, 0.5);}
	.picturePreview {position: relative; display: flex;	justify-content: center; align-items: center;}
	.picturePreview img {width: 600px;}
	.replyPagingDiv {display: flex; justify-content: center; align-items: center;}
	.replyPagingDiv ul li {list-style: none; display: inline-block;}
	.page-item.active .page-link {color: #fff; background: #343A40; border-color: #343A40;}
	.page-link:hover {color: black;}
	.page-link {color: black;}
	.pagination>li>a, .pagination>li>span {color: black;}
	.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {background-color: black; border-color: black; color: black;}
	.pagination>.active>a:hover {color: #ffffff;}
</style>

<section class="image-head-wrapper"
	style="background-image: url('/images/qnabanner.jpg'); background-repeat:space; ; width:100%; height: 500px;"
	>
	<div class="inner-wrapper">
		<h1 style="font-size: 35px;">문의 게시판</h1>
	</div>
</section>
<div class="clearfix"></div>

<div id="get-body">
<div id="wrap">
	<div id="article-body">
		<section class="blog" id="main">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-sm-10 col-xs-12">
						<div class="form-group">
							<label class="" for="no">번호</label>
							<input class="form-control" id="no" name='p_no' value='<c:out value="${postVO.p_no }"/>'
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="title">제목</label>
							<input class="form-control" id="title" name='p_title' value='<c:out value="${postVO.p_title }"/>'
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="content">내용</label>
							<textarea class="form-control" rows="3" id="content" name='content'
								readonly="readonly"><c:out value="${postVO.p_content}" /></textarea>
						</div>
						<div class="form-group">
							<label for="writer">작성자</label>
							<input class="form-control" id="writer" name='mem_id' value='<c:out value="${postVO.mem_id }"/>'
								readonly="readonly">
						</div>
						<div style="text-align: center;">
							<button data-oper='modify' class="btn btn-default">수정</button>
							<button data-oper='remove' class="btn btn-default">삭제</button>
							<button data-oper='list' class="btn btn-default">목록</button>
						</div>
						<form id='operForm' action="/qna/modify" method="get">
							<input type='hidden' id='p_no' name='p_no' value='<c:out value="${postVO.p_no}"/>'>
							<input type='hidden' name='pageNum' value='<c:out value="${utilVO.pageNum}"/>'>
							<input type='hidden' name='amount' value='<c:out value="${utilVO.amount}"/>'>
							<input type='hidden' name='keyword' value='<c:out value="${utilVO.keyword}"/>'>
							<input type='hidden' name='type' value='<c:out value="${utilVO.type}"/>'>
						</form>
						<div class="picturePreviewWrapper">
							<div class="picturePreview">
							</div>
						</div><br>
						<div class="form-group">
							<label for="attachFiles">첨부파일</label>
							<div class="uploadResult" id="attachFiles">
								<ul></ul>
							</div>
						</div>
						<div>
							댓글&nbsp;
							<button id="addReplyBtn" class="btn btn-default">댓글쓰기</button><br><br>
						</div>
						<div>
							<ul class="replyListUl list-group"></ul><br>
						</div>
						<div class="replyPagingDiv">
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>

<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">댓글</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="rcont">내용</label>
					<input type="text" class="form-control" id="rcont" name='r_reply' value='댓글 내용'>
				</div>
				<div class="form-group">
					<label for="rwriter">작성자</label>
					<input type="text" class="form-control" id="rwriter" name='mem_id' value='test'>
				</div>
				<div class="form-group">
					<label for="rdate">작성일</label>
					<input type="text" class="form-control" id="rdate" name='r_writedate' value='2018-01-01 13:13'>
				</div>
			</div>
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-default">수정</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-default">삭제</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-default">쓰기</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
			</div>
		</div>
	</div>	
</div>
</div>
</div>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script src="/js/reply.js"></script>
<script>
	$(document).ready(function() {

		var p_noValue = '<c:out value="${postVO.p_no}"/>';
		var replyListUl = $(".replyListUl");
		var pageNum = 1;
		var replyPage = $(".replyPagingDiv");
		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='r_reply']");
		var modalInputReplyer = modal.find("input[name='mem_id']");
		var modalInputReplyDate = modal.find("input[name='r_writedate']");
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");

		showList(1);

		// 글 조회 시 첨부 파일 목록 불러와 출력
		(function() {
			var p_no = '<c:out value="${postVO.p_no}"/>';
			$.getJSON('/qna/getAttachList', {p_no: p_no}, function(arr) {
				var str = '';
				$(arr).each(function(i, attach) {
					if (attach.a_isimage) {
						var fileSavePath = encodeURIComponent(attach.a_savepath + '/s_' + attach.a_uuid + '_' + attach.a_filename);
						str += "<li data-path='" + attach.a_savepath + "' data-uuid='" + attach.a_uuid + "' data-filename='" + attach.a_filename + "' data-type='" + attach.a_isimage + "'>";
						str += "<div><img src='/display?a_filename=" + fileSavePath + "'></div>";
						str += "</li>";
					}
					else {
						str += "<li data-path='" + attach.a_savepath + "' data-uuid='" + attach.a_uuid + "' data-filename='" + attach.a_filename + "' data-type='" + attach.a_isimage + "' >";
						str += "<span> " + attach.a_filename + "</span><br />";
						str += "<div><img src='/images/attach.png'></div>";
						str += "</li>";
					}
				})
				$('.uploadResult ul').html(str);
			});
		})();

		// [이벤트] 글 조회 화면에서 버튼 선택에 따른 히든 값 전달
		var operForm = $('#operForm');
		$('button[data-oper="modify"]').on('click', function(e) {
			operForm.attr('action', '/qna/modify').submit();
		});
		$('button[data-oper="remove"]').on('click', function(e) {
			operForm.attr('action', '/qna/remove').submit();
		});
		$('button[data-oper="list"]').on('click', function(e) {
			operForm.find('#p_no').remove();
			operForm.attr('action', '/qna/list');
			operForm.submit();
		});

		// [이벤트] 첨부파일 클릭 시 확대 보기 or 다운로드
		$('.uploadResult').on('click', 'li', function(e) {
			var liObj = $(this);
			var path = encodeURIComponent(liObj.data('path') + '/' + liObj.data('uuid') + '_' + liObj.data('filename'));
			if (liObj.data('type')) {
				showImage(path.replace(new RegExp(/\\/g), '/'));
			}
			else {
				self.location = '/download?fileName=' + path;
			}
		});

		// [함수] 섬네일 이미지 클릭 시 크게 보기
		function showImage(fileSavePath) {
			$('.picturePreviewWrapper').css('display', 'flex').show();
			$('.picturePreview').html('<img src="/display?a_filename=' + fileSavePath + '">').animate({width: '100%', height: '100%'}, 500);
		}

		// [이벤트] 크게 본 이미지 닫기
		$('.picturePreviewWrapper').on('click', function(e) {
			$('.picturePreview').animate({width: '0%', height: '0%'}, 500);
			setTimeout(function() {
				$('.picturePreviewWrapper').hide();
			}, 500);
		});

		// [이벤트] 댓글 클릭 시 모달 표시
		$('.replyListUl').on('click', 'li', function(e) {
			var r_no = $(this).data('r_no');
			replyService.get(r_no, function(reply) {
				modalInputReply.val(reply.r_reply);
				modalInputReplyer.val(reply.mem_id);
				modalInputReplyDate.val(replyService.displayTime(reply.r_writedate)).attr('readonly', 'readonly');
				modal.data('r_no', reply.r_no);
				modal.find('button[id != "modalCloseBtn"]').hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				$('.modal').modal('show');
			});

			// [이벤트] 모달에서 수정 버튼 클릭
			modalModBtn.on('click', function(e) {
				var reply = {
					r_no : modal.data('r_no')
					, r_reply : modalInputReply.val()
				};
				replyService.update(reply, function(result) {
					modal.modal('hide');
					showList(pageNum);
				});
			});

			// [이벤트] 모달에서 삭제 버튼 클릭
			modalRemoveBtn.on('click', function(e) {
				var r_no = modal.data('r_no');
				replyService.remove(r_no, function(result) {
					modal.modal('hide');
					showList(pageNum);
				});
			});
		});

		// [함수] 댓글 리스트 조회
		function showList(page) {
			replyService.getList(
				{p_no : p_noValue, page : page || 1}
				, function(replyCount, list) {

						console.log("replyCount: " + replyCount);
						console.log("list: " + list);
						console.log(list);

						if (page == -1) {
							pageNum = Math.ceil(replyCount / 10.0);
							showList(pageNum);
							return;
						}
						var str = '';
						if (list == null || list.length == 0) {
							return;
						}
						for (var i = 0, len = list.length || 0; i < len; i++) {
							str += '<li class="list-group-item list-group-item-action list-group-item-secondary" data-r_no="' + list[i].r_no + '">';
							str += '<div>[' + list[i].r_no + '] ' + '<b>' + list[i].mem_id + '</b> ' + replyService.displayTime(list[i].r_writedate) + '</div><br>';
							str += '<p>' + list[i].r_reply + '</p></div>';
							str += '</li>'
						}
						replyListUl.html(str);
						showReplyPage(replyCount);
					}
			)
		}

		// [함수] 댓글 리스트 페이징
		function showReplyPage(replyCount) {
			var end = Math.ceil(pageNum / 10.0) * 10;
			var start = end - 9;
			var prev = start != 1;
			var next = false;
			if (end * 10 >= replyCount) {
				end = Math.ceil(replyCount / 10.0);
			}
			if (end * 10 < replyCount) {
				next = true;
			}
			var str = '<ul class="pagination pull-right">';
			if (prev) {
				str += '<li class="page-item"><a class="page-link shadow-none" href="' + (start - 1) + '">이전</a></li>';
			}
			for (var i = start; i <= end; i++) {
				var active = pageNum == i ? "active" : "";
				str += '<li class="page-item ' + active + '"><a class="page-link shadow-none" href="' + i + '">' + i + '</a></li>';
			}
			if (next) {
				str += '<li class="page-item"><a class="page-link shadow-none" href="' + (end + 1) + '">다음</a></li>';
			}
			str += '</ul>';
			replyPage.html(str);
		}

		// [이벤트] 댓글 쓰기 버튼 클릭
		$('#addReplyBtn').on('click', function(e) {
			modal.find('input').val('');
			modalInputReplyDate.closest('div').hide();
			modal.find('button[id != "modalCloseBtn"]').hide();
			modalRegisterBtn.show();
			$('.modal').modal('show');
		});

		// [이벤트] 모달에서 댓글 쓰기 버튼 클릭
		modalRegisterBtn.on('click', function(e) {
			var reply = {
				r_reply : modalInputReply.val()
				, mem_id : modalInputReplyer.val()
				, p_no : p_noValue
			};
			replyService.add(reply, function(result) {
				modal.find('input').val('');
				modal.modal('hide');
				showList(1); // -1 ?
			});
		});

		// [이벤트] 모달에서 닫기 버튼 클릭
		$('#modalCloseBtn').on('click', function(e) {
			modal.modal('hide');
		});

		// [이벤트] 페이징 버튼들 클릭 시
		replyPage.on('click', 'li a', function(e) {
			e.preventDefault();
			var targetPageNum = $(this).attr('href');
			pageNum = targetPageNum;
			showList(pageNum);
		});

	});
</script>