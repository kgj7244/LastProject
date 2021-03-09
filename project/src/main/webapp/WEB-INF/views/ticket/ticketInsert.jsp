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
	<c:if test="${bank >0}">
		<h2>예매성공</h2>
		<table class="table table-bordered">
			<tr>
				<td colspan="2">
					<img src="resources/images/m_poster/${movie.m_poster}" height="100px;" width="80px;">
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${movie.m_title}
					<c:choose>
						<c:when test="${movie.m_rank == '전 연령'}">
							<img alt="안보여" src="resources/images/m_rank/전체.png" height="30px" width="30px" >
						</c:when>								
						<c:when test="${movie.m_rank == '12세'}">
							<img alt="안보여" src="resources/images/m_rank/12세.png" height="30px" width="30px">
						</c:when>									
						<c:when test="${movie.m_rank == '15세'}">
							<img alt="안보여" src="resources/images/m_rank/15세.png" height="30px" width="30px">
						</c:when>									
						<c:when test="${movie.m_rank == '19세'}">
							<img alt="안보여" src="resources/images/m_rank/청불.png" height="30px" width="30px">
						</c:when>							
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>보는곳 : </td>
				<td>${theater.t_loc}(${theater.t_title}) / ${movieTheater.mt_name}</td>
			</tr>
			<tr>
				<td>시간</td>
				<td>${screen.sc_date} | ${screen.sc_start}~${screen.sc_end}</td>
			</tr>
			<tr>
				<td>성인(${adult_ticket}개)</td>
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
				<td>청소년(${youth_ticket}개)</td>
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
				<td>뭐 대충 할인금액</td>
			</tr>
			<tr>
				<td>최종결제금액</td>
				<td>${totalPrice1}</td>
			</tr>
			<tr>
				<td colspan="2"><a href="mainForm.do" class="btn btn-success btn-sm">메인으로</a></td>
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