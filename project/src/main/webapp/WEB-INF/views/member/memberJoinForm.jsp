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
			frm5.member_password2.value="";
			return false;
		}
		if(frm5.member_password.value.length < 8 || frm5.member_password.value.length > 16) {
			 alert("비밀번호를 8~16자로 입력해주세요");
			 frm5.member_password.focus();	
			 frm5.member_password.value="";
			 return false;
		}
		 if(frm5.member_id.value.indexOf(" ") >= 0){
			 alert("아이디에 공백을 사용할 수 없습니다.");
			 frm5.member_id.focus();
			 frm5.member_id.select();
			 return false;
		 }
		// 파이썬 11장 정규식
		// /^: 시작,  $/: 끝, []: 속에 글자 중에 하나
		// .*(?=.{4,8}) 점을 포함한 한글자 이상을 사용하는 4~8이내
		// (?=.*[0-9]) 숫자 하나는 포함
		// (?=.*[a-zA-Z]) 소문자/대문자 구별없이 한글자 이상
		// (?=.*[@!#$*()_&]) []속의 글자(특수문자) 하나는 있어야한다
		var reg_id = 
			 /^.*(?=.{4,8})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; 
		if(!reg_id.test(frm5.member_id.value)) { 
			alert("대소문자 구별없이 숫자를 포함하여 4-8자로 입력해주세요"); 
			frm5.member_id.focus(); 
			return false;
		}
		return true;
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
					<td><input type="text" name="member_id" autofocus="autofocus" required="required"
						class="form-control" placeholder="대소문자 구별없이 숫자를 포함하여 4-8자 입력해주세요 ">
						<input type="button" class="btn btn-outline-warning" onclick="idChk()"
						value="중복체크"><span id="disp" class="err"></span>
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
							class="btn btn-outline-warning btn-lg">
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