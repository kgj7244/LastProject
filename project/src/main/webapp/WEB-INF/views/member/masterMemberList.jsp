<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.text-warning {
	margin-top: 50px;
}
td>a, #d {
color:gray;
font-weight: bold;
text-decoration:none !important;}
</style>
<script type="text/javascript">
function del() {
	var con = confirm("정말 삭제하시겠습니까?");
	if (con)
		location.href = "masterMemberDelete.do?member_id=${member.member_id }&member_del=${member.member_del}";
	else {
		alert("삭제가 취소되었습니다");
		return;
	}
}
</script>
</head>
<body>
	<%@ include file="../mainTop.jsp"%>
	<%@ include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<h1 class="text-warning">
			<b>회원 관리</b>
		</h1>
		<p />
		<!-- 검색 -->
		<form action="masterMemberList.do" class="form-inline pull-right">
			<!-- <input type="hidden" name="pageNum" value="1">  -->
			<select name="search" class="form-control">
				<c:forTokens var="sh" items="member_id,member_name" delims=","
					varStatus="i">
					<c:if test="${sh == member.search }">
						<option value="${sh }" selected="selected">${tit[i.index] }</option>
					</c:if>
					<c:if test="${sh != member.search }">
						<option value="${sh }">${tit[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>	&nbsp;	&nbsp;<input type="text" name="keyword" class="form-control" value="${member.keyword }">
				&nbsp;	&nbsp;<button type="submit" class="btn btn-outline-warning btn-lg">
				<b>SEARCH</b>
			</button>
		</form>
		<table class="table table-striped">
			<tr>
				<td align="center"><b>가입일</b></td>
				<td align="center"><b>아이디</b></td>
				<td align="center"><b>이름</b></td>
				<td align="center"><b>성별</b></td>
				<td align="center"><b>생년월일</b></td>
				<td align="center"><b>이메일</b></td>
				<td align="center"><b>전화번호</b></td>
				<td align="center"><b>주소</b></td>
				<td align="center"><b>탈퇴여부</b></td>
				<td align="center"><b>수정</b></td>
				<td align="center"><b>삭제</b></td>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="6" align="center"><b>회원이 없습니다</b></th>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="member" items="${list }">
					<tr>
						<td align="center">${member.member_date}</td>
						<td align="center">${member.member_id }</td>
						<td align="center">${member.member_name }</td>
						<td align="center">${member.member_gender}</td>
						<td align="center">${member.member_birth }</td>
						<td align="center">${member.member_email }</td>
						<td align="center">${member.member_number }</td>
						<td align="center">${member.member_addr }</td>
						<td align="center">${member.member_del }</td>
						<td align="center"><a
							href="masterMemberUpdateForm.do?member_id=${member.member_id }">수정</a></td>
						<td align="center"><a onclick="del()" id="d">삭제</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>