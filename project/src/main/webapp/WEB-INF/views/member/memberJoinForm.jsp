<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function idChk() {
		if(!frm.member_id.value){
			alert("아이디를 입력하고 중복체크 하세요");
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
	<form action="memberJoin.do" method="post" name="frm">
		<table>
			<tr>
				<td>ID</td>
				<td>
					<input type="text" name="member_id">
					<input type="button" onclick="idChk()" class="btn btn-info btn-sm" value="중복체크">
					<div id="disp" class="err"></div>
				</td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="member_password"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="member_name"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="member_gender" value="m">남<input type="radio" name="member_gender" value="g">여</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="member_birth"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="member_email"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="member_number"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="member_addr"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>