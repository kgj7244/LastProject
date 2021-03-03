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
	function idChk() {
		if(!frm.member_id.value){
			alert("아이디 입력 후 중복체크 하세요");
			frm.member_id.focus();
			return false;
		}
		$.post("idChk.do", "member_id="+frm.member_id.value, function(data){
			$('#disp').html(data);
		});
	}
</script>
</head>
<body>
<%@ include file="../mainTop.jsp" %>
<%@ include file="../mainNav.jsp" %>
<div class="container" align="center">
	<h3>회원 가입</h3>
	<form action="memberJoin.do" method="post" name="frm" onsubmit="return chk()">
		<table class="table table-bordered">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="member_id" required="required" autofocus="autofocus">
					<input type="button" onclick="idChk()" class="btn btn-info btn-sm" value="중복체크">
					<div id="disp" class="err"></div>
				</td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="member_password" required="required" ></td>
			</tr>
			<tr>
				<th>암호확인</th>
				<td><input type="password" name="member_password2" required="required" ></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="member_name" required="required"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="member_gender" value="남성" checked="checked">남성 <input type="radio" name="member_gender" value="여성">여성</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="member_birth" required="required" ></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="member_email" required="required" ></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="tel" name="member_number" required="required" placeholder="휴대폰번호를 입력하세요" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="member_addr" required="required" ></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="가입" class="btn btn-danger btn-sm"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>