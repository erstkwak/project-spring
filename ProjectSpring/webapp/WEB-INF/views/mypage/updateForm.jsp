<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/css/bootstrap.min.css">
<style type="text/css">
  td{
    border: 1px solid #000000;
    border-collapse: collapse;
  }
	#updateForm-body {
		margin-bottom: 0px;
		padding-bottom: 100px;
		padding-top: 100px;
		font-size: 16px;
		background-color: #e9e9e9;
	}
	#article-body {
		text-align: left;
	}
	form {
		width: 400px;
		margin: 0 auto;
	}
	.form-control {
		font-size: 16px;
	}
</style>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- daum 도로명 주소 찾기 api  -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	// 모든 공백 정규식
	var empJ = /\s/g;
	// 비밀번호 정규식 
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	// 이메일 검사 정규식 
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
	// 휴대폰 번호 정규식 
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	var address = $('#mem_detailaddress');
	
	$(document).ready(function(){
		var address = $('#mem_detailaddress');
		
			// 비밀번호가 같은경우 && 비밀번호 정규식
			if (($('#mem_pw').val() == ($('#mem_pw2').val())) && pwJ.test($('#mem_pw').val())) {
				inval_Arr[1] = true;
			} else {
				inval_Arr[1] = false;
				alert('비밀번호를 확인하세요.');
				return false;
			}
			
			// 이메일 정규식
			if(mailJ.test($('#mem_email').val())){
				console.log(mailJ.test($('#mem_email').val()));
				inval_Arr[4] = true;
			} else {
				inval_Arr[4] = false;
				alert('이메일을 확인하세요');
				return false;
			}
			
			// 휴대폰번호 정규식
			if (phoneJ.test($('#mem_phone').val())) {
				console.log(phoneJ.test($('#mem_phone').val()));
				inval_Arr[5] = true;
			} else {
				inval_Arr[5] = false;
				alert('휴대폰 번호를 확인하세요.');
				return false
			}
			
			// 주소확인
			if(address.val() == ''){
				inval_Arr[7] = false;
				alert('주소를 확인하세요.');
				return false;
			} else 
				inval_Arr[7] = true;
			
			// 전체 유효성 검사
			var validAll = true;
			for(var i = 0; i < inval_Arr.length; i++){
				if(inval_Arr[i] == false){
					validAll = false;
				}
			}
			
			if(validAll == true){ // 유효성 모두 통과
				alert('GoCamping 가족이 되어주셔서 감사합니다.');
			} else {
				alert('정보를 다시 확인하세요.')
			}
		}); //$('form').on('submit' end
		
		
		$('#mem_pw').blur(function(){
			if(pwJ.test($('#mem_pw').val())){
				colsole.log('true');
				$('#pw_check').text('');
			} else {
				console.log('false');
				$('#pw_check').text('4~12자의 숫자, 문자로만 사용 가능합니다.');
				$('#pw_check').css('color', 'red');
			}
		});
		
		// 1~2 패스워드 일치 확인
		$('#mem_pw2').blur(function(){
			if($('#mem_pw').val() != $(this).val()){
				$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
				$('#pw2_check').css('color', 'red');
			} else {
				$('#pw2_check').text('');
			}
		});
		
		$('#mem_email').blur(function(){
			if (mailJ.test($('this').val())){
				$('#email_check').text('');
			} else {
				$('#email_check').text('이메일 양식을 확인해 주세요');
				$('#email_check').css('color', 'red');
			}
		});
		
		
		// 핸드폰
		$('#mem_phone').blur(function(){
			if(phoneJ.test($('this').val())){
				console.log(phoneJ.test($(this).val()));
				$('#phone_check').text('');
			} else {
				$('#phone_check').text('휴대폰번호를 확인해 주세요.');
				$('#phone_check').css('color', 'red');
			}
		}); // 핸드폰 phoneJ 유효성 검사 end
		
		$(document).ready(function(){
			// 취소
			$(".cancle").on("click", function(){
				location.href = "/";
			});
		})	
	
	function execPostcode(){
		new daum.Postcode({
			oncomplete: function(data){
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr  = data.roadAddress; // 주소 변수
                var extraRoadAddr = ''; // 참고항목 변수
				
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다. 
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){ 
                	extraRoadAddr += data.bname; 
                }
             	
                // 건물명이 있고, 공동주택일 경우 추가한다. 
             	if(data.buildingName !== '' && data.apartment === 'Y'){ 
             		extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName); 
             	} 
             	
             	// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다. 
             	if(extraRoadAddr !== ''){ 
             		extraRoadAddr = ' (' + extraRoadAddr + ')'; 
             	} 
             	
             	// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다. 
             	if(fullRoadAddr !== ''){ 
             		fullRoadAddr += extraRoadAddr; 
             	} 
             	
             	// 우편번호와 주소 정보를 해당 필드에 넣는다. 
             	console.log(data.zonecode); 
             	console.log(fullRoadAddr);

             	$("[name=mem_zipcode]").val(data.zonecode); 
             	$("[name=mem_zipcode]").val(fullRoadAddr);

             	document.getElementById('mem_zipcode').value = data.zonecode; //5자리 새우편번호 사용 
             	document.getElementById('mem_address').value = fullRoadAddr;

			} 
		}).open();
	}
