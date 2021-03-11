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
<input type ="hidden" name = "s_num" value = "${store.s_num }">
<input type ="hidden" name = "member_id" value = "${member.member_id }">

	<h2>구매 상품 </h2>
	<table class="table table-bordered">
		<tr>	
			<td>주문번호</td>
			<td>상품 이름</td>
			<td>결제금액</td>				
			<td>구매일</td>
			<td>유효기간</td>				
			<td>자세히 보기</td>
			<td>상태</td>
		</tr>
		<tr>
			<c:if test="${empty ord}">
				<td colspan="7">구매한 상품이 없습니다.</td>
			</c:if>
			<c:if test="${not empty ord}">
				<c:forEach var="ord" items="${ord}">
					<tr>
						<td>${ord.ord_num}</td>
						<td>${ord.s_Pname}</td>		
						<td>${ord.full_price}</td>							
						<td>${ord.buy_date}</td>													
						<td>~${ord.s_validity}</td>
										
						<td><input type="button" value="상세 정보" 
						onclick='location.href="memberStoreInfo.jsp.do?ord_num=${ord.ord_num}&s_num=${ord.s_num}"'>
						</td>
			<!-- 		&s_num=${ord.s_num}&s_validity=${ord.s_validity}	 -->	
						<c:if test="${ord.del=='n'}">						
						<td>사용가능</td>
						</c:if>
						
						<c:if test="${ord.del=='y'}">						
						<td>불가능</td>
						</c:if>
						
					</tr>
				</c:forEach>
			</c:if>
		</tr>
	</table>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>