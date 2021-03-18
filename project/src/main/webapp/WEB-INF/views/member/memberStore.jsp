<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어 주문 조회</title>

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
<input type ="hidden" name = "s_num" value = "${store.s_num }">
<input type ="hidden" name = "member_id" value = "${member.member_id }">


<table class="table table-hover" style="margin-top: 30px;">
		<tr>
			<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; 
			font-size: 30px; margin-top: 30px;">내 구매 상품</td>
		</tr>
	</table>
	<hr>



	<table class="table table-bordered table-hover" id="tableLook">
	
		<tr>	
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;" width="10%">주문번호</td>
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;" width="20%">상품 이름</td>
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;" width="15%">결제금액</td>				
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;" width="15%">구매일</td>
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;" width="15%">유효기간</td>				
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;" width="10%">자세히 보기</td>
			<td align="center" style="font-weight: bold; background-color: #f8f9fb; color: #908c88;" width="10%">상태</td>
		</tr>
		<tr>
			<c:if test="${empty ord}">
				<td colspan="7">구매한 상품이 없습니다.</td>
			</c:if>
			<c:if test="${not empty ord}">
				<c:forEach var="ord" items="${ord}">
					<tr>
						<td style="text-align: center;">${ord.ord_num}</td>
						<td style="font-weight: bold;">${ord.s_Pname}</td>		
					
						<td><fmt:formatNumber pattern="###,###" value="${ord.full_price}"/>원</td>							
						<td>${ord.buy_date}</td>													
						<td>~${ord.s_validity}</td>
										
						<td><input type="button" value="상세 정보" class="btn btn-success" 
						style="width: 100px; height: 30px; font-weight: bold; font-size: 15px; text-align: center;"
						onclick='location.href="memberStoreInfo.do?ord_num=${ord.ord_num}&s_num=${ord.s_num}"'>
						</td>
						
						
						
			<!-- 		&s_num=${ord.s_num}&s_validity=${ord.s_validity}	 -->	
						<c:if test="${ord.del=='n'}">						
						<td style="color: blue;">사용가능</td>
						</c:if>
						
						<c:if test="${ord.del=='y' }">						
						<td style="color: red;">불가능</td>
						</c:if>
						
					</tr>
					
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
<fmt:formatDate value="${ord.s_validity }" pattern="yyyy-MM-dd" var="s_validity"/>

<!-- or today >= s_validity -->





				</c:forEach>
			</c:if>
		</tr>
		<tr>
			<td align="center" colspan="7">
			<input type="button" value="목록으로" 
			onclick="location.href='mypage.do'" class="btn btn-warning"
			 style="width: 230px; height: 40px; font-weight: bold; font-size: 15px; vertical-align:middle; bottom: 0"></td>
		</tr>
		
	</table>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>