</script>

<div id="updateForm-body">
	<div id="wrap">
		<div id="article-body">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<form action="memberUpdate" method="post" role="form" id="usercheck" name="member">
							<legend style="text-align: center;">회원정보 수정</legend>
							<!-- 아이디 -->
							<div class="form-group">
								<label for="id">아이디</label>
								<input type="text" class="form-control" id="mem_id" name="mem_id" value="${login.mem_id}" readonly />
								<!-- <button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button> -->
								<div class="eheck_font" id="id_check"></div>
							</div>
							<!-- 비밀번호 -->
							<div class="form-group">
								<label for="pw">새 비밀번호</label>
								<input type="password" class="form-control" id="mem_pw" name="mem_pw" value="${login.mem_pw}" />
								<div class="eheck_font" id="pw_check"></div>
							</div>
							<!-- 비밀번호 확인 -->
							<div class="form-group">
								<label for="pw2">비밀번호 확인</label>
								<input type="password" class="form-control" id="mem_pw2" name="mem_pw2"
									placeholder="Confirm Password" />
								<div class="eheck_font" id="pw2_check"></div>
							</div>
							<!-- 이름 -->
							<div class="form-group">
								<label for="mem_name">이름</label>
								<input type="text" class="form-control" id="mem_name" name="mem_name" value="${login.mem_name}"
									readonly />
								<div class="eheck_font" id="name_check"></div>
							</div>
							<!-- 생년월일 -->
							<div class="form-group">
								<label for="mem_birth">생년월일</label>
								<input type="tel" class="form-control" id="mem_birth" name="mem_birth" value="${login.mem_birth}"
									readonly />
								<div class="eheck_font" id="birth_check"></div>
							</div>
							<!-- 성별 -->
							<div class="form-group">
								<label for="mem_gender">성별</label>
								<input type="text" class="form-control" style="width: 40%; display: inline;" id="mem_gender"
									name="mem_gender" value="${login.mem_gender}" readonly>
							</div>
							<!-- 이메일 주소 -->
							<div class="form-group">
								<label for="mem_email">이메일 주소</label>
								<input type="email" class="form-control" id="mem_email" name="mem_email" value="${login.mem_email}" />
								<div class="eheck_font" id="email_check"></div>
							</div>
							<!-- 휴대폰 번호 -->
							<div class="form-group">
								<label for="mem_phone">휴대폰 번호('-'없이 번호만 입력해주세요)</label>
								<input type="tel" class="form-control" id="mem_phone" name="mem_phone" value="${login.mem_phone}" />
								<div class="eheck_font" id="phone_check"></div>
							</div>
							<div class="form-group">
								<input class="form-control" style="width: 40%; display: inline;" value="${login.mem_zipcode}"
									name="mem_zipcode" id="mem_zipcode" type="text" readonly="readonly" />
								<button type="button" class="btn btn-light" onclick="execPostcode();"><i class="fa fa-search"></i>우편번호
									찾기</button>
							</div>
							<div class="form-group">
								<input class="form-control" style="top: 5px;" value="${login.mem_address}" name="mem_address"
									id="mem_address" type="text" readonly="readonly" />
							</div>
							<div class="form-group">
								<input class="form-control" value="${login.mem_detailaddress}" name="mem_detailaddress"
									id="mem_detailaddress" />
							</div>
							<div class="form-group text-center">
								<button type="submit" class="btn btn-primary">수정하기</button>
								<button type="button" class="cancle btn btn-danger">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>