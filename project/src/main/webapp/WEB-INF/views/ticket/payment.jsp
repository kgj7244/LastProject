<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
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
	<form>
		<table class="table table-bordered">
			<tr>
				<td>관람권 및 할인 적용</td>
				<td>
					<table class="table table-bordered">
						<tr>
							<td rowspan="3">
								<img alt="이미지 뜨는 창입니다." src="resources/images/m_poster/${movie.m_poster}" height="100px;" width="80px;">
							</td>
							<td>${movie.m_title}
								<c:choose>
									<c:when test="${movie.m_rank == '전체'}">
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
								</c:choose></td>
						</tr>
						<tr>
							<td>${theater.t_loc}(${theater.t_title}) / ${movieTheater.mt_num}관</td>
						</tr>
						<tr>
							<td>${screen.sc_date} | ${screen.sc_start}~${screen.sc_end}</td>
						</tr>
						<tr>
							<td colspan="2">
								<table>
									<tr>
										
										<td>성인(${adult_ticket}개)</td>
										<td><fmt:formatNumber value="${adult_ticket * 11000}" pattern="#,000"></fmt:formatNumber>원</td>
									</tr>
									<tr>
										<td>청소년(${youth_ticket}개)</td>
										<td><fmt:formatNumber value="${youth_ticket * 8000}" pattern="#,000"></fmt:formatNumber>원</td>
									</tr>
									<tr>
										<td>금액</td>
										<td><fmt:formatNumber value="${totalPrice}" pattern="#,000"></fmt:formatNumber>원</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>최종결제금액</td>
							<td><fmt:formatNumber value="${totalPrice}" pattern="#,000"></fmt:formatNumber>원</td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="결제"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>