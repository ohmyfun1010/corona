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
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
}
/* popup */
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
.testalign{
	text-align:center;
}
</style>

<title>Insert title here</title>
 

</head>
<body>

	<%-- <h1>Hello Spring MVC Java</h1>
	<ul>
		<li><a href="index">메인</a></li>
		<li><a href="citysearch">지역별 진료소 찾기</a></li>
		<li><a href="#contact">Contact</a></li>
		<c:choose>
			<c:when test="${loginUserBean.isLogin_check() == true}">
				<li style="float: right"><a class="popup_btn" href="drop">관리자모드
						해제</a></li>
			</c:when>
			<c:otherwise>
				<li style="float: right"><a class="popup_btn" href="#pop01">관리자모드</a></li>
			</c:otherwise>
		</c:choose>
	</ul>





	<!-- 로그인 팝업 -->
	<div id="pop01" class="overlay">
		<div class="popup">
			<a href="#none" class="close">&times;</a>
			<div class="card shadow loginmargin">
				<div class="card-body">
					<c:if test="${fail == true }">
					<div class="alert alert-danger">
						<h3>로그인 실패</h3>
						<p>아이디 비밀번호를 확인해주세요</p>
					</div>
					</c:if>
					<form:form action="login_pro" method="post" modelAttribute="LoginManagerBean">
						<div class="form-group">
							<form:label path="manager_id">아이디</form:label>
							<form:input path="manager_id" class='form-control' />
							<form:errors path='user_id' style='color:red' />
						</div>
						<div class="form-group">
							<form:label path="manager_pw">비밀번호</form:label>
							<form:password path="manager_pw" class='form-control' />
							<form:errors path='user_pw' style='color:red' />
						</div>
						<div class="form-group text-right">
							<form:button class='btn btn-primary'>로그인</form:button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!-- 글 작성 팝업 -->
	<div id="writepop" class="overlay">
		<div class="popup">
			<a href="#none" class="close">&times;</a>
			<div class="card shadow loginmargin">
				<div class="card-body">
					
						<form:form action='write_pro' method='post' modelAttribute="writeHospitalData">
						
						<div class="form-group">
							<form:label path="dates">기준일시</form:label>
							<form:input path="dates" class='form-control'/>
							
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

	<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

	<div class="container" style="margin-top: 100px">
		<div class="card shadow">
			<div class="card-body">
				<h4 class="card-title"></h4>
					<h3 class="testalign">전국 선별 진료소 현황 및 위치</h3>
				<table class="table table-hover" id='board_list'>

					<thead>
						<tr>
						 							 					
							<th class="text-center d-none d-md-table-cell" width="200px">기준일시</th>
							<th class="text-center d-none d-md-table-cell" width="160px">검체채취
								가능여부</th>
							<th class="text-center d-none d-md-table-cell">시도</th>
							<th class="text-center d-none d-md-table-cell">시군구</th>
							<th class="text-center d-none d-md-table-cell">의료기관명</th>
							<th class="text-center d-none d-md-table-cell">주소</th>
							<th class="text-center d-none d-md-table-cell">전화번호</th>
						</tr>
					</thead>
					<c:forEach var="obj" items="${hospitaldata}">

						<tr>
							<%-- <td><input type="checkbox" name ="hospitalname" value ="${obj.hospitalname }" ></td> --%>
							<td class="text-center d-none d-md-table-cell">${obj.dates }</td>
							<td class="text-center d-none d-md-table-cell">${obj.possible }</td>
							<td class="text-center d-none d-md-table-cell">${obj.city }</td>
							<td class="text-center d-none d-md-table-cell">${obj.township }</td>
							<td><a href='mapview?search=${obj.hospitalname }' target = "_black">${obj.hospitalname }</a></td>						
							<td class="text-center d-none d-md-table-cell">${obj.address }</td>
							<td class="text-center d-none d-md-table-cell">${obj.tel }</td>
						</tr>

					</c:forEach>

				</table>

				<c:if test="${loginUserBean.isLogin_check() == true}">
				<div class="text-right">				
					<a href="#writepop" class="btn btn-primary">글쓰기</a>
				</div>
				</c:if>

			</div>
		</div>
	</div>
</body>
</html>