<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/react/base.css" />
<link rel="stylesheet" href="/css/react/component.css" />
<link rel="stylesheet" href="/css/react/corona.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.header{
		text-align:center;
	}
	
.popup_btn a {
	display: inline-block;
	padding: 20px;
	background: darkred;
	color: #fff;
}

.overlay {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.7);
	transition: opacity 500ms;
	visibility: hidden;
	opacity: 0;
	z-index: 900;
}

.overlay:target {
	visibility: visible;
	opacity: 1;
}

.popup {
	position: fixed;
	width: 60%;
	padding: 10px;
	max-width: 500px;
	border-radius: 10px;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: rgba(255, 255, 255, .9);
	/* "delay" the visibility transition */
	-webkit-transition: opacity .5s, visibility 0s linear .5s;
	transition: opacity .5s, visibility 0s linear .5s;
	z-index: 1;
}

.popup:target {
	visibility: visible;
	opacity: 1;
	/* cancel visibility transition delay */
	-webkit-transition-delay: 0s;
	transition-delay: 0s;
}

.popup-close {
	position: absolute;
	padding: 10px;
	max-width: 500px;
	border-radius: 10px;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: rgba(255, 255, 255, .9);
}

.popup .close {
	position: absolute;
	right: 5px;
	top: 5px;
	padding: 5px;
	color: #000;
	transition: color .3s;
	font-size: 2em;
	line-height: .6em;
	font-weight: bold;
}

.popup .close:hover {
	color: #00E5EE;
	}
	
.loginmargin{
	margin:20px;
}
</style>


	
	


<script>

function button_event(){
if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	
	location.href="real_delete?search=${search}"
			
}else{   //취소
    return;
}
}

</script>

</head>
<body>

<%-- <!-- 글 작성 팝업 -->
	<div id="writeupdatepop" class="overlay">
		<div class="popup">
			<a href="#none" class="close">&times;</a>
			<div class="card shadow loginmargin">
				<div class="card-body">
					
						<form:form action='update_pros' method='post' modelAttribute="updateHospitalData">
						
						<div class="form-group">
							<form:label path="dates">기준일시</form:label>
							<form:input path="dates" class='form-control' value="${updateHospitalData.dates}"/>
							
						</div>
						<div class="form-group">
							<form:label path="possible">검체채취 가능여부</form:label>
							<form:input path="possible" class='form-control'/>
						
						</div>
						<div class="form-group">
							<form:label path="city">시도</form:label>
							<form:input path="city" class='form-control'/>
							
						</div><div class="form-group">
							<form:label path="township">시군구</form:label>
							<form:input path="township" class='form-control'/>
						
						</div>
						<div class="form-group">
							<form:label path="hospitalname">의료기관명</form:label>
							<form:input path="hospitalname" class='form-control'/>
							
						</div>
						<div class="form-group">
							<form:label path="address">주소</form:label>
							<form:input path="address" class='form-control'/>
							
						</div>
						<div class="form-group">
							<form:label path="tel">전화번호</form:label>
							<form:input path="tel" class='form-control'/>
							
						</div>
						<div class="form-group">
							<div class="text-right">
								<form:button class='btn btn-primary'>작성하기</form:button>
							</div>
						</div>
					</form:form>
					
				</div>
			</div>
		</div>
	</div>





 --%>








<div class="kakao">
<h4 class="header">카카오 지도</h4>
<h5>병원명:${search}</h5>
</div>	
<c:if test="${loginUserBean.isLogin_check() == true}">
<div class="text-right">
					<div class="text-right">
						<a href="update?search=${search}" target="_blank"
						class="btn btn-primary">데이터 수정</a>
				
					<a href="#none"
						class="btn btn-primary" onclick="button_event();">데이터 삭제</a>					
					</div>
					
					
</div>
</c:if>
<br>
<div>
<div id="map" style="width:100%;height:800px;"></div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fc950fe6e0348dbd254652728e00bfa&libraries=services"></script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch("${search}", placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>

</body>
</html>