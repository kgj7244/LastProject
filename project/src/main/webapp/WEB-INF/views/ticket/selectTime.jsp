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
<table>
<c:forEach var ="i" items="${screen}">
		<%-- <tr>
			<td><input type="button" value="${i.t_title}" onclick="theaterSelectChk('${i.t_title}')" id="select1"></td>
		</tr> --%>
		<tr>
			<td> <!-- 시간 -->
				<input type="text" value="${i.sc_start}"><br>
				~<input type="text" value="${i.sc_end}">
			</td>
			<td> <!-- 제목 movie/theater -->
				<input type="text" value="${movie.m_title}">
			</td>
			<td>
				<input type="text" value="${theater.t_title}"> 
			</td>
			<%-- <td>
				<input type="text" value="${}"> 
			</td> --%>
			<td>
				<input type="button" value="선택" onclick="AllSelectChk(${i.sc_num})">
			</td>
		</tr>
</c:forEach>
</table>
</body>
</html>