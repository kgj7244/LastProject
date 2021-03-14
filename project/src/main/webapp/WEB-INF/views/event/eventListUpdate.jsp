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
<style type="text/css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
</style>
<style type="text/css">
	#container1{
		height: 750px;
	}
</style>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
<div class="container" align="center" id="container1">
	<table class="table table-hover" style="margin-top: 30px;">
		<tr>
			<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; font-size: 30px; margin-top: 30px;">이벤트 수정 및 삭제</td>
		</tr>
	</table>
	<form>
		<table class="table table-bordered">
			<tr>
				<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">번호</td>
				<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">이벤트제목</td>
				<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">이벤트종류</td>
				<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">할인금액</td>
				<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">삭제여부</td>
				<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">수정</td>
				<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;">삭제</td>
			</tr>
			<c:if test="${empty event}">
				<td colspan="7" align="center">이벤트가 없습니다.</td>
			</c:if>	
			<c:if test="${!empty event}">		
				<c:forEach var="e" items="${event}">
					<tr>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;">${e.e_num}</td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;">${e.e_title}</td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;">${e.e_state}</td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;">${e.e_sale}</td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;">${e.e_del}</td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;"><a href="eventUpdateForm.do?e_num=${e.e_num}" class="btn btn-warning">수정</a></td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;"><a href="eventDelete.do?e_num=${e.e_num}" class="btn btn-danger" onclick="del()">삭제</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>