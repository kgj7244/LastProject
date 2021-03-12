<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del() {
		var con = confirm("정말 삭제하시겠습니까?");
		if (con)
			location.href = "eventListUpdate.do";
		else {
			alert("삭제가 취소되었습니다");
			return;
		}
	}
</script>
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
			<c:if test="${empty event}">
				<td colspan="7" align="center">이벤트가 없습니다.</td>
			</c:if>	
			<c:if test="${!empty event}">		
				<c:forEach var="e" items="${event}">
					<tr>
						<td>${e.e_num}</td>
						<td>${e.e_title}</td>
						<td>${e.e_state}</td>
						<td>${e.e_sale}</td>
						<td>${e.e_del}</td>
						<td><a href="eventUpdateForm.do?e_num=${e.e_num}" class="btn btn-info">수정</a></td>
						<td><a href="eventDelete.do?e_num=${e.e_num}" class="btn btn-danger" onclick="del()">삭제</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>