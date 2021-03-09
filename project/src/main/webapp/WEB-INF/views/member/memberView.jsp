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
<%@ include file="../mainTop.jsp" %>
<%@ include file="../mainNav.jsp" %>
	<div class="container" align="center">
		<h3>회원 정보</h3>
		<table class="table table-bordered">
			<tr>
				<th>아이디</th>
				<td>${member.member_id }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${member.member_name }</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${member.member_gender }</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${member.member_birth }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${member.member_email }</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${member.member_number }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${member.member_addr}</td>
			</tr>
		</table>
		<a href="mypage.do" class="btn btn-success btn-sm">마이페이지</a> <a href="mainForm.do" class="btn btn-info btn-sm">HOME</a>
	</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>