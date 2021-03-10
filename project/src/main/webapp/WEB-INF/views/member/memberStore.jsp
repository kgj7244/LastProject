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
			<td><h2>구매일</h2></td>
			<td>주문번호</td>
			<td>상품 이름</td>
			<td>구매 수량</td>
			
			
		
			<td>유통기한</td>
				
			<td>자세히 보기</td>
			<td>환불</td>
		</tr>
		<tr>
			<c:if test="${empty ord}">
				<td colspan="7">구매한 상품이 없습니다.</td>
			</c:if>
			<c:if test="${not empty ord}">
				<c:forEach var="ord" items="${ord}">
					<tr>
						<td>${ord.buy_date}</td>
						
						
						<td>${ord.s_num }</td>
						
						<td>${ord.ord_num}</td>
						<td>${ord.s_Pname}</td>												
						<td>${ord.s_purchase}</td>	
									
						<td>${ord.s_validity}</td>
					
						
						
						
						<td><input type="button" value="자세히 보기 s_num" 
						onclick='location.href="memberStoreInfo.jsp.do?s_num=${ord.s_num}"'>

						
						<td><input type="button" value="건너가세" 
						onclick='location.href="memberStoreInfo.jsp.do?ord_num=${ord.ord_num}&s_num=${ord.s_num}&s_validity=${ord.s_validity}"'>
						
						<td><input type="button" value="구매 취소" onclick=''>
						
					</tr>
				</c:forEach>
			</c:if>
		</tr>
	</table>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>