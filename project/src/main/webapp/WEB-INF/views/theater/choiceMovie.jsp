<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 제목 선택</title>
</head>
<body>
	<table>
		<c:forEach var="movie" items="${movieList }">
			<tr>
				<td>${movie.m_title }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>