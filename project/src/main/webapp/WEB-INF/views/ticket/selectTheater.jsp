<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<table>
<c:forEach var ="i" items="${selectTheater}">
		<tr>
			<td><input type="button" value="${i.t_title}" onclick="theaterSelectChk('${i.t_title}')"></td>
		</tr>
</c:forEach>
</table>
</body>
</html>