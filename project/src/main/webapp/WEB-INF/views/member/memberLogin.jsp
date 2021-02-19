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
<%@ include file="../mainTop.jsp" %>
<%@ include file="../mainNav.jsp" %>
<div class="container" align="center">
	<c:if test="${result>0}">
		<table>
			<tr>
				<td>${member_id}님 환영합니다.</td>
			</tr>
			<tr>
				<td><a href="mainForm.do">메인으로</a></td>
			</tr>
		</table>
	</c:if>
	<c:if test="${result==-1}">
		<table>
			<tr>
				<td>입력하신 아이디가 없거나 비밀번호가 다릅니다. 다시 입력바랍니다.</td>
			</tr>
			<tr>
				<td><a href="#">돌아가기</a></td>
			</tr>
		</table>
	</c:if>
	<c:if test="${result==0}">
		<table>
			<tr>
				<td>입력하신 아이디가 없거나 비밀번호가 다릅니다. 다시 입력바랍니다.</td>
			</tr>
			<tr>
				<td><a href="#">돌아가기</a></td>
			</tr>
		</table>
	</c:if>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>