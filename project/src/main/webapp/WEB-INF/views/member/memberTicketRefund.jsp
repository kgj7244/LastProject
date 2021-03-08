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
	<c:if test="${screenRefund >0}">
		<div class="container" align="center">
			<div style="margin-top: 15px;">
				<h2>환불이 완료되었습니다.</h2>
			</div>
			<table class="table table-bordered">
				<tr>
					<td align="center"><img src="${path}/resources/images/home/감사.png"></td>
				</tr>
				<tr>
					<td align="center">다음에 또 이용해주세요.</td>
				</tr>
				<tr>
					<td align="center"><input type="button" value="메인으로" onclick='location.href="mainForm.do"' class="btn btn-info"></td>
				</tr>
			</table>
		</div>
	</c:if>
	<c:if test="${screenRefund ==0}">
		
	</c:if>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>