<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<c:forEach var="i" items="${selectTheater1}">

				<td><input type="button" value="${i.t_title}"
					onclick="theaterSelectChk('${i.t_title}')" id="select1"
					style="background-color: rgba(255, 255, 255, 0.0); border: none;"></td>

			</c:forEach>
		</tr>
	</table>
</body>
</html>