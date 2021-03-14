<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; font-size: 30px; margin-top: 30px;">예매 조회</td>
		</tr>
	</table>
	<hr>
	<table class="table table-bordered table-hover" id="tableLook">
		<tr>
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;" width="10%">예매번호</td>
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;" width="20%">좌석번호</td>
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;" width="10%">성인예매수</td>
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;" width="10%">청소년예매수</td>
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;" width="20%">예매일</td>
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;" width="20%">예매아이디</td>
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;" width="10%">보기</td>
		</tr>
		<tr>
			<c:if test="${empty ticket}"> <!-- 예매 한게 없으면 -->
				<td colspan="7" align="center">현재 예매한 티켓이 없습니다.</td>
			</c:if>
			<c:if test="${not empty ticket}"> <!-- 예매가 있으면 -->
				<c:forEach var="t" items="${ticket}">
					<tr>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;">${t.t_ordernum}</td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;">${t.t_state}</td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;">${t.t_adult}</td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;">${t.t_teen}</td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;"><fmt:formatDate value="${t.t_date}" pattern="yyyy.MM.dd"/></td>
						<td align="center" style="color:#8c8b9b;vertical-align: middle;">${t.t_id}</td>
						<td align="center"><input type="button" class="btn btn-warning" value="보기" onclick='location.href="memberTicketView.do?sc_num=${t.sc_num}&t_state=${t.t_state}&t_ordernum=${t.t_ordernum}"'></td>
					</tr>
				</c:forEach>
			</c:if>
		</tr>
		<tr>
			<td align="center" colspan="7"><input type="button" value="목록으로" onclick="location.href='mypage.do'" class="btn btn-warning"></td>
		</tr>
	</table>
	
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>