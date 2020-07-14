<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=3">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
	.maplocation{
	margin-left:320px;
	margin-top:50px;
	}
	.sidebar{
		width:300px;
	}
</style>
<body>
<!-- Sidebar -->
<div class="w3-sidebar w3-bar-block w3-border-right sidebar" style="display:block" id="mySidebar">
  <button onclick="w3_close()" class="w3-bar-item w3-large">Close &times;</button>
  <a href="index" class="w3-bar-item w3-button">메인</a>
 <!--  <a href="#" class="w3-bar-item w3-button">Link 2</a>
  <a href="#" class="w3-bar-item w3-button">Link 3</a> -->
  				<form action="citysearch_pro">
					<p>
						우리지역 선별진료소 찾기<input type="text" name="city">
						<input type="submit" value="검색">												                     
					</p>
				</form>
				
				<c:forEach var="obj" items="${h}">

						<%-- <tr>
							<td><input type="checkbox" name ="hospitalname" value ="${obj.hospitalname }" ></td>
							<td class="text-center d-none d-md-table-cell">${obj.possible }</td>
							<td><a href='mapview?search=${obj.hospitalname }'>${obj.hospitalname }</a></td>											
							<td class="text-center d-none d-md-table-cell">${obj.tel }</td>
						</tr>
						 --%>
						<%-- <ul>
							<li>${obj.possible }</li>
							<li>${obj.hospitalname }</li>
							<li>${obj.tel }</li>
						</ul> --%>
						<p>
						병원명:<a href='${root }search?search=${obj.hospitalname }&city=${city}'>${obj.hospitalname }</a><br>
						검체채취 가능여부:${obj.possible }<br>
						병원Tel:${obj.tel }<br>
						</p>
					</c:forEach>
</div>

<div class="w3-teal headaaa">
  <button class="w3-button w3-teal w3-xlarge" onclick="w3_open()">☰</button>
</div>

<div class="maplocation">
	<div id="map" style="width:90%;height:800px;"></div>
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



<script>
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
}

function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}
</script>
   
   
     
</body>
</html> 
