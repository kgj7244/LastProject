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
<div class="container" align="center" id="container1">
	<table class="table table-hover" style="margin-top: 30px;">
		<tr>
			<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; font-size: 30px; margin-top: 30px;">쿠폰 보유 내역</td>
		</tr>
	</table>
	<hr>
	<table class="table table-bordered table-hover">
		<tr>
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">쿠폰번호</td>
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">사용여부</td>
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">이벤트제목</td>
		</tr>
		<c:if test="${empty coupon}">
			<tr>
				<td colspan="4" align="center">현재 사용가능한 쿠폰이 없습니다.</td>		
			</tr>
		</c:if>
		<c:if test="${!empty coupon}">
			<c:forEach var ="c" items="${coupon}">
				<tr>
					<td align="center" style="color:#8c8b9b;vertical-align: middle;">${c.eo_num}</td>
					<td align="center" style="color:#8c8b9b;vertical-align: middle;">${c.eo_state}</td>
					<td align="center" style="color:#8c8b9b;vertical-align: middle;">${c.e_num}</td>
				</tr>
			</c:forEach>
		</c:if>
		<tr>
			<td align="center" colspan="3"><input type="button" value="목록으로" onclick="location.href='mypage.do'" class="btn btn-warning"></td>
		</tr>
	</table>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>