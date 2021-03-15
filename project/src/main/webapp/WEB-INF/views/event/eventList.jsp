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
			<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; font-size: 30px; margin-top: 30px;">이벤트 관리</td>
		</tr>
	</table>
	<hr>
	<div align="right"><a href="eventListUpdate.do" class="btn btn-info">이벤트 수정 / 삭제</a></div>
	<form>
		<table class="table table-bordered">
			<tr>
				<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">번호</td>
				<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">아이디</td>
				<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">상태</td>
				<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">이벤트번호</td>
				<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">쿠폰발급</td>
				<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">취소</td>
			</tr>
			<c:if test="${empty event_overList}">
				<td colspan="6" align="center">이벤트 이용하는 사람이 없습니다.</td>
			</c:if>	
			<c:if test="${!empty event_overList}">		
				<c:forEach var="eo" items="${event_overList}">
					<tr>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;">${eo.eo_num}</td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;">${eo.member_id}</td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;">${eo.eo_state}</td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;">${eo.e_num}</td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;"><a href="Issued.do?eo_num=${eo.eo_num}" class="btn btn-warning">발급</a></td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;"><a href="cancel.do?eo_num=${eo.eo_num}" class="btn btn-danger">취소</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>