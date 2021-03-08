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
	<h2>예매번호 ${t_ordernum}번 상세보기</h2>
	<form action="memberTicketRefund.do" method="post">
		<input type="hidden" name="t_ordernum" value="${t_ordernum}">
		<input type="hidden" name="sc_num" value="${screen.sc_num}">
		<input type="hidden" name="t_state" value="${t_state}">
		<table class="table table-bordered">
			<tr>
				<td>영화사진</td>
				<td><img alt="보여줄 이미지가 없습니다." src="${path}/resources/images/m_poster/${movie.m_poster}" height="100px;" width="80px;"></td>
				<td>영화제목</td>
				<td>
					<c:choose>
						<c:when test="${movie.m_rank == '전 연령'}">
							<img src="resources/images/m_rank/전체.png" height="25px" width="25px" >
						</c:when>								
						<c:when test="${movie.m_rank == '12세'}">
							<img src="resources/images/m_rank/12세.png" height="25px" width="25px">
						</c:when>									
						<c:when test="${movie.m_rank == '15세'}">
							<img src="resources/images/m_rank/15세.png" height="25px" width="25px">
						</c:when>									
						<c:when test="${movie.m_rank == '청불'}">
							<img src="resources/images/m_rank/청불.png" height="25px" width="25px">
						</c:when>							
					</c:choose>
					${movie.m_title}
				</td>
			</tr>
			<tr>
				<td>극장명/지역/상영관</td>
				<td>${theater.t_title}(${theater.t_loc}) / ${movieTheater.mt_name}</td>
				<td>상영일/시작/종료</td>
				<td>${screen.sc_date} / ${screen.sc_start} ~ ${screen.sc_end}</td>
			</tr>
			<tr>
				<td>예매하신 좌석</td>
				<td>
					<c:forEach var="s" items="${seatList}">
						${s}&nbsp;
					</c:forEach>
				</td>
				<td>금액</td>
				<td>금...금액은 잘돌려줄꺼에요</td>
			</tr>
			<tr>
				<td colspan="4"><input type="button" value="메인으로 이동" onclick='location.href="memberTicket.do"'><input type="submit" value="환불하기"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>