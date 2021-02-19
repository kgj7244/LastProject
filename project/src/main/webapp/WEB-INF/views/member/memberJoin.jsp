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
				<td>회원가입에 성공하셨습니다</td>
			</tr>
			<tr>
				<td>아이디 : ${member.member_id}</td>
			</tr>
			<tr>
				<td><a href="memberLoginForm.do">로그인</a><a href="mainForm.do">메인으로</a></td>
			</tr>
		</table>
	</c:if>
	<c:if test="${result==0}">
		<table>
			<tr>
				<td>죄송합니다. 회원가입에 실패하셨습니다.</td>
				<td><a href="#">돌아가기</a></td>
			</tr>
		</table>
	</c:if>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>