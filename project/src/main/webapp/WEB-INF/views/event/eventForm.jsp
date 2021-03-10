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
<div class="container" align="center">
	<h2>이벤트 상품 목록입니다.</h2>
	<form action="#" method="post">
		<table class="table table-bordered">
			<tr>
				<td>이벤트 번호</td>
				<td>이벤트 제목</td>
				<td>이벤트 종류</td>
				<td>할인금액</td>
				<td>사진</td>
			</tr>
			<tr>
				<c:forEach var ="i" items="${eventList}">
					<td>${i.e_num}</td>
					<td>${i.e_title}</td>
					<td>${i.e_state}</td>
					<td>${i.e_sale}</td>
					<td>${i.e_poster}</td>
				</c:forEach>
			</tr>
		</table>
	</form>	
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>