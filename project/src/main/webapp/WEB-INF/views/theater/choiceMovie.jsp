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
		$('#disp-poster').html("<a href='movieMainForm.do'><img width='100%' src='${path}/resources/images/m_poster/"+m_poster+"'></a>");
	}
</script>
</head>
<body>
	<div style="font-weight: bold; font-size: 20px;">영화별</div>
	<c:forEach var="movie" items="${movieList}" varStatus="m">
		<a class="btn btn-info" style="width: 180px; height:30px; font-size: 11px; margin-bottom: 5px; vertical-align:middle;" onclick="movieP('${movie.m_poster}')">${movie.m_title}</a>&nbsp;
	</c:forEach>
</body>
</html>