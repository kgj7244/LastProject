<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" align="center">
<c:if test="${!not empty mem}">
	<div>
		<a href="memberLoginForm.do">로그인</a>
		<a href="memberJoinForm.do">회원가입</a>
	</div>
</c:if>
<c:if test="${not empty mem}">
	<div>
		${mem.member_id}님 환영합니다.
		<a href="#">마이페이지</a>
		<a href="memberLogout.do">로그아웃</a>
	</div>
</c:if>
</div>
</body>
</html>