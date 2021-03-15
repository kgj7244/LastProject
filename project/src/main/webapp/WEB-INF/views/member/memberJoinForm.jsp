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
	padding-top: 15px;
	padding-bottom: 15px;
}
</style>
<script type="text/javascript">
	function chk() {
		if (frm.member_password.value != frm.member_password2.value) {
			alert("암호와 암호확인이 다릅니다");
			frm.member_password.focus();
			frm.member_password.value("");
			return false;
		}
	}
	function idChk() {
		if (!frm.member_id.value) {
			alert("아이디 입력 후 중복체크 하세요");
			frm.member_id.focus();
			return false;
		}
		$.post("idChk.do", "member_id=" + frm.member_id.value, function(data) {
			$('#disp').html(data);
		});
	}
</script>
</head>
<body>
	<%@ include file="../mainTop.jsp"%>
	<%@ include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<form action="memberJoin.do" method="post" name="frm"
			onsubmit="return chk()">
			<table class="table">
				<tr>
					<td colspan="2" align="center"><button type="button"
							class="btn btn-warning disabled btn-block btn-sm" id="t">
							<h2>
								<b>JOIN</b>
							</h2>
						</button></td>
				</tr>
				<tr>
					<td align="center">아이디</td>
					<td><input type="text" name="member_id"
						required="required" autofocus="autofocus" class="form-control">
						<button type="button" class="btn btn-outline-warning"
							onclick="idChk()">중복체크</button>
						<div id="disp" class="err"></div>
					</td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="member_password"
						required="required" class="form-control"></td>
				</tr>
				<tr>
					<td align="center">비밀번호 확인</td>
					<td><input type="password" name="member_password2"
						required="required" class="form-control"></td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td><input type="text" name="member_name" required="required"
						class="form-control"></td>
				</tr>
				<tr>
					<td align="center">성별</td>
					<td><label for="g1"> 남성 &nbsp;</label>
					<input type="radio" name="member_gender" value="남성"
						checked="checked"> <label for="g1">	&nbsp; 여성 	&nbsp;</label><input type="radio"
						name="member_gender" value="여성"></td>
				</tr>
				<tr>
					<td align="center">생년월일</td>
					<td><input type="date" name="member_birth" required="required"
						class="form-control"></td>
				</tr>
				<tr>
					<td align="center">이메일</td>
					<td><input type="email" name="member_email"
						required="required" class="form-control"></td>
				</tr>
				<tr>
					<td align="center">전화번호</td>
					<td><input type="tel" name="member_number" required="required"
						placeholder="휴대폰번호를 입력하세요" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
						class="form-control"></td>
				</tr>
				<tr>
					<td align="center">주소</td>
					<td><input type="text" name="member_addr" required="required"
						class="form-control"></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><button id="c" type="submit"
							class="btn btn-outline-warning btn-lg">
							<b>Join</b>
						</button></td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>