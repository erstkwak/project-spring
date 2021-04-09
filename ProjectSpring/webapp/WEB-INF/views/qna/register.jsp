<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@ include file="" %> --%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <title>register.jsp</title>
  <style>
    .uploadResult {width: 100%; background-color: gray;}
    .uploadResult ul {display: flex; flex-flow: row; justify-content: center; align-items: center;}
    .uploadResult ul li {list-style: none; padding: 10px; align-content: center; text-align: center;}
    .uploadResult ul li img {width: 100px;}
    .uploadResult ul li span {color: white;}
    .bigPictureWrapper {position: absolute; display: none; justify-content: center; align-items: center; top:0%; width:100%; height:100%; background-color: gray; z-index: 100; background: rgba(255, 255, 255, 0.5);}
    .bigPicture {position: relative; display:flex; justify-content: center; align-items: center;}
    .bigPicture img {width: 600px;}
  </style>
</head>
<body>
  <form role="form" action="/qna/register" method="post">
    <div class="form-group">
      <label>제목</label><input class="form-control" name='p_title'>
    </div>
    <div class="form-group">
      <label>내용</label>
      <textarea class="form-control" rows="3" name='p_content'></textarea>
    </div>
    <div class="form-group">
      <label>글쓴이</label><input class="form-control" name='mem_id' value="test">
    </div>
    <button type="submit">글쓰기</button>
    <button type="reset">다시쓰기</button>
  </form>

  <div class="form-group uploadDiv">
    <input type="file" name="uploadFile" multiple>
  </div>
  <div class="uploadResult">
    <ul></ul>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
  <script>
    $(document).ready(function(e) {

      var formObj = $("form[role='form']");
      $("button[type='submit']").on("click", function (e) {
        e.preventDefault();
        var str = "";

        $(".uploadResult ul li").each(function (i, obj) {
          var jobj = $(obj);

          str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
          str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
          str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
          str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";
        });

        formObj.append(str).submit();
      });

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 5242880; //5MB

      function checkExtension(fileName, fileSize) {
        if (fileSize >= maxSize) {
          alert("파일 사이즈 초과");
          return false;
        }
        if (regex.test(fileName)) {
          alert("해당 종류의 파일은 업로드할 수 없습니다.");
          return false;
        }
        return true;
      }

      $("input[type='file']").change(function(e) {
        var formData = new FormData();
        var inputFile = $("input[name='uploadFile']");
        var files = inputFile[0].files;

        for (var i = 0; i < files.length; i++) {
          if (!checkExtension(files[i].name, files[i].size)) {
            return false;
          }
          formData.append("uploadFile", files[i]);
        }

        $.ajax({
          url: '/uploadAjaxAction',
          processData: false,
          contentType: false, data:
            formData, type: 'POST',
          dataType: 'json',
          success: function (result) {
            console.log(result);
            showUploadResult(result); //업로드 결과 처리 함수 
          }
        });

      });

      function showUploadResult(uploadResultArr) {
        if (!uploadResultArr || uploadResultArr.length == 0) { return; }
        var uploadUL = $(".uploadResult ul");
        var str = "";

        $(uploadResultArr).each(function (i, obj) {
          if (obj.image) {
            var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
            str += "<li data-path='" + obj.uploadPath + "'";
            str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'"
            str + " ><div>";
            str += "<span> " + obj.fileName + "</span>";
            str += "<button type='button' data-file=\'" + fileCallPath + "\' "
            str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            str += "<img src='/display?fileName=" + fileCallPath + "'>";
            str += "</div>";
            str + "</li>";
          } else {
            var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
            var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");

            str += "<li "
            str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "' ><div>";
            str += "<span> " + obj.fileName + "</span>";
            str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file' "
            str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            str += "<img src='/resources/img/attach.png'></a>";
            str += "</div>";
            str + "</li>";
          }
        });

        uploadUL.append(str);
      }

      $(".uploadResult").on("click", "button", function (e) {
        var targetFile = $(this).data("file");
        var type = $(this).data("type");
        var targetLi = $(this).closest("li");

        $.ajax({
          url: '/deleteFile',
          data: { fileName: targetFile, type: type },
          dataType: 'text',
          type: 'POST',
          success: function (result) {
            alert(result);

            targetLi.remove();
          }
        });
      });

    });
  </script>
</body>
</html>

<%-- <%@ include file="" %> --%>