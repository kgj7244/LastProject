<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" align="center">
	<h3>${mem.member_id }님 환영합니다</h3>
	<a href="memberLogout.do" class="btn btn-default btn-sm">로그아웃</a>
	<p>
	<table class="table table-striped">
		<tr>
			<td><a href="memberView.do" class="btn btn-default">회원정보조회</a></td>
		</tr>
		<tr>
			<td><a href="memberUpdateForm.do" class="btn btn-default">회원정보수정</a></td>
		</tr>
		<tr>
			<td><a href="memberOrder.do" class="btn btn-default">주문정보조회</a></td>
		</tr>
		<tr>
			<td><a href="memberDelete.do" class="btn btn-default">회원탈퇴</a></td>
		</tr>
	</table>
	<a href="mainForm.do" class="btn btn-info btn-sm">HOME</a>
</div>
</body>
</html>