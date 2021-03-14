<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#b {padding-top: 15px; padding-bottom: 15px;margin-top:60px; margin-bottom:15px;}
</style>
</head>
<body>
	<%@ include file="../mainTop.jsp"%>
	<%@ include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<button id="b" type="button"
			class="btn btn-warning disabled btn-block btn-sm">
			<h2><b>LOG-IN</b></h2>
		</button>
		<form action="memberLogin.do" method="post">
			<table class="table table-bordered">
				<tr>
					<td align="center"><b>ID</b></td>
					<td><input type="text" class="form-control" name="member_id"
						id="exampleInputId1"></td>
				</tr>
				<tr>
					<td align="center"><b>Password</b></td>
					<td><input type="password" class="form-control"
						name="member_password"></td>
				</tr>
				<!-- 				<td>아이디</td>
				<td><input type="text" name="member_id" required="required" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="member_password"></td>
			</tr>-->
				<tr>
					<td colspan="2" align="center"><button type="submit"
							class="btn btn-outline-warning btn-lg"><b>Login</b></button></td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>