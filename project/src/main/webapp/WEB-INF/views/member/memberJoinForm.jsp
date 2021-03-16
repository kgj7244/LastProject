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
		if (frm5.member_password.value != frm5.member_password2.value) {
			alert("비밀번호가 다릅니다");
			frm5.member_password.focus();
			frm5.member_password.value("");
			return false;
		}
		if(frm5.member_password.value.length < 8 || frm5.member_password.value.length > 16) {
			 alert("비밀번호를 8~16자로 입력해주세요");
			 frm5.member_password.focus();	
			 frm5.member_password.value="";
			 return false;
		}
	}
	function idChk() {
		if (!frm5.member_id.value) {
			alert("아이디 입력 후 중복체크 하세요");
			frm5.member_id.focus();
			return false;
		}
		$.post("idChk.do", "member_id=" + frm5.member_id.value, function(data) {
			$('#disp').html(data);
		});
	}
/* 	function chkId() { //공백여부
		 if(frm5.member_id.value.indexOf(" ") >= 0){
			 alert("아이디에 공백을 사용할 수 없습니다.");
			 frm5.member_id.focus();
			 frm5.member_id.select();
			 return false;
		 }
		 // 아이디 4~12 글자 입력
		 if(frm5.member_id.value.length < 4 || frm5.member_id.value.length > 12){
			 alert("아이디를 4~12자까지 입력해주세요.");
			 frm5.member_id.focus();
			 frm5.member_id.select();
		 	return false;
		 }
		 // 영문(소문자, 숫자만 허용)
		 for(var i = 0; i<frm5.member_id.value.length; i++) {
			 ch = frm5.member_id.value.charAt(i);
			 if(!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')){
			 alert("소문자, 숫자로만 입력해주세요");
			 frm5.member_id.focus();
			 frm5.member_id.select();
			 return false;
		 }
	} */
</script>
</head>
<body>
	<%@ include file="../mainTop.jsp"%>
	<%@ include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<form action="memberJoin.do" method="post" name="frm5"
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
					<td><input type="text" name="member_id" autofocus="autofocus"
						class="form-control" placeholder="소문자 또는 숫자로 4-12자 입력해주세요 " onsubmit="chkId()">
						<button type="button" class="btn btn-outline-warning"
							onclick="idChk()">중복체크</button> <span id="disp" class="err"></span>
					</td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="member_password"
						required="required" class="form-control"
						placeholder="비밀번호는 8-12자로 입력해주세요"></td>
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
					<td><label for="g1"> 남성 &nbsp;</label> <input type="radio"
						name="member_gender" value="남성" checked="checked"> <label
						for="g1"> &nbsp; 여성 &nbsp;</label><input type="radio"
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
						placeholder="휴대폰번호를 입력해주세요" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
						class="form-control"></td>
				</tr>
				<tr>
					<td align="center">주소</td>
					<td><input type="text" name="member_addr" required="required"
						class="form-control"></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><button id="c" type="submit"
							class="btn btn-outline-warning btn-lg" onclick="chkPwId()">
							<b>JOIN</b>
						</button></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><button
							class="btn btn-outline-warning btn-lg"
							onclick="location.href='memberLoginForm.do'">
							<b>LOGIN</b>
						</button></td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>