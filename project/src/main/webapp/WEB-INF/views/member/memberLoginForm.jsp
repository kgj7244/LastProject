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
	<h3>Log-in</h3>
	<form action="memberLogin.do" method="post">
		<table class="table table-bordered">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="member_id" required="required" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="member_password"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="로그인" class="btn btn-warning btn-sm"></td>
			</tr>
		</table>
		<a href="memberJoinForm.do" class="btn btn-info btn-sm">회원가입</a> <a href="mainForm.do" class="btn btn-danger btn-sm">HOME</a>
	</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>