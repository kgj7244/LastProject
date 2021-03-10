<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if(frm.member_password.value != frm.member_password2.value) {
			alert("암호와 암호확인이 다릅니다");
			frm.member_password.focus();
			frm.member_password.value("");
			return false;
		}
	}
</script>
</head>
<body>
<%@ include file="../mainTop.jsp" %>
<%@ include file="../mainNav.jsp" %>
<div class="container" align="center">
	<h3>회원 정보 수정</h3>
	<form action="memberUpdate.do" method="post" name="frm" onsubmit="return chk()">
	<input type="hidden" name="member_id" value="${member.member_id}">
		<table class="table table-bordered">
			<tr>
				<th>아이디</th>
				<td>${member.member_id }</td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="member_password" required="required"></td>
			</tr>
			<tr>
				<th>암호확인</th>
				<td><input type="password" name="member_password2" required="required" ></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="member_name" required="required" value="${member.member_name }"></td>
			</tr>
			<tr>
				<th>성별</th><td>
				<c:forTokens var="g"  items="남성,여성" delims=",">
					<c:if test="${g == member.member_gender}">
						<label for="g1">${g}</label><input type="radio" name="member_gender" 
						id="g1" value="${g}" checked="checked">
					</c:if>
					<c:if test="${g != member.member_gender}">
						<label for="g1">${g}</label><input type="radio" name="member_gender" 
						id="g1" value="${g}" >
					</c:if>
				</c:forTokens></td>
			</tr>
			
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="member_birth" required="required" value="${member.member_birth }"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="member_email" required="required" value="${member.member_email }" ></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="member_number" required="required" value="${member.member_number }" ></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="member_addr" required="required" value="${member.member_addr }"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정" class="btn btn-default btn-sm"><input type="reset" value="취소" class="btn btn-default btn-sm"></td>
			</tr>
		</table>
		<a href="mainForm.do" class="btn btn-info btn-sm">HOME</a>
	</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>