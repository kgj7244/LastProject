<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del() {
		var con = confirm=("정말 탈퇴하시겠습니까?");
		if (con)
			location.href="memberDelete.do";
		else {
			alert("탈퇴가 취소되었습니다");
			return;
		}
	}
</script>
</head>
<body>
<div class="container" align="center">
	<h3>${member.member_id }님 환영합니다</h3>
	<table class="table table-striped">
		<tr>
			<td><a href="memberView.do" class="btn btn-default">회원정보조회</a></td>
		</tr>
		<tr>
			<td><a href="memberUpdateForm.do" class="btn btn-default">회원정보수정</a></td>
		</tr>
		<tr>
			<td><a href="memberTicket.do" class="btn btn-default">티켓예매내역조회</a></td>
		</tr>
		<tr>
			<td><a href="memberStore.do" class="btn btn-default">스토어주문조회</a></td>
		</tr>
		<tr>
			<td><a onclick="del()" class="btn btn-default">회원탈퇴</a></td>
		</tr>
	</table>
	<a href="mainForm.do" class="btn btn-info btn-sm">HOME</a> <a href="memberLogout.do" class="btn btn-danger btn-sm">로그아웃</a>
</div>
</body>
</html>