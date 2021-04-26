<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품추가</title>
<style>
  .uploadPreview {width: 100%; background-color: gray;}
  .uploadPreview ul {displayImg: flex; flex-flow: row; justify-content: center; align-items: center;}
  .uploadPreview ul li {list-style: none; padding: 10px; }
  .uploadPreview ul li img {width: 20px;}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {
	    var form = $('form');
	    $('button[type="submit"]').on('click', function(e) {
	        e.preventDefault();
	        var str = '';
	        $('.uploadResult ul li').each(function(i, obj) {
	            var obj = $(obj);
	            str += "<input type='hidden' name='attachList[" + i + "].filename' value='" + obj.data("filename") + "'>";
	            str += "<input type='hidden' name='attachList[" + i + "].img_name' value='" + obj.data("img_name") + "'>";
	            str += "<input type='hidden' name='attachList[" + i + "].uploadpath' value='" + obj.data("path") + "'>";
	            str += "<input type='hidden' name='attachList[" + i + "].filetype' value='" + obj.data("type") + "'>";
	        })
	        form.append(str).submit();
	    });
	    
	    // 첨부파일 목록 표시
	    (function() {
	      var goods_idx = '<c:out value="${goodsVo.goods_idx}"/>';
	      $.getJSON('/getImageList', {goods_idx : goods_idx}, function(arr) {
	        var str = '';
	        $(arr).each(function(i, attach) {
	          if (attach.filetype) {
	            var fileSavePath = encodeURIComponent(attach.uploadpath + '/s_' + attach.img_name + '_' + attach.filename);
	            console.log(fileSavePath);
	            str += '<li data-path="' + attach.uploadpath + '" data-img_name=' + attach.img_name + ' data-filename="' + attach.filename + '" data-type="' + attach.filetype + '" >';
	            str += '<div>';
	            str += '<span>' + attach.filename + '</span>';
	            str += '<button type="button" data-file="' + fileSavePath + '" data-type="image" class="btn"><i class="bi bi-trash"></i></button><br>';
	            str += '<img src="/displayImg?filename=' + fileSavePath + '">';
	            str += '</div>';
	            str += '</li>';
	          }
	          else {
	            str += '<li data-path="' + attach.uploadpath + '" data-img_name="' + attach.img_name + '" data-filename="' + attach.filename + '" data-type="' + attach.filetype + '" >';
	            str += '<div>';
	            str += '<span>' + attach.filename + '</span><br>';
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
	    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	    var uploadMaxSize = 10485760; // 10MB
	    function checkFileExtension(fileName, fileSize) {
	      if (fileSize >= uploadMaxSize) {
	        alert('파일 업로드 시 크기는 10MB까지만 가능합니다.');
	        return false;
	      }
	      if (regex.test(fileName)) {
	        alert('파일 업로드 시 exe, sh, zip, alz 확장자는 불가능합니다.');
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
	        url : '/uploadAjaxActionImg'
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
	        if (obj.filetype) {
	          var fileSavePath = encodeURIComponent(obj.uploadpath + '/s_' + obj.img_name + '_' + obj.filename);
	          str += '<li data-path="' + obj.uploadpath + '" data-img_name="' + obj.img_name + '" data-filename="' + obj.filename + '" data-type="' + obj.filetype + '">';
	          str += '<div>';
	          str += '<span>' + obj.filename + '</span>';
	          str += '<button type="button" data-file="' + fileSavePath + '" data-type="image" class="btn"><i class="bi bi-trash"></i></button><br>';
	          str += '<img src="/displayImg?filename=' + fileSavePath + '">';
	          str += '</div>';
	          str += '</li>';
	        }
	        else {
	          var fileSavePath = encodeURIComponent(obj.uploadpath + '/' + obj.img_name + '_' + obj.filename);
	          str += '<li data-path="' + obj.uploadpath + '" data-img_name="' + obj.img_name + '" data-filename="' + obj.filename + '" data-type="' + obj.filetype + '">';
	          str += '<span>' + obj.a_filename + '</span>';
	          str += '<button type="button" data-file="' + fileSavePath + '" data-type="file" class="btn"><i class="bi bi-trash"></i></button><br>';
	          str += '<img src="/img/attach.png">';
	          str += '</div>';
	          str += '</li>';
	        }
	        uploadUlTag.append(str);
	      });
	    }
	    
	    $('#cancel').on('click', function(e) {
	        self.location = '/admin';
	      });
	    
	  });
</script>
</head>
<body>
   <!-- Header -->
   <%@ include file="/WEB-INF/views/includes/header.jsp" %>
   
  <form action="/updateGoods" method="post" >
  <input type="hidden" name="goods_idx" value="${goodsInfo.goods_idx }"/>
	<h1>상품수정</h1>
    <div class="tab_container">
      <!-- 내용 들어 가는 곳 -->
      <div class="tab_container" id="container">
        <div class="tab_container">
          <div class="tab_content" id="tab1">
            <table>
              <tr>
                <td>제품이름</td>
                <td><input name="goods_name" type="text" size="40" value="${goodsInfo.goods_name }"/></td>
              </tr>
              <tr>
                <td>제품가격</td>
                <td><input name="goods_price" type="text" size="40" value="${goodsInfo.goods_price }"/></td>
              </tr>
              <tr>
                <td>제품 구매 포인트</td>
                <td><input name="goods_point" type="text" size="40" value="${goodsInfo.goods_point }"/></td>
              </tr>
              <tr>
                <td>제품등록일</td>
                <td>
                  <input name="goods_regdate" type="text" size="40" value="${goodsInfo.goods_regdate }"/>
                </td>
              </tr>
              <tr>
                <td>제품 배송비</td>
                <td>
                  <input name="delivery_price" type="text" size="40" value="${goodsInfo.delivery_price }"/>
                </td>
              </tr>
              <tr>
                <td>제품 도착 예정일</td>
                <td>
                  <input name="delivery_date" type="text" size="40" value="${goodsInfo.delivery_date }"/>
                </td>
              </tr>
              <tr>
                <td><br /></td>
              </tr>
            </table>
          </div>
          
          <div class="tab_content" id="tab1">
            <H4>상품소개</H4>
            <table>
              <tr>
                <td>상품소개</td>
                <td>
                  <textarea rows="30" cols="80" name="goods_info" >${goodsInfo.goods_info }</textarea>
                </td>
              </tr>
            </table>
            </div>
          
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
          
          
        </div>
      </div>
      
        <div style="text-align: center;">
    		<button type="submit">상품 수정</button>&nbsp;
   	 		<button type="button" id="cancel">취소</button>
  		</div>
    </div>
  
  </form>
</body>
</html>