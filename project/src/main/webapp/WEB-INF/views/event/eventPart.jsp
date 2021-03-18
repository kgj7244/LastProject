<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
</style>
<style type="text/css">
	#container1{
		height: 750px;
	}
</style>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
<c:if test="${result == 1}">
	<div class="container" align="center" id="container1">
	<div align="left"><h2>이벤트 참여해주셔서 감사합니다.</h2></div>
	<hr style="border: 0px; height: 3px; background-color: #cccccc;">
	<hr>
		<table>
			<tr>
				<td align="center" style="vertical-align: middle;"><img alt="이미지가 안보이지만 감사합니다." src="${path}/resources/images/home/감사.png" width="80%" height="50%"></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle;"><a href="mainForm.do" class="btn btn-warning btn-lg" style="width: 150px;">메인으로</a></td>
			</tr>
		</table>
	</div>
</c:if>
<c:if test="${result == 0}">
	<div class="container" align="center" id="container1">
		<div align="left"><h2>이벤트에 참여하였거나 오류가 발생하였습니다.</h2></div>
		<hr style="border: 0px; height: 3px; background-color: #cccccc;">
		<table>
			<tr>
				<td align="center" style="vertical-align: middle;"><img alt="이미지가 안보이지만 감사합니다." src="${path}/resources/images/home/감사.png" width="80%" height="50%"></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle;"><a href="mainForm.do" class="btn btn-warning btn-lg" style="width: 150px;">메인으로</a></td>
			</tr>
		</table>
	</div>
</c:if>
<c:if test="${result == -1}">
	<div class="container" align="center" id="container1">
		<div align="left"><h2>이벤트에 참여하였거나 오류가 발생하였습니다.</h2></div>
		<hr style="border: 0px; height: 3px; background-color: #cccccc;">
		<table>
			<tr>
				<td align="center" style="vertical-align: middle;"><img alt="이미지가 안보이지만 감사합니다." src="${path}/resources/images/home/감사.png" width="80%" height="50%"></td>
			</tr>
			<tr>
				<td align="center" style="vertical-align: middle;"><a href="mainForm.do" class="btn btn-warning btn-lg" style="width: 150px;">메인으로</a></td>
			</tr>
		</table>
	</div>
</c:if>


<%@ include file="../mainFloor.jsp" %>
</body>
</html>