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
	<h2>예매 조회</h2>
	<table class="table table-bordered table-hover">
		<tr>
			<td>예매번호</td>
			<td>성인예매수</td>
			<td>청소년예매수</td>
			<td>좌석번호</td>
			<td>예매일</td>
			<td>예매아이디</td>
			<td>보기</td>
		</tr>
		<tr>
			<c:if test="${empty ticket}"> <!-- 예매 한게 없으면 -->
				<td colspan="7">현재 예매한 티켓이 없습니다.</td>
			</c:if>
			<c:if test="${not empty ticket}"> <!-- 예매가 있으면 -->
				<c:forEach var="t" items="${ticket}">
					<tr>
						<td>${t.t_ordernum}</td>
						<td>${t.t_adult}</td>
						<td>${t.t_teen}</td>
						<td>${t.t_state}</td>
						<td>${t.t_date}</td>
						<td>${t.t_id}</td>
						<td><input type="button" value="보기" onclick='location.href="memberTicketView.do?sc_num=${t.sc_num}&t_state=${t.t_state}&t_ordernum=${t.t_ordernum}"'></td>
					</tr>
				</c:forEach>
			</c:if>
		</tr>
	</table>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>