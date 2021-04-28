<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<style>
		#map{
			width:1000px;
			height:500px;
			margin:0 auto; 
		}
		#test {
			display: flex;
			justify-content: center;
			align-items: center;
		}
		#input_search_text {
			width: 250px;
		}
		#searchType {
			width: 140px;
		}
		#location-body {
			background-color: #e9e9e9;
		}
	.table {background-color: white;}
	</style>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!--  부트스트랩 js 사용 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	
	<style>
		.table>tbody>tr.info>td, .table>tbody>tr.info>th, .table>tbody>tr>td.info, .table>tbody>tr>th.info, .table>tfoot>tr.info>td, .table>tfoot>tr.info>th, .table>tfoot>tr>td.info, .table>tfoot>tr>th.info, .table>thead>tr.info>td, .table>thead>tr.info>th, .table>thead>tr>td.info, .table>thead>tr>th.info {background-color: white;}
	</style>
	
	
	<div id="location-body" style="padding-top: 20px;">
	<br><br>
	<h2 style="text-align: center;">──── 캠핑장 검색하기 ────</h2>
	<br>
	<!-- 지도위에 marker 띄우기 -->
	<div id="map"></div>
	<br>
		<div id="test">
				<input class="form-control" type='text' id='input_search_text' name='input_search_text' placeholder="검색어"/>
				&nbsp;
				<input type="button" id="search_text" class="btn btn-default" value="검색" />
		</div><br>
		<!-- 검색한기본정보 목록 -->
		<div style="text-align: center; color:black;">
			<h3>캠핑장 검색 결과 [캠핑 기본 목록 리스트]</h3>
		</div><br>
		<div id="resultCampingBoot" style="display:none;">
		</div>
		<div id="paging" style="text-align: center"></div>
	<br><br><br>
	</div>
	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6b28e8f54b0d140fdafafa41ba8e544&libraries=LIBRARY"></script>	
<script>
// map & marker
	console.log("map");
	//완전기본 경도,위도 찍어서 네이버 위치 보기 
	var mapContainer = document.getElementById('map'); //지도를 표시할 div
	var mapOption = {
		center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
	       level : 13 // 지도의 확대 레벨 
	};
	//지도를 표시할 div와 지도 옵션으로 지도를 생성합니다 
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
	var markers = [];
	
