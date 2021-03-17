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
	<%@ include file="../mainTop.jsp"%>
	<%@ include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<form action="masterMemberUpdate.do" method="post" name="frm"
			onsubmit="return chk()">
			<input type="hidden" name="member_id" value="${member.member_id}">
			<input type="hidden" name="member_password"
				value="${member.member_password}">
			<table class="table table-bordered">
							<tr>
					<td colspan="6" align="center"><button type="button"
							class="btn btn-warning disabled btn-block btn-sm" id="t">
							<h2>
								<b>[관리자] 회원 정보 수정</b>
							</h2>
						</button></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${member.member_id }</td>
				</tr>
				<tr>
					<th>암호</th>
					<td>${member.member_password }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="member_name" required="required"
						value="${member.member_name }"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><c:forTokens var="g" items="남성,여성" delims=",">
							<c:if test="${g == member.member_gender}">
								<label for="g1">${g}</label>
								<input type="radio" name="member_gender" id="g1" value="${g}"
									checked="checked">
							</c:if>
							<c:if test="${g != member.member_gender}">
								<label for="g1">${g}</label>
								<input type="radio" name="member_gender" id="g1" value="${g}">
							</c:if>
						</c:forTokens></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="member_birth" required="required"
						value="${member.member_birth }"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="member_email"
						required="required" value="${member.member_email }"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="member_number"
						required="required" value="${member.member_number }"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="member_addr" required="required"
						value="${member.member_addr }"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-warning btn-lg">
							<b>UPDATE</b>
						</button>
						<button type="reset" class="btn btn-outline-warning btn-lg">
							<b>CANCLE</b>
						</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>