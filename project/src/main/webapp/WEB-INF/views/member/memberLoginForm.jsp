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
	<form action="memberLogin.do" method="post">
		<table class="table table-bordered">
			<tr>
				<td>ID</td>
				<td><input type="text" name="member_id"></td>
			</tr>
			<tr>
				<td>PassWord</td>
				<td><input type="password" name="member_password"></td>
			</tr>
			<tr>
				<th colspan="2" align="center"><input type="submit" value="확인"></th>
			</tr>
			<tr>
				<td colspan="2" align="center"><a href="memberJoinForm.do">- 회원가입하러 가기 - </a></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>