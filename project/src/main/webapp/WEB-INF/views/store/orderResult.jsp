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
<h1>상품 결제가 완료되었습니다</h1>
<table class="table table-border">
<tr>
<td>${ord.ord_num}</td>	
<td><fmt:formatNumber pattern="###,###" value="${ord.full_price}"/>원</td>	
</tr>

</table></div>
<%-- 	<table class="table table-border">
<tr>
<c:if test="${not empty ord}">
				<c:forEach var="ord" items="${ord}">
					<tr>
						<td style="text-align: center;">${ord.ord_num}</td>
						<td style="font-weight: bold;">${ord.s_Pname}</td>		
					
						<td><fmt:formatNumber pattern="###,###" value="${ord.full_price}"/>원</td>							
						<td>${ord.buy_date}</td>													
						<td>~${ord.s_validity}</td>
						</tr></c:forEach></c:if>
					<td>${bank.t_deal}</td> 
					
						<td><fmt:formatNumber pattern="###,###" value="${ord.full_price}"/>원</td>							
						<td>${ord.buy_date}~${ord.s_validity}</td></tr>
	
	<tr>
			<td align="center" colspan="7"><input type="button" value="목록으로" onclick="location.href='mypage.do'" class="btn btn-warning"></td>
		</tr>
</table>
</div> --%>
</body>
</html>