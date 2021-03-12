<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 선택</title>
<script type="text/javascript">
	function theaterMove(t_num) {
		location.href="seoul1.do?t_num="+t_num;
	}
</script>
</head>
<body> 
	<table>
		<c:forEach var="theater" items="${list }" varStatus="i">
			<c:if test="${i.index % 5 ==0 }">
				<tr>
			</c:if>
			<td>
				<a class="btn btn-sm" onclick="theaterMove(${theater.t_num})">${theater.t_title }</a>
			</td>
			<c:if test="${i.index % 5 ==4 }">
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>