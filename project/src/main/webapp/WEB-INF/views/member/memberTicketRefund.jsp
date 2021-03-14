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
	<c:if test="${ticket >0}">
		<div class="container" align="center">
			<table class="table table-hover" style="margin-top: 30px;">
				<tr>
					<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; font-size: 30px; margin-top: 30px;">환불이 완료되었습니다.</td>
				</tr>
			</table>
			<table>
				<tr>
					<td align="center"><img src="${path}/resources/images/home/감사.png" width="300px;" height="300px;"></td>
				</tr>
				<tr>
					<td align="center">다음에 또 이용해주세요.</td>
				</tr>
				<tr>
					<td align="center"><input type="button" class="btn btn-warning" value="메인으로" onclick='location.href="memberTicket.do"'></td>
				</tr>
			</table>
		</div>
	</c:if>
	<c:if test="${ticket ==0}">
		<div class="container" align="center">
			<table class="table table-hover" style="margin-top: 30px;">
				<tr>
					<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; font-size: 30px; margin-top: 30px;">에러가 발생했습니다..</td>
				</tr>
			</table>
			<table>
				<tr>
					<td align="center"><img src="${path}/resources/images/home/감사.png" width="300px;" height="300px;"></td>
				</tr>
				<tr>
					<td align="center">다음에 또 이용해주세요.</td>
				</tr>
				<tr>
					<td align="center"><input type="button" class="btn btn-warning" value="메인으로" onclick='location.href="memberTicket.do"'></td>
				</tr>
			</table>
		</div>
	</c:if>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>