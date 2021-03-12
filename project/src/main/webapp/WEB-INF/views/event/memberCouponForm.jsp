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
	<h2>쿠폰 사용 여부</h2>
	<table class="table table-bordered">
		<tr>
			<td>쿠폰번호</td>
			<td>사용여부</td>
			<td>이벤트제목</td>
		</tr>
		<c:if test="${empty coupon}">
			<tr>
				<td colspan="4">현재 사용가능한 쿠폰이 없습니다.</td>		
			</tr>
		</c:if>
		<c:if test="${!empty coupon}">
			<c:forEach var ="c" items="${coupon}">
				<tr>
					<td>${c.eo_num}</td>
					<td>${c.eo_state}</td>
					<td>${c.e_num}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>