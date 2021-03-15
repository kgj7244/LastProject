<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table {
	margin-top: 60px;
}
#t {
	padding-top: 12px;
	padding-bottom: 12px;
}
</style>
</head>
<body>
<%@ include file="../mainTop.jsp" %>
<%@ include file="../mainNav.jsp" %>
	<div class="container" align="center">
		<table class="table table-bordered">
					<tr>
				<td colspan="4" align="center"><button type="button"
						class="btn btn-warning disabled btn-block" id="t">
						<h2><b>회원 정보</b></h2>
					</button></td>
			</tr>
			<tr>
				<td align="center"><b>아이디</b></td>
				<td align="center">${member.member_id }</td>
			</tr>
			<tr>
				<td align="center"><b>이름</b></td>
				<td align="center">${member.member_name }</td>
			</tr>
			<tr>
				<td align="center"><b>성별</b></td>
				<td align="center">${member.member_gender }</td>
			</tr>
			<tr>
				<td align="center"><b>생년월일</b></td>
				<td align="center">${member.member_birth }</td>
			</tr>
			<tr>
				<td align="center"><b>이메일</b></td>
				<td align="center">${member.member_email }</td>
			</tr>
			<tr>
				<td align="center"><b>주소</b></td>
				<td align="center">${member.member_addr}</td>
			</tr>
			<tr>
				<td align="center"><b>전화번호</b></td>
				<td align="center">${member.member_number }</td>
			</tr>
		</table>
	</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>