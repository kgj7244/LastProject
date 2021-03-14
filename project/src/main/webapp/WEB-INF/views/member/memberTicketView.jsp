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
			<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; font-size: 30px; margin-top: 30px;">예매번호 ${t_ordernum}번 상세보기</td>
		</tr>
	</table>
	<form action="memberTicketRefund.do" method="post">
		<input type="hidden" name="t_ordernum" value="${t_ordernum}">
		<input type="hidden" name="sc_num" value="${screen.sc_num}">
		<input type="hidden" name="t_state" value="${t_state}">
		<table>
			<tr>
				<td rowspan="4" width="15%"></td>
				<td rowspan="4" width="35%" align="center"><img alt="보여줄 이미지가 없습니다." src="${path}/resources/images/m_poster/${movie.m_poster}" height="200px;" width="150px;"></td>
				<td width="50%" style="vertical-align: middle;">
					<c:choose>
						<c:when test="${movie.m_rank == '전 연령'}">
							<img src="resources/images/m_rank/전체.png" height="20px" width="20px" >
						</c:when>								
						<c:when test="${movie.m_rank == '12세'}">
							<img src="resources/images/m_rank/12세.png" height="20px" width="20px">
						</c:when>									
						<c:when test="${movie.m_rank == '15세'}">
							<img src="resources/images/m_rank/15세.png" height="20px" width="20px">
						</c:when>									
						<c:when test="${movie.m_rank == '청불'}">
							<img src="resources/images/m_rank/청불.png" height="20px" width="20px">
						</c:when>							
					</c:choose>
					${movie.m_title}
				</td>
			</tr>
			<tr>
				<td>${theater.t_title}(${theater.t_loc}) / ${movieTheater.mt_name}</td>
			</tr>
			<tr>
				<td>${screen.sc_date} / ${screen.sc_start} ~ ${screen.sc_end}</td>
			</tr>
			<tr>
				<td>
					좌석 :  
					<c:forEach var="s" items="${seatList}">
						${s}&nbsp;
					</c:forEach>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td colspan="4" align="center"><input type="button" value="메인으로 이동" class="btn btn-info" onclick='location.href="memberTicket.do"'>&nbsp;&nbsp;<input type="submit" class="btn btn-warning" value="환불하기"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>