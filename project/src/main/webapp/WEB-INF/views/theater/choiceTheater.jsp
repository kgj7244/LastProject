<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 선택</title>
</head>
<body> 
	<table>
		<c:forEach var="theater" items="${list }" varStatus="i">
			<c:if test="${i.index % 5 ==0 }">
				<tr>
			</c:if>
			<td class="btn btn-sm">${theater.t_title }</td>
			<c:if test="${i.index % 5 ==4 }">
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>