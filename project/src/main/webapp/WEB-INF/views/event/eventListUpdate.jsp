<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
<div class="container" align="center">
	<h2>이벤트 수정 및 삭제</h2>
	<form>
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<th>이벤트제목</th>
				<th>이벤트종류</th>
				<th>할인금액</th>
				<th>삭제여부</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:if test="${empty event_overList}">
				<td colspan="6" align="center">이벤트 이용하는 사람이 없습니다.</td>
			</c:if>	
			<c:if test="${!empty event_overList}">		
				<c:forEach var="eo" items="${event_overList}">
					<tr>
						<td>${eo.eo_num}</td>
						<td>${eo.member_id}</td>
						<td>${eo.eo_state}</td>
						<td>${eo.e_num}</td>
						<td><a href="Issued.do?eo_num=${eo.eo_num}" class="btn btn-info">발급</a></td>
						<td><a href="cancel.do?eo_num=${eo.eo_num}" class="btn btn-danger">취소</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>