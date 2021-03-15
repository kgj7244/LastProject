<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function select_over() {
		var over = $('#event').val();
		frm30.eo_num.value= over+"";
	}
</script>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
<div class="container" align="center">
	<form action="ticketInsert.do" method="post" name="frm30" onsubmit="return chk92()">
		<input type="hidden" name="m_title" value="${movie.m_title}">
		<input type="hidden" name="sc_num" value="${screen.sc_num}">
		<input type="hidden" name="t_title" value="${theater.t_title}">
		<input type="hidden" name="mt_num" value="${movieTheater.mt_num}">
		<input type="hidden" name="adult_ticket" value="${adult_ticket}">
		<input type="hidden" name="youth_ticket" value="${youth_ticket}">
		<input type="hidden" name="totalPrice" value="${totalPrice}">
		<input type="hidden" name="selectList" value="${selectList1}">
		<input type="hidden" name="eo_num">
		<div align="left">
			<h2>빠른 예매</h2>
		</div>
		<table class="table table-bordered">
			<tr>
				<td width="60%">
					<div style="font-size: 20px;">관람권 및 할인 적용</div>
					<div style="height: 40px;">
						<select class="form-control" name="event" id="event" onchange="select_over()" style="font-size: 15px;">
						    <option value="쿠폰없음">쿠폰없음</option> <!-- 교안에 첫번쨰껀 선택 못하게 하는기능있음 나머진 for문으로 돌림 -->
						    <c:forEach var="m" items="${memberEvent_over}">
						    	<option value="${m.eo_num}">(${m.e_state}) "${m.e_title}" ${m.e_sale}원 </option>
						    </c:forEach>
						</select>
					</div>
					<div>
						<div style="height: 30px;font-size: 20px;">결제수단선택</div>
					</div>
					<table class="table table-bordered">
						<tr>
							<td style="vertical-align:middle;">
								<label for="phone"><input type="radio" id="phone" name="payment" value="휴대폰 결제" onclick="phone()" checked="checked">휴대폰 결제</label> &nbsp;&nbsp;&nbsp;&nbsp;
								<label for="transfer"><input type="radio" id="transfer" name="payment" value="계좌이체" onclick="transfer()">계좌이체</label> &nbsp;&nbsp;&nbsp;&nbsp;
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
							<td width="5%" height="20%" style="vertical-align:middle;">
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
							<td width="75%" style="color:white; font-size: 17px; font-weight: bold; vertical-align:middle;">
								${movie.m_title}<p>
								(${movie.m_genre})
							</td>
						</tr>
						<tr>
							<td colspan="2" style="color:white; font-size: 15px; font-weight: bold;">
								${theater.t_loc}(${theater.t_title}) / ${movieTheater.mt_num}관<p>
								${screen.sc_date} | <span class="glyphicon glyphicon-time" style="color:white;"></span>${screen.sc_start}~${screen.sc_end}
							</td>
						</tr>
						<tr>
							<td colspan="2" style="color:white; font-weight: bold;">
								<div>성인(${adult_ticket}명) : 
									<c:if test="${adult_ticket>0}">
										<fmt:formatNumber value="${adult_ticket * 11000}" pattern="#,000"></fmt:formatNumber>원
									</c:if>
									<c:if test="${adult_ticket==0}">
										0원
									</c:if>
								</div>
								<div>
									청소년(${youth_ticket}명) : 
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
								<table style="background-color: #434343; width: 400px; height: 100px; ">
									<tr>
										<td width="50%" style="color:white;vertical-align:middle;font-size: 30px;" align="left">금액</td>
										<td width="50%" style="color:white;vertical-align:middle;font-size: 30px;" align="right"><span style="color: #329eb1; font-weight: bold; font-size: 35px;"><fmt:formatNumber value="${totalPrice}" pattern="#,000"></fmt:formatNumber></span>원</td>
									</tr>
								</table>
							</td>
						</tr>
						
						<tr>
							<td colspan="3" align="center"><input type="submit" value="결제" class="btn btn-Secondary btn-lg" style="width: 100px; height: 30px;"></td>
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