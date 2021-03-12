<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
<c:if test="${result == 1}">
	<table class="table table-bordered">
		<tr><td><h2>이벤트 참여해주셔서 감사합니다.</h2>	</td></tr>
		<tr><td><img alt="이미지가 안보이지만 감사합니다." src="${path}/resources/images/home/감사.png" width="100%" height="100%"></td>	</tr>
		<tr><td><a href="mainForm.do" >메인으로</a></td></tr>
	</table>
</c:if>
<c:if test="${result == 0}">
	<table class="table table-bordered">
		<tr><td><h2>이벤트에 오류가 발생했습니다. 죄송합니다</h2></td></tr>
		<tr><td><img alt="이미지가 안보이지만 감사합니다." src="${path}/resources/images/home/감사.png" width="100%" height="100%"></td>	</tr>
		<tr><td><a href="mainForm.do" >메인으로</a></td></tr>
	</table>
</c:if>
<c:if test="${result == -1}">
	<table class="table table-bordered">
		<tr><td><h2>이벤트에 참여하셨군요. 다른 이벤트에 이용해주시길 바랍니다.</h2></td></tr>
		<tr><td><img alt="이미지가 안보이지만 감사합니다." src="${path}/resources/images/home/감사.png" width="100%" height="100%"></td>	</tr>
		<tr><td><a href="mainForm.do" >메인으로</a></td></tr>
	</table>
</c:if>


<%@ include file="../mainFloor.jsp" %>
</body>
</html>