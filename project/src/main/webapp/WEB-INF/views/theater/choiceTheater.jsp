<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 선택</title>
</head>
<body>
	<div style="font-weight: bold; font-size: 20px;">극장별</div>
	<c:forEach var="theater" items="${list}" varStatus="m">
		<a class="btn btn-info" style="width: 90px; height:30px; font-size: 11px; margin-bottom: 5px; vertical-align:middle;" onclick="theaterMove(${theater.t_num})">${theater.t_title }</a>&nbsp;
	</c:forEach>
</body>
</html>