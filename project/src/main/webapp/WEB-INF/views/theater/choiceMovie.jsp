<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 제목 선택</title>
<script type="text/javascript">
	function movieP(m_poster) {
		$('#disp-poster').html("<img width='80%' src='${path}/resources/images/m_poster/"+m_poster+"'>");
	}
</script>
</head>
<body>
	<table>
		<c:forEach var="movie" items="${movieList }" varStatus="m">
			<c:if test="${m.index % 5 ==0 }">
				<tr>
			</c:if>
				<td>
					<a class="btn btn-sm" onclick="movieP('${movie.m_poster}')">${movie.m_title }</a>
				</td>
			<c:if test="${m.index % 5 ==4 }">
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>