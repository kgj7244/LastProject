<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if(frm.b_password.value != frm.b_password2.value) {
			alert("암호가 다릅니다");
			frm.b_password.focus();
			frm.b_password.value = "";
			return false;
		}
	}
</script>
</head>
<body>
<%@ include file="../mainTop.jsp" %>
<%@ include file="../mainNav.jsp" %>
<div class="container" align="center">
	<h3 class="text-primary">비밀글 암호 입력</h3>
	<form action="boardView.do?b_num=${board.b_num }&pageNum=${pb.currentPage}" method="post" name="frm" onsubmit="return chk()">
		<input type="hidden" name="b_password2" value="${board.b_password }">
		<table class="table table-bordered">
			<tr>
				<td>암호</td>
				<td><input type="password" name="b_password" required="required" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인" class="btn btn-warning btn-sm"></td>
			</tr>
		</table>
		<a href="boardList.do?pageNum=${pageNum}" class="btn btn-info btn-sm">목록</a> <a href="mainForm.do" class="btn btn-danger btn-sm">HOME</a>
	</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>