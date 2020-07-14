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
.updatemargin{
	margin-top:120px;
	margin-left:200px;
	margin-right:200px;
}
</style>
</head>
<body>


			<div class="card shadow loginmargin updatemargin">
				<div class="card-body">
					
						<form:form action='update_pro?search=${search }' method='post' modelAttribute="updateHospitalData">
						
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



</body>
</html>