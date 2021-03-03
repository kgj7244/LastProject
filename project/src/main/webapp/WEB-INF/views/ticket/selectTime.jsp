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
				<span>${i.sc_start}</span><br>
				~<span>${i.sc_end}<span>
			</td>
			<td> <!-- 제목 movie/theater -->
				${movie.m_title}
			</td>
			<td>
				${theater.t_title} 
			</td>
			<td>
				<input type="button" value="${i.mt_name}" onclick="AllSelectChk(${i.mt_num},${i.sc_num},'${i.mt_name}','${i.sc_start}','${movie.m_title}','${theater.t_title}',${i.t_num})">
			</td>
		</tr>
</c:forEach>
</table>
</body>
</html>