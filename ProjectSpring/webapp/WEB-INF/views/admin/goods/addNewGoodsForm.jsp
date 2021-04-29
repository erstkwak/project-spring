<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품추가</title>
<style>
  .uploadPreview {width: 100%; background-color: #A2A2A2;}
  .uploadPreview ul {display: flex; flex-flow: row; justify-content: center; align-items: center;}
  .uploadPreview ul li {list-style: none; padding: 10px; align-content: center; text-align: center;}
  .uploadPreview ul li img {width: 100px;}
  .uploadPreview ul li span {color: white;}
  
  	#myPage-body {margin-bottom: 0px; padding-bottom: 50px; font-size: 16px; background-color: #e9e9e9; }
	.table {background-color: white;}
	#wrapper {width: 1000px;}
	.table>tbody>tr>td {padding: 30px;}
	.table>tbody>tr>td:nth-of-type(1) {text-align: center;}
	#main {padding-top: 50px;}
	
</style>
<script>
$(document).ready(function(e) {

    // 폼 전송 시 첨부 파일 정보 같이 전송
    var form = $('form');
    $('button[type="submit"]').on('click', function(e) {
        e.preventDefault();
        var str = '';
        $('.uploadPreview ul li').each(function(i, obj) {
            var obj = $(obj);
            str += "<input type='hidden' name='attachList[" + i + "].filename' value='" + obj.data("filename") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].img_name' value='" + obj.data("img_name") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].uploadpath' value='" + obj.data("path") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].filetype' value='" + obj.data("type") + "'>";
        })
        form.append(str).submit();
    });

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

      // 파일 미리보기
      $.ajax({
        url : '/uploadAjaxActionImg'
        , processData : false
        , contentType : false
        , data : formData
        , type : 'post'
        , dataType : 'json'
        , success : function(result) {
            showUploadPreview(result);
          }
      }); //$.ajax
    });

    // 첨부파일 삭제 버튼
    $('.uploadPreview').on('click', 'button', function(e) {
      var targetFile = $(this).data('file');
      var targetLi = $(this).closest('li');
      var type = $(this).data('type');
      if (confirm('첨부파일을 삭제하시겠습니까?')) {
        $.ajax({
          url : '/deleteImgFile'
          , data : {fileName : targetFile, type : type}
          , dataType : 'text'
          , type : 'post'
          , success : function(result) {
              targetLi.remove();
            }
        });
      }
    });

    // 파일 유효성 검사
    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
    var maxSize = 10485760; // 10MB
    function checkFileExtension(fileName, fileSize) {
      if (fileSize > maxSize) {
        alert('10MB보다 작은 크기의 파일만 업로드 가능합니다.');
        return false;
      }
      if (regex.test(fileName)) {
        alert('exe, sh, zip, alz 확장자를 가진 파일은 업로드할 수 없습니다.');
        return false;
      }
      return true;
    }

    // 미리보기
    function showUploadPreview(uploadPreviewArr) {
      if (!uploadPreviewArr || uploadPreviewArr.length == 0) {
        return;
      }
      var uploadPreviewUl= $('.uploadPreview ul');
      var str = '';
      $(uploadPreviewArr).each(function(i, obj) {
        if (obj.filetype) {
          var fileSavePath = encodeURIComponent(obj.uploadpath + "/s_" + obj.img_name + "_" + obj.filename);
          str += "<li data-path='" + obj.uploadpath + "' data-img_name='" + obj.img_name + "' data-filename='" + obj.filename + "' data-type='" + obj.filetype + "'";
          str += "  ><div>";
          str += "    <span>" + obj.filename + "</span>";
          str += "    <button type='button' data-file=\'" + fileSavePath + "\' data-type='image' class='btn'><i class='bi bi-trash'></i></button><br>";
          str += "    <img src='/displayImg?filename=" + fileSavePath + "'>";
          str += "  </div>";
          str += "</li>";
        }
        else {
          var fileSavePath = encodeURIComponent(obj.uploadpath + "/" + obj.img_name + "_" + obj.filename);
          var fileSlashChange = fileSavePath.replace(new RegExp(/\\/g), "/");
          str += "<li data-path='" + obj.uploadpath + "' data-img_name='" + obj.img_name + "' data-filename='" + obj.filename + "' data-type='" + obj.filetype + "' ";
          str += "  ><div>"
          str += "    <span>" + obj.filename + "</span>";
          str += "    <button type='button' data-file=\'" + fileSavePath + "\' data-type='file' class='btn'><i class='bi bi-trash'></i></button><br>";
          str += "    <img src='/img/attach.png'>";
          str += "  </div>";
          str += "</li>";
        }
      });
      uploadPreviewUl.append(str);
    }
    
    $('#cancel').on('click', function(e) {
      self.location = '/admin';
    });

  });
</script>
</head>
<body>
<form action="/addNewGoods" method="post" >
<div id="myPage-body">
<section class="blog" id="main">
  <div class="container">
	<div class="row">
	  <div class="col-md-12 col-sm-12 col-xs-12">
		<div id="wrapper" style="margin: 0 auto;">
		  <table class="table">
			<caption>
			  <h2 style="text-align: center;">새상품 등록</h2>
			</caption>
			
              <tr>
                <td>제품이름</td>
                <td colspan="2"><input name="goods_name" type="text" /></td>
              </tr>
              <tr>
                <td>제품가격</td>
                <td colspan="2"><input name="goods_price" type="text" />원</td>
              </tr>
              <tr>
                <td>제품 구매 포인트</td>
                <td colspan="2"><input name="goods_point" type="text" /></td>
              </tr>
              <tr>
                <td>제품등록일</td>
                <td colspan="2"><input name="goods_regdate" type="date" /></td>
              </tr>
              <tr>
                <td>제품 배송비</td>
                <td colspan="2"><input name="delivery_price" type="text" /> 원</td>
              </tr>
              <tr>
                <td>제품 도착 예정일</td>
                <td colspan="2"><input name="delivery_date" type="date" /></td>
              </tr>
              <tr>
                <td>상품소개</td>
                <td colspan="2">
                  <textarea rows="10" cols="50" name="goods_info" ></textarea>
                </td>
              </tr>
              <tr>
                <td>상품이미지</td>
                <td colspan="2">
                  <label for="uploadFile">이미지파일 첨부</label>
           		  <input type="file" class="form-control-file" name="uploadFile" id="uploadFile" multiple>
           		  <div class="uploadPreview">
 		            <ul></ul>
                  </div>
                </td>
              </tr>
            </table>
        </div>
      </div>
      </div>
      </div>
      </section>
        <div style="text-align: center;">
    		<button type="submit" class="btn btn-success">상품 등록하기</button>&nbsp;
   	 		<button type="button" id="cancel" class="cancle btn btn-danger">취소</button>
  		</div>
      </div>
  
  </form>
</body>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>