<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">

<style>
	#register-body {font-size: 16px; padding-bottom: 50px;}
	#wrap {display: flex; justify-content: center; align-items: center;}
	#article-body {width: 1000px;}
	.form-control {font-size: 16px;}
  .uploadPreview {width: 100%; background-color: #A2A2A2;}
  .uploadPreview ul {display: flex; flex-flow: row; justify-content: center; align-items: center;}
  .uploadPreview ul li {list-style: none; padding: 10px; align-content: center; text-align: center;}
  .uploadPreview ul li img {width: 100px;}
  .uploadPreview ul li span {color: white;}
</style>
<section class="image-head-wrapper"
	style="background-image: url('/images/qnabanner.jpg'); background-repeat: space; width:100%; height: 500px;"
	>
	<div class="inner-wrapper">
		<h1 style="font-size: 35px;">문의 게시판</h1>
	</div>
</section>
<div class="clearfix"></div>

<div id="register-body">
	<div id="wrap">
		<div id="article-body">
			<section class="blog" id="main">
				<div class="container">
					<div class="row">
						<div class="col-md-10 col-sm-10 col-xs-12">
							<form action="/qna/registerProc" method="post">
								<div class="form-group">
									<label for="p_title">제목</label>
									<input class="form-control" name='p_title' id="p_title" placeholder="제목을 입력하세요.">
								</div>
								<div class="form-group">
									<label for="p_content">내용</label>
									<textarea class="form-control" rows="10" name='p_content' id="p_content"
										placeholder="내용을 입력하세요."></textarea>
								</div>
								<div class="form-group">
									<label for="mem_id">작성자</label>
									<input class="form-control" name='mem_id' id="mem_id" value="${login.mem_id}" readonly>
								</div>
								<div class="form-group">
									<label for="uploadFile">파일 첨부</label>
									<input type="file" class="form-control-file" name="uploadFile" id="uploadFile" multiple>
								</div>
								<div class="uploadPreview">
									<ul></ul>
								</div>
								<div style="text-align: center;">
									<button class="btn btn-default" type="submit">글쓰기</button>&nbsp;
									<button class="btn btn-default" type="button" id="golist">목록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script>
  $(document).ready(function(e) {

    // [이벤트] 폼 전송 시 첨부 파일 정보 같이 전송
    var form = $('form');
    $('button[type="submit"]').on('click', function(e) {
        e.preventDefault();
        var str = '';
        $('.uploadPreview ul li').each(function(i, obj) {
            var obj = $(obj);
            str += "<input type='hidden' name='attachList[" + i + "].a_filename' value='" + obj.data("filename") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].a_uuid' value='" + obj.data("uuid") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].a_savepath' value='" + obj.data("path") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].a_isimage' value='" + obj.data("type") + "'>";
        })
        form.append(str).submit();
    });

    // [이벤트] 폼 태그에 첨부 파일 유효성 검사 후 목록에 추가
    $('input[type="file"]').change(function(e) {
      var formData = new FormData();
      var inputFileList = $('input[name="uploadFile"]');
      var files = inputFileList[0].files;
      for (var i = 0; i < files.length; i++) {
        if (!checkFileExtension(files[i].name, files[i].size)) {
          return false;
        }
        formData.append('uploadFile', files[i]);
      }

      // [Ajax] 파일 업로드 후 미리보기에 표시
      $.ajax({
        url : '/uploadAjaxAction'
        , processData : false
        , contentType : false
        , data : formData
        , type : 'post'
        , dataType : 'json'
        , success : function(result) {
            showUploadPreview(result);
          }
      });
    });

    // [이벤트] 삭제 버튼 클릭
    $('.uploadPreview').on('click', 'button', function(e) {
      var targetFile = $(this).data('file');
      var targetLi = $(this).closest('li');
      var type = $(this).data('type');
      if (confirm('첨부파일을 삭제하시겠습니까?')) {
        $.ajax({
          url : '/deleteFile'
          , data : {fileName : targetFile, type : type}
          , dataType : 'text'
          , type : 'post'
          , success : function(result) {
              targetLi.remove();
            }
        });
      }
    });

    // [함수] 파일 첨부 시 유효성 검사
    var regex = new RegExp("(.*?)\.(exe|zip|alz)$");
    var uploadMaxSize = 10485760; // 10MB
    function checkFileExtension(fileName, fileSize) {
      if (fileSize > uploadMaxSize) {
        alert('10MB보다 작은 크기의 파일만 업로드 가능합니다.');
        return false;
      }
      if (regex.test(fileName)) {
        alert('exe, zip, alz 확장자를 가진 파일은 업로드할 수 없습니다.');
        return false;
      }
      return true;
    }

    // [함수] 미리보기에 표시
    function showUploadPreview(uploadPreviewArr) {
      if (!uploadPreviewArr || uploadPreviewArr.length == 0) {
        return;
      }
      var uploadPreviewUl= $('.uploadPreview ul');
      var str = '';
      $(uploadPreviewArr).each(function(i, obj) {
        if (obj.a_isimage) {
          var fileSavePath = encodeURIComponent(obj.a_savepath + "/s_" + obj.a_uuid + "_" + obj.a_filename);
          str += "<li data-path='" + obj.a_savepath + "' data-uuid='" + obj.a_uuid + "' data-filename='" + obj.a_filename + "' data-type='" + obj.a_isimage + "'>";
          str += "  <div>";
          str += "    <span>" + obj.a_filename + "</span>";
          str += "    <button type='button' data-file=\'" + fileSavePath + "\' data-type='image' class='btn'><i class='bi bi-trash'></i></button><br>";
          str += "    <img src='/display?a_filename=" + fileSavePath + "'>";
          str += "  </div>";
          str += "</li>";
        }
        else {
          var fileSavePath = encodeURIComponent(obj.a_savepath + "/" + obj.a_uuid + "_" + obj.a_filename);
          var fileSlashChange = fileSavePath.replace(new RegExp(/\\/g), "/");
          str += "<li data-path='" + obj.a_savepath + "' data-uuid='" + obj.a_uuid + "' data-filename='" + obj.a_filename + "' data-type='" + obj.a_isimage + "' >";
          str += "  <div>"
          str += "    <span>" + obj.a_filename + "</span>";
          str += "    <button type='button' data-file=\'" + fileSavePath + "\' data-type='file' class='btn'><i class='bi bi-trash'></i></button><br>";
          str += "    <img src='/images/attach.png'>";
          str += "  </div>";
          str += "</li>";
        }
      });
      uploadPreviewUl.append(str);
    }
    
    $('#golist').on('click', function(e) {
      self.location = '/qna/list';
    });

  });
</script>