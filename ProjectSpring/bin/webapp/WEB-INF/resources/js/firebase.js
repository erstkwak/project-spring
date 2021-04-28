	
var firebaseConfig = {
    apiKey: "AIzaSyAGAZH8s_1kg35aqyNCw-vqaAATXLE8vUE",
    authDomain: "shw-project-8f311.firebaseapp.com",
    projectId: "shw-project-8f311",
    storageBucket: "shw-project-8f311.appspot.com",
    messagingSenderId: "614469678072",
    appId: "1:614469678072:web:95909f7ba14e7768549c0d",
    measurementId: "G-01LLXSKYZW"
  };

$(document).ready(function(){
	
	var globalVar = {
			url:''
	}
	
    firebase.initializeApp(firebaseConfig);
    var storage = firebase.storage();
    $('input.file').on('change',function(){
    	
    	$('body').append(
    			'<div  class="loading-div" style="display:flex;align-items:center;justify-content:center;width:100%;height:100%;background:rgba(0,0,0,0.4);position:fixed;top:0;left:0;">'+
    		   	'<div class="sk-chase">'+
    			 '<div class="sk-chase-dot"></div>'+
    			  '<div class="sk-chase-dot"></div>'+
    			  '<div class="sk-chase-dot"></div>'+
    			  '<div class="sk-chase-dot"></div>'+
    			  '<div class="sk-chase-dot"></div>'+
    			  '<div class="sk-chase-dot"></div>'+
    			'</div>'+
    		   '</div>'
    	
    	);
    	
        var file = $(this)[0].files[0];
        var storageRef = storage.ref().child(Date.now() + file.name);
        storageRef.put(file).then(function(snapshot) {
            storageRef.getDownloadURL().then(function(url){
            	
            	$('.loading-div').fadeOut().remove();
            	globalVar.url=url;
            	
            });
        });
    });
    
    $('#btnUpdate').on('click',function(){
    	var mem_id = $('#writer').val();
    	var title = $('#title').val();
    	var cont = $('#cont').val();
    	var idx = $('#idx').val();
    	var url = globalVar.url;
    	
    	$.ajax({
            url:'/PBoard/Update',
            type:'POST',
            data:{
            	idx	 : idx,
                title : title,
                mem_id : mem_id,
                img_url: url,
                cont : cont,
            },
            success:function(res){
            	location.href='/PBoard/List?page=1&perPageNum=20';
            	/*if(res=='good'){
            	}*/
            	
            },
            error:function(err){
            }
        });
    	console.log(mem_id + title + cont + url+ idx);
    });
    $('#final-submit-btn').on('click',function(){
    	var mem_id = $('#writer').val();
    	var title = $('#title').val();
    	var cont = $('#cont').val();
    	var url = globalVar.url;
    	var date = new Date();
    	
    	var now = new Date();
    	var year = now.getFullYear();
    	var month = (now.getMonth()+1);
    	var date = now.getDate();
    	var hours = now.getHours();
    	var minutes = now.getMinutes();
    	var seconds = now.getSeconds();
 
        if (hours > 12){
            hours -= 12;
        ampm = "오후 ";
        }else{
            ampm = "오전 ";
        }
        if (hours < 10){
            hours = "0" + hours;
        }
        if (minutes < 10){
            minutes = "0" + minutes;
        }
        if (seconds < 10){
            seconds = "0" + seconds;
        }


    	
    	$.ajax({
            url:'/PBoard/Write',
            type:'POST',
            data:{
                title : title,
                mem_id : mem_id,
                img_url: url,
                cont : cont,
                regdate: year+"년"+ month+"월" + date+"일" + hours+"시" + minutes+"분"
            },
           success:function(res){
            	if(res=='good'){
            		location.href='/PBoard/List?page=1&perPageNum=20';
            	}
            	
            },
            error:function(err){
            }
        });
    	
  	   // 작성자 입력? db writer : not null
 	   if ( $('#writer').val() == '') {
 		   alert('로그인 해주세요');
 		   $('#writer').focus();
 		   return false;   // submit 이벤트를 중지
 	   } 		   
 	   // 제목   입력? db title : not null
 	   if ( $('#title').val() == '') {
 		   alert('제목을 입력하세요');
 		   $('#title').focus();
 		   return false;   // submit 이벤트를 중지
 	   } 			   
 	   // 내용   입력? db cont  : not null
 	    if ( $('#cont').val() == '') {
 		   alert('내용을 입력하세요');
 		   $('#cont').focus();
 		   return false;   // submit 이벤트를 중지
 	   } 	
 	   
	       return true;
    	
    	console.log(mem_id + title + cont + url + regdate);
    });
    // 댓글 목록 출력 함수
    /*function getReplies() {
        $.getJSON("/comment/list/", function (data) {
            console.log(data);
            var str = "";
            $(data).each(function () {
                str += "<c:forEach items='${comment}'var='comment'>"
                	+ "<tr>"
                	+ "<input type='hidden' id='idx' name='idx' value='${comment.idx}'>"
        			+ "<input type='hidden' id='comment_num' name='comment_num' value='${comment.comment_num}'>"
        			+ "<td>${comment.mem_id} / ${comment.comment_regdate}</td>"
        			+ "<td colspan='3' >${comment.comment_content }<button id='comment_delete' name='comment_delete'>삭제</button></td>"
                    + "<tr/>"
                    + "</c:forEach>";
            });
            $("#replies").html(str);
        });
    }
    
    
    function getReplies1(cmt) {
    	
    	var html =  '<tr class="one-rep" data-comment-idx='+ cmt.idx +'data-comment-num='+ cmt.comment_num +'>'+
					'<td>${comment.mem_id} / ${comment.comment_regdate}</td>'+
					'<td colspan="3" >${comment.comment_content }<button id="comment_delete" name="comment_delete">삭제</button></td>'+
			        '<tr/>'
    	
        $.getJSON("/comment/list/", function (data) {
            console.log(data);
            var str = "";
            $(data).each(function () {
                str += "<c:forEach items='${comment}'var='comment'>"
                	+ "<tr>"
                	+ "<input type='hidden' id='idx' name='idx' value='${comment.idx}'>"
        			+ "<input type='hidden' id='comment_num' name='comment_num' value='${comment.comment_num}'>"
        			+ "<td>${comment.mem_id} / ${comment.comment_regdate}</td>"
        			+ "<td colspan='3' >${comment.comment_content }<button id='comment_delete' name='comment_delete'>삭제</button></td>"
                    + "<tr/>"
                    + "</c:forEach>";
            });
            $("#replies").html(str);
        });
    }*/
    
    $('#comment_submit').on('click',function(){
    	
    	var idx = $('#idx').val();
    	var mem_id = $('#mem_id').val();
    	var comment_content = $('#comment_content').val();
    	var comment_regdate = new Date();
    	
    	var now = new Date();
    	var year = now.getFullYear();
    	var month = (now.getMonth()+1);
    	var date = now.getDate();
    	var hours = now.getHours();
    	var minutes = now.getMinutes();
    	var seconds = now.getSeconds();
 
        if (hours > 12){
            hours -= 12;
        ampm = "오후 ";
        }else{
            ampm = "오전 ";
        }
        if (hours < 10){
            hours = "0" + hours;
        }
        if (minutes < 10){
            minutes = "0" + minutes;
        }
        if (seconds < 10){
            seconds = "0" + seconds;
        }
        
        var postData={
                idx : idx,
                mem_id : mem_id,
                comment_content : comment_content,
                comment_regdate: year+"."+ month+"." + date+ "  " + hours+"시" + minutes+"분"
            };
        
        $.ajax({
            url:'/comment/write',
            type:'POST',
            data:postData,
            dataType: "json",
            success:function(response){
            	if(res=='good'){
            		getReplies1(postData);
            	}
            },
            error:function(err){
            }
        });
		location.reload();
    });    

    
    $('#comment_delete').on('click',function(){
    	var comment_num = $('#comment_num').val();
    	var idx = $('#idx').val();
    	
    	$.ajax({
            url:'/comment/delete',
            type:'POST',
            data:{
                comment_num : comment_num,
                idx : idx,
            },
            success:function(res){
            	if(res=='good'){
            		getReplies();
            	}
            },
            error:function(err){
            }
            
        });
    	location.reload();
    	console.log('12312');
    });
    
    function showRequest(){
		
 		
        if(comment_content.length>100){
               alert("\n내용은 100자를 초과할 수 없습니다");
               $("#comment_content").focus();
               return false;
        }	
        return true;
 }
	    
});