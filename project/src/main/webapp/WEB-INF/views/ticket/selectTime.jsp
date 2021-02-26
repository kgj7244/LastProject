<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
<table>
<c:forEach var ="i" items="${screen}">
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
			<td>
				<input type="button" value="${i.mt_num}관 " onclick="AllSelectChk(${i.t_num},'${movie.m_title}','${theater.t_title}',${i.mt_num})">
			</td>
		</tr>
</c:forEach>
</table>
</body>
</html>