<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 정보 수정 결과</title>
</head>
<body>
	<c:if test="${result > 0}">
		<script type="text/javascript">
			alert("수정 성공했습니다.");
			location.href="movieView.do?m_num=${movie.m_num}";
		</script>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("수정 실패했습니다. 다시 시도해주세요.");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>