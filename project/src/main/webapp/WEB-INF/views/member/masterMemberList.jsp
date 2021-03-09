<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../mainTop.jsp"%>
	<%@ include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<h2 class="text-primary">회원관리</h2>
		<p />
		<!-- 검색 -->
		<form action="masterMemberList.do">
			<!-- <input type="hidden" name="pageNum" value="1">  -->
			<select name="search">
				<c:forTokens var="sh" items="member_id,member_name" delims=","
					varStatus="i">
					<c:if test="${sh == member.search }">
						<option value="${sh }" selected="selected">${tit[i.index] }</option>
					</c:if>
					<c:if test="${sh != member.search }">
						<option value="${sh }">${tit[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select> <input type="text" name="keyword" value="${member.keyword }">
			<input type="submit" value="검색">
		</form>
		<table class="table table-striped">
			<tr>
				<th>가입일</th>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>탈퇴여부</th>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<th colspan="6">회원이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="member" items="${list }">
					<tr>
						<td>${member.member_date}</td>
						<td>${member.member_id }</td>
						<td>${member.member_name }</td>
						<td>${member.member_gender}</td>
						<td>${member.member_birth }</td>
						<td>${member.member_email }</td>
						<td>${member.member_number }</td>
						<td>${member.member_addr }</td>
						<td>${member.member_del }</td>
						<td><a href="masterMemberUpdateForm.do?member_id=${member.member_id }">수정</a></td>
						<td><a href="masterMemberDelete.do?member_id=${member.member_id }&member_del=${member.member_del}">삭제</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div align="center">
			<a href="mainForm.do" class="btn btn-warning">HOME</a>
		</div>
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>