// 리스트 & 페이징	
	$("#paging").hide()
	// 페이징을 위한 데이터
	var totalData = 0;
	var dataPerPage = 0;
	var pageCount = 0;	
	var selectedPage = 1;
	//서버에 날릴 데이터 
	var addr_json = {
			"currentPage" : 1, //처음 검색했을때는 1페이지 기준으로
			"countPerPage" : 10, // 한페이지에 표기될 데이터 개수
			"keyword" : $('search_text') // 검색어
	}; //서버에 보낼 데이터 뭉치 
	
	$(document).ready(function(){
		$('#search_text').click(function() { // 검색 버튼을 클릭할때 
			var search_type = $('#searchType').val();
			console.log("search_type = " + search_type);
			var search_text = $('#input_search_text').val();
			console.log("search_text = " +search_text);
			
			addr_json.keyword = search_type;
			addr_json.keyword = search_text;
			$.ajax({
				type : "GET",
				data : addr_json,
				url : "/camp/searchText",
				success : function(result) {
					var json_address = JSON.parse(result);
					console.log(json_address);
					totalData = json_address.response.body.totalCount // 전체 데이터 개수
					dataPerPage = json_address.response.body.pageNo // 한페이지에 나타낼 데이터 개수 
					pageCount = 10;  // 한 화면에 표기할 페이지수 
					
					if(json_address.response.length == 0){
						selectedPage = 1;
					}
					
					var myItems = json_address.response.body.items.item; // 리스트
					
					var resultHTML = "";
							resultHTML +='<div class="table-responsive">';
							resultHTML +='<table class="table table-hover table-bordered">';
							resultHTML += '<thead class="thead-light">';
							resultHTML +=   '<tr>';
							resultHTML +=      '<th>캠핑장이름</th>';
							resultHTML +=      '<th>작성일</th>';
							resultHTML +=      '<th>업종</th>';
							resultHTML +=      '<th>운영기간</th>';
							resultHTML +=      '<th>운영일</th>';
							resultHTML +=      '<th>주소</th>';
							resultHTML +=      '<th>애완동물출입</th>';
							resultHTML +=      '<th>전화번호</th>';
							resultHTML +=      '<th>(검색-도)</th>';	
							resultHTML +=   '</tr>';
							resultHTML += '</thead>';
							resultHTML += '<tbody>';
					
					for (var i = 0; i < myItems.length; i++) {
						setMarkers(null);
						
						var myItem = json_address.response.body.items.item[i];
						var date = myItem.createdtime.substring(0,10); //날짜 시간 빼기
						
						if(myItem.tel == null || myItem.induty == null || myItem.operDeCl == null 
								|| myItem.operPdCl == null|| myItem.animalCmgCl == null){
							myItem.tel ="없음", myItem.induty ="없음", myItem.operDeCl ="없음", myItem.operPdCl ="없음", myItem.animalCmgCl ="없음"
						} 
						
						if(myItem) { //검색 캠핑장
							resultHTML +=   '<tr class="active">';
							resultHTML +=      '<td>'+ myItem.facltNm +'</td>';
							resultHTML +=      '<td>'+ date +'</td>';
							resultHTML +=      '<td>'+ myItem.induty +'</td>';
							resultHTML +=      '<td>'+ myItem.operDeCl +'</td>';
							resultHTML +=      '<td>'+ myItem.operPdCl +'</td>';
							resultHTML +=      '<td>'+ myItem.addr1 +'</td>';
							resultHTML +=      '<td>'+ myItem.animalCmgCl +'</td>';
							resultHTML +=      '<td>'+ myItem.tel +'</td>';
							resultHTML +=      '<td>'+ myItem.doNm +'</td>';
							resultHTML +=   '</tr>';
						} 
						
						console.log("API성공하였습니다. 결과알림창 = myItem[" + i + "]");
					}
				
						resultHTML += '</tbody>';
						resultHTML +='</table>';
						resultHTML +='</div>';
					$("#resultCampingBoot").html(resultHTML);
					/* totalData = json_address.response.body.totalCount // 전체 데이터 개수
					dataPerPage = json_address.response.body.pageNo // 한페이지에 나타낼 데이터 개수 
					pageCount = 10;  // 한 화면에 표기할 페이지수  */
					paging(totalData, dataPerPage, pageCount, selectedPage);
					$("#paging").show();
					$("#resultCampingBoot").show();
					
					//마커 경도,위도
					console.log('start_markerlist');
					console.log(json_address);
					
					// 마커 이미지의 이미지 주소입니다
					var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
					
					for (var i = 0; i < myItems.length; i ++) {
					    // 마커 이미지의 이미지 크기 입니다
					    var imageSize = new kakao.maps.Size(24, 35); 
					    // 마커 이미지를 생성합니다    
					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
					    
					    var myItem = json_address.response.body.items.item[i];
					    var latlng = new kakao.maps.LatLng(myItems[i].mapY, myItems[i].mapX); //위도,경도
					    
					    // 마커를 생성합니다 title : myItem.facltNm, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					    var marker = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: latlng, // 마커를 표시할 위치
					        image : markerImage // 마커 이미지 
					    });
					 	// 생성된 마커를 배열에 추가합니다
					     markers.push(marker);
					 	
					 	// 마커에 표시할 인포윈도우를 생성합니다 
					    var infowindow = new kakao.maps.InfoWindow({
					        content: myItem.facltNm // 인포윈도우에 표시할 내용
					    });

					    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
					    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
					    (function(marker, infowindow) {
					        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
					        kakao.maps.event.addListener(marker, 'mouseover', function() {
					            infowindow.open(map, marker);
					        });

					        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
					        kakao.maps.event.addListener(marker, 'mouseout', function() {
					            infowindow.close();
					        });
					    })(marker, infowindow);
					}
					
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});
		});
	});
	
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }            
	}
	//페이징
	function paging(totalData, dataPerPage, pageCount, currentPage) {
	  	// 총 페이지 수
	    var totalPage = Math.ceil(totalData/dataPerPage);
	 	// 페이지 그룹
	    var pageGroup = Math.ceil(currentPage/pageCount);    
	    
	    var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
	    if(last > totalPage)
	        last = totalPage;
	    
	    var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
	    if (first < 1 ){ 
	    	first = 1;
	    }
	    
	    var next = last+1;
	    var prev = first-1;
	     
	    var $pingingView = $("#paging");
	    
	    var html = "";
	    	html += "<ul class='pagination justify-content-center'>";
	    if(prev > 0){
	        html += "<li class='page-item'><a class='page-link' href=# id='prev'><</a></li>";
	    }
	    for(var i=first; i <= last; i++){
	        html += "<li class='page-item'><a class='page-link' href='#' id=" + i + ">" + i + "</a></li>";
	    }
	    
	    if(last < totalPage){
	        html += "<li class='page-item'><a class='page-link' href=# id='next'>></a></li>";
	    }
	    html +="</ul>";
	    
	    $("#paging").html(html);    // 페이지 목록 생성
	    $("#paging a").css("color", "black");
	    $("#paging a#" + currentPage).css({"text-decoration":"none", 
	                                       "color":"white", 
	                                       "font-weight":"bold",
	                                       "background-color":"black"});    // 현재 페이지 표시
	    $("#paging a").click(function(){ // 아래 페이징을 클릭했을때 발생하는 이벤트 
	        var $item = $(this);
	        var $id = $item.attr("id");
	       	selectedPage = $item.text(); // 클릭한 페이지 수      
	      
	        if($id == "next")    selectedPage = next; // 다음 버튼 클릭시
	        if($id == "prev")    selectedPage = prev; // 이전 버튼 클릭시 
	        
	        addr_json.currentPage = selectedPage;
	        setMarkers(null);
	        $("#search_text").click();
	    });
	}
</script>
</body> 
</html>