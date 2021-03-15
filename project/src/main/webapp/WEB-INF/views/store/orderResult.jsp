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

					
					
						<td><fmt:formatNumber pattern="###,###" value="${ord.full_price}"/>원</td>							
						<td>${ord.buy_date}~${ord.s_validity}</td></tr>
	
	<tr>
			<td align="center" colspan="7"><input type="button" value="목록으로" onclick="location.href='mypage.do'" class="btn btn-warning"></td>
		</tr>
</table>
</div>
</body>
</html>