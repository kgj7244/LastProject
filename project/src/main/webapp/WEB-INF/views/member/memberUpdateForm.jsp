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
<script type="text/javascript">
	function chk() {
		if (frm.member_password.value != frm.member_password2.value) {
			alert("암호와 암호확인이 다릅니다");
			frm.member_password.focus();
			frm.member_password.value="";
			return false;
		}
	}
</script>
</head>
<body>
	<%@ include file="../mainTop.jsp"%>
	<%@ include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<form action="memberUpdate.do" method="post" name="frm"
			onsubmit="return chk()">
			<input type="hidden" name="member_id" value="${member.member_id}">
			<table class="table table-bordered">
				<tr>
					<td colspan="6" align="center"><button type="button"
							class="btn btn-warning disabled btn-block btn-sm" id="t">
							<h2>
								<b>회원 정보 수정</b>
							</h2>
						</button></td>
				</tr>
				<tr>
					<td align="center"><b>아이디</b></td>
					<td align="center">${member.member_id }</td>
				</tr>
				<tr>
					<td align="center"><b>비밀번호</b></td>
					<td><input type="password" name="member_password"
						required="required" class="form-control"></td>
				</tr>
				<tr>
					<td align="center"><b>비밀번호 확인</b></td>
					<td><input type="password" name="member_password2"
						required="required" class="form-control"></td>
				</tr>
				<tr>
					<td align="center"><b>이름</b></td>
					<td><input type="text" name="member_name" required="required"
						value="${member.member_name }" class="form-control"></td>
				</tr>
				<tr>
					<td align="center"><b>성별</b></td>
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
					<td align="center"><b>생년월일</b></td>
					<td><input type="date" name="member_birth" required="required"
						value="${member.member_birth }" class="form-control"></td>
				</tr>
				<tr>
					<td align="center"><b>이메일</b></td>
					<td><input type="email" name="member_email"
						required="required" value="${member.member_email }" class="form-control"></td>
				</tr>
				<tr>
					<td align="center"><b>전화번호</b></td>
					<td><input type="text" name="member_number"
						required="required" value="${member.member_number }" class="form-control"></td>
				</tr>
				<tr>
					<td align="center"><b>주소</b></td>
					<td><input type="text" name="member_addr" required="required"
						value="${member.member_addr }" class="form-control"></td>
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