<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
	<style>
    .uploadResult {width: 100%; background-color: gray;}
    .uploadResult ul {display: flex; flex-flow: row; justify-content: center; align-items: center;}
    .uploadResult ul li {list-style: none; padding: 10px; align-content: center; text-align: center;}
    .uploadResult ul li img {width: 100px;}
    .uploadResult ul li span {color: white;}
    .picturePreviewWrapper {position: absolute; display: none; justify-content: center; align-items: center; top: 0%; width: 100%; height: 100%; background-color: gray; z-index: 100; background: rgba(255, 255, 255, 0.5);}
    .picturePreview {position: relative; display: flex; justify-content: center; align-items: center;}
    .picturePreview img {width: 600px;}
	</style>
  <title>modify.jsp</title>
</head>
<body>
  <form role="form" action="/qna/modifyProc" method="post">
    <div class="form-group">
      <label for="no">번호</label>
      <input class="form-control" id="no" name='p_no' value='<c:out value="${postVO.p_no}"/>' readonly>
    </div>
    <div class="form-group">
      <label for="title">제목</label>
      <input class="form-control" id="title" name="p_title" value='<c:out value="${postVO.p_title}"/>'>
    </div>
    <div class="form-group">
      <label for="content">내용</label>
      <textarea class="form-control" rows="3" id="content" name="p_content"><c:out value="${postVO.p_content}"/></textarea>
    </div>
    <div class="form-group">
      <label for="writer">작성자</label>
      <input class="form-control" id="writer" name="mem_id" value='<c:out value="${postVO.mem_id}"/>' readonly>
    </div>
    <div class="form-group">
      <label for="writedate">작성일</label>
      <input class="form-control" id="writedate" name="p_writedate" value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${postVO.p_writedate}" />' readonly>
    </div>
    <div class="form-group">
      <label for="updatedate">수정일</label>
      <input class="form-control" id="updatedate" name="p_updatedate" value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${postVO.p_updatedate}" />' readonly>
    </div>
    <input type='hidden' name='pageNum' value='<c:out value="${utilVO.pageNum }"/>'>
    <input type='hidden' name='amount' value='<c:out value="${utilVO.amount }"/>'>
    <input type='hidden' name='type' value='<c:out value="${utilVO.type }"/>'>
    <input type='hidden' name='keyword' value='<c:out value="${utilVO.keyword }"/>'>
	  <div>첨부파일</div>
	  <div class="form-group uploadDiv">
	    <input type="file" name="uploadFile" multiple>
	  </div>
    <div class="uploadResult">
      <ul></ul>
    </div>
    <div class='picturePreviewWrapper'>
      <div class='picturePreview'></div>
    </div>
    <button type="submit" data-oper='modify' class="btn btn-dark">수정</button>
    <button type="submit" data-oper='remove' class="btn btn-dark">삭제</button>
    <button type="submit" data-oper='list' class="btn btn-dark">목록</button>
  </form><br>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  <script>
    $(document).ready(function() {

      // [이벤트] 버튼 클릭
      var form = $('form');
      $('button').on('click', function(e) {
        e.preventDefault();
        var option = $(this).data('oper');
        if (option == 'remove') {
          form.attr('action', '/qna/remove');
        }
        else if (option == 'list') {
          form.attr('action', '/qna/list').attr('method', 'get');
          var pageNumInput = $('input[name="pageNum"]').clone();
          var amountInput = $('input[name="amount"]').clone();
          var keywordInput = $('input[name="keyword"]').clone();
          var typeInput = $('input[name="type"]').clone();
          form.empty();
          form.append(pageNum);
          form.append(amount);
          form.append(keyword);
          form.append(typeTag);
        }
        else if (option == 'modify') {
          var str = '';
          $('.uploadResult ul li').each(function(i, obj) {
            var obj = $(obj);
            str += "<input type='hidden' name='attachList[" + i + "].a_filename' value='" + obj.data("filename") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].a_uuid' value='" + obj.data("uuid") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].a_savepath' value='" + obj.data("path") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].a_isimage' value='" + obj.data("type") + "'>";
          });
          form.append(str).submit();
        }
        form.submit();
      });

      // 첨부파일 목록 표시
      (function() {
        var p_no = '<c:out value="${postVO.p_no}"/>';
        $.getJSON('/qna/getAttachList', {p_no : p_no}, function(arr) {
          var str = '';
          $(arr).each(function(i, attach) {
            if (attach.a_isimage) {
              var fileSavePath = encodeURIComponent(attach.a_savepath + '/s_' + attach.a_uuid + '_' + attach.a_filename);
              console.log(fileSavePath);
              str += '<li data-path="' + attach.a_savepath + '" data-uuid=' + attach.a_uuid + '_' + ' data-filename="' + attach.a_filename + '" data-type="' + attach.a_isimage + '" >';
              str += '<div>';
              str += '<span>' + attach.a_filename + '</span>';
              str += '<button type="button" data-file="' + fileSavePath + '" data-type="image" class="btn"><i class="bi bi-trash"></i></button><br>';
              str += '<img src="/display?a_filename=' + fileSavePath + '">';
              str += '</div>';
              str += '</li>';
            }
            else {
              str += '<li data-path="' + attach.a_savepath + '" data-uuid="' + attach.a_uuid + '" data-filename="' + attach.a_filename + '" data-type="' + attach.isimage + '" >';
              str += '<div>';
              str += '<span>' + attach.a_filename + '</span><br>';
              str += '<button type="button" data-file="' + fileSavePath + '" data-type="file" class="btn"><i class="bi bi-trash"></i></button><br>';
              str += '<img src="/img/attach.png"></a>';
              str += '</div>';
              str += '</li>';
            }
          });
          $('.uploadResult ul').html(str);
        });
      })();

      // [이벤트] 첨부파일 목록에서 삭제 버튼 클릭
      $('.uploadResult').on('click', 'button', function(e) {
        if (confirm('첨부파일을 삭제하시겠습니까?')) {
          var targetLiTag = $(this).closest('li');
          targetLiTag.remove(); 
        }
      });

      // [함수] 첨부파일 유효성 검사
      var regex = new RegExp("(.*?)\.(exe|zip|alz)$");
      var uploadMaxSize = 10485760; // 10MB
      function checkFileExtension(fileName, fileSize) {
        if (fileSize >= uploadMaxSize) {
          alert('파일 업로드 시 크기는 10MB까지만 가능합니다.');
          return false;
        }
        if (regex.test(fileName)) {
          alert('파일 업로드 시 exe, zip, alz 확장자는 불가능합니다.');
          return false;
        }
        return true;
      }

      // 첨부파일 등록 시 Ajax로 업로드
      $('input[type="file"]').change(function(e) {
        var formData = new FormData();
        var uploadFiles = $('input[name="uploadFile"]');
        var files = uploadFiles[0].files;
        for (var i = 0; i < files.length; i++) {
          if (!checkFileExtension(files[i].name, files[i].size)) {
            return false;
          }
          formData.append('uploadFile', files[i]);
        }
        $.ajax({
          url : '/uploadAjaxAction'
          , processData : false
          , contentType : false
          , data : formData
          , type : 'post'
          , dataType : 'json'
          , success : function (result) {
              showUploadResult(result);
            }
        });
      });

      // 파일 업로드 후 목록에 표시
      function showUploadResult(uploadResultArr) {
        if (!uploadResultArr || uploadResultArr.length == 0) {
          return;
        }
        var uploadUlTag = $('.uploadResult ul');
        var str = '';
        $(uploadResultArr).each(function(i, obj) {
          if (obj.a_isimage) {
            var fileSavePath = encodeURIComponent(obj.a_savepath + '/s_' + obj.a_uuid + '_' + obj.a_filename);
            str += '<li data-path="' + obj.a_savepath + '" data-uuid="' + obj.a_uuid + '" data-filename="' + obj.a_filename + '" data-type="' + obj.a_isimage + '">';
            str += '<div>';
            str += '<span>' + obj.a_filename + '</span>';
            str += '<button type="button" data-file="' + fileSavePath + '" data-type="image" class="btn"><i class="bi bi-trash"></i></button><br>';
            str += '<img src="/display?a_filename=' + fileSavePath + '">';
            str += '</div>';
            str += '</li>';
          }
          else {
            var fileSavePath = encodeURIComponent(obj.a_savepath + '/' + obj.a_uuid + '_' + obj.a_filename);
            str += '<li data-path="' + obj.a_savepath + '" data-uuid="' + obj.a_uuid + '" data-filename="' + obj.a_filename + '" data-type="' + obj.a_isimage + '">';
            str += '<span>' + obj.a_filename + '</span>';
            str += '<button type="button" data-file="' + fileSavePath + '" data-type="file" class="btn"><i class="bi bi-trash"></i></button><br>';
            str += '<img src="/img/attach.png">';
            str += '</div>';
            str += '</li>';
          }
          uploadUlTag.append(str);
        });
      }
      
    });
  </script>
</body>
</html>