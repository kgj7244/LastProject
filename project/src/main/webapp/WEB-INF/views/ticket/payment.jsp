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
	<form action="ticketInsert.do" method="post">
		<input type="hidden" name="m_title" value="${movie.m_title}">
		<input type="hidden" name="sc_num" value="${screen.sc_num}">
		<input type="hidden" name="t_title" value="${theater.t_title}">
		<input type="hidden" name="mt_num" value="${movieTheater.mt_num}">
		<input type="hidden" name="adult_ticket" value="${adult_ticket}">
		<input type="hidden" name="youth_ticket" value="${youth_ticket}">
		<input type="hidden" name="totalPrice" value="${totalPrice}">
		<input type="hidden" name="selectList" value="${selectList1}">
		<div align="left">
			<h2>빠른 예매</h2>
		</div>
		<table class="table table-bordered">
			<tr>
				<td width="60%">
					<div>관람권 및 할인 적용</div>
					<div>
						<select class="form-control">
						    <option>포인트/쿠폰</option>
						    <option>2</option>
						    <option>3</option>
						    <option>4</option>
						    <option>5</option>
						</select>
					</div>
					<div>
						<select class="form-control">
						    <option>모바일상품권</option>
						    <option>2</option>
						    <option>3</option>
						    <option>4</option>
						    <option>5</option>
						</select>
					</div>
					<div>
						<select class="form-control">
						    <option>제휴포인트</option>
						    <option>2</option>
						    <option>3</option>
						    <option>4</option>
						    <option>5</option>
						</select>
					</div>
					<div>
						<div>결제수단선택</div>
					</div>
					<table class="table table-bordered">
						<tr>
							<td style="vertical-align:middle;">
								<label for="card"><input type="radio" id="card" name="paymentChk" value="신용카드">신용카드</label> &nbsp;&nbsp;&nbsp;&nbsp;
								<label for="phone"><input type="radio" id="phone" name="paymentChk" value="휴대폰">휴대폰</label> &nbsp;&nbsp;&nbsp;&nbsp;
								<label for="cacao"><input type="radio" id="cacao" name="paymentChk" value="카카오페이">카카오페이</label> &nbsp;&nbsp;&nbsp;&nbsp;
								<label for="payco"><input type="radio" id="payco" name="paymentChk" value="PAYCO">PAYCO</label>
							</td>
						</tr>
						<tr>
							<td>
								카드사 선택 
								<select>
									<option>카드선택
								</select>
							</td>
						</tr>
					</table>
				</td>
				<td width="40%">
					<table border="1" style="background-color: #333333">
						<tr height="150px;">
							<td width="20%" rowspan="3" align="center">
								<img alt="이미지 뜨는 창입니다." src="resources/images/m_poster/${movie.m_poster}" height="200px;" width="150px;">
							</td>
							<td width="5%" style="vertical-align:middle;">
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
							<td width="75%" style="color:white; font-size: 13px; font-weight: bold; vertical-align:middle;">
								${movie.m_title}<p>
								(${movie.m_genre})
							</td>
						</tr>
						<tr>
							<td colspan="2" style="color:white; font-size: 13px; font-weight: bold;">
								${theater.t_loc}(${theater.t_title}) / ${movieTheater.mt_num}관<p>
								${screen.sc_date} | <span class="glyphicon glyphicon-time" style="color:white;"></span>${screen.sc_start}~${screen.sc_end}
							</td>
						</tr>
						<tr>
							<td colspan="2" style="color:white;">
								<div>성인(${adult_ticket}개)
									<c:if test="${adult_ticket>0}">
										<fmt:formatNumber value="${adult_ticket * 11000}" pattern="#,000"></fmt:formatNumber>원
									</c:if>
									<c:if test="${adult_ticket==0}">
										0원
									</c:if>
								</div>
								<div>
									청소년(${youth_ticket}개)
									<c:if test="${youth_ticket>0}">
										<fmt:formatNumber value="${youth_ticket * 8000}" pattern="#,000"></fmt:formatNumber>원
									</c:if>
									<c:if test="${youth_ticket==0}">
										0원
									</c:if>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="3" align="center">
								<table style="background-color: #434343; width: 400px;">
									<tr>
										<td width="50%" style="color:white;" align="left">표 금액</td>
										<td width="50%" style="color:white;" align="right"><fmt:formatNumber value="${totalPrice}" pattern="#,000"></fmt:formatNumber>원</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="3" align="center" style="color:white;">(마이너스)</td>
						</tr>
						<tr>
							<td colspan="3" align="center">
								<table style="background-color: #434343; width: 400px;">
									<tr>
										<td width="50%" style="color:white;" align="left">할인적용</td>
										<td width="50%" style="color:white;" align="right"><fmt:formatNumber value="" pattern="#,000"></fmt:formatNumber>원</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td style="color:white;">결제수단</td>
							<td colspan="2" align="right" style="color:white;">신용카드</td>
						</tr>
						<tr>
							<td colspan="3" align="center"><input type="submit" value="결제" class="btn btn-info"></td>
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