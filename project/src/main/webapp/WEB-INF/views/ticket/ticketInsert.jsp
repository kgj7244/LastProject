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

<div class="container" align="center">
	<c:if test="${bank >0}">
		<table class="table table-hover" style="margin-top: 30px;">
			<tr>
				<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; font-size: 30px; margin-top: 30px;">예매성공</td>
			</tr>
		</table>
		<hr>
		<table class="table table-bordered">
			<tr>
				<td rowspan="7" align="center" width="30%">
					<img src="resources/images/m_poster/${movie.m_poster}" height="300px;" width="200px;">
				</td>
				<td width="20%">제목</td>
				<td width="50%">
					<c:choose>
						<c:when test="${movie.m_rank == '전 연령'}">
							<img alt="안보여" src="resources/images/m_rank/전체.png" height="20px" width="20px" >
						</c:when>								
						<c:when test="${movie.m_rank == '12세'}">
							<img alt="안보여" src="resources/images/m_rank/12세.png" height="20px" width="20px">
						</c:when>									
						<c:when test="${movie.m_rank == '15세'}">
							<img alt="안보여" src="resources/images/m_rank/15세.png" height="20px" width="20px">
						</c:when>									
						<c:when test="${movie.m_rank == '19세'}">
							<img alt="안보여" src="resources/images/m_rank/청불.png" height="20px" width="20px">
						</c:when>							
					</c:choose>
					${movie.m_title}
				</td>
			</tr>
			<tr>
				<td>보는곳</td>
				<td>${theater.t_loc}(${theater.t_title}) / ${movieTheater.mt_name}</td>
			</tr>
			<tr>
				<td>시간</td>
				<td>${screen.sc_date} | ${screen.sc_start}~${screen.sc_end}</td>
			</tr>
			<tr>
				<td>성인(${adult_ticket}명)</td>
				<td>
					<c:if test="${adult_ticket>0}">
						<fmt:formatNumber value="${adult_ticket * 11000}" pattern="#,000"></fmt:formatNumber>원
					</c:if>
					<c:if test="${adult_ticket==0}">
						0원
					</c:if>
				</td>
			</tr>
			<tr>
				<td>청소년(${youth_ticket}명)</td>
				<td>
					<c:if test="${youth_ticket>0}">
						<fmt:formatNumber value="${youth_ticket * 8000}" pattern="#,000"></fmt:formatNumber>원
					</c:if>
					<c:if test="${youth_ticket==0}">
						0원
					</c:if>
				</td>
			</tr>
			<tr>
				<td>할인금액</td>
				<td>
					<c:if test="${t_sale1 ==0}">0원</c:if>
					<c:if test="${t_sale1 >0}">- ${t_sale1}원</c:if>
				</td>
			</tr>
			<tr>
				<td>최종결제금액</td>
				<td>${totalPrice1}원</td>
			</tr>
			<tr>
				<td colspan="3" align="center"><a href="mainForm.do" class="btn btn-warning btn-lg">메인으로</a></td>
			</tr>
		</table>
	</c:if>
	<c:if test="${bank ==0}">
		<table>
			<tr>
				<td>오류</td>
			</tr>
		</table>
	</c:if>
</div>

<%@ include file="../mainFloor.jsp" %>
</body>
</html>