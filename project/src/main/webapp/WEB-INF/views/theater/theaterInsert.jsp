<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 추가</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("상영관이 등록되었습니다.");
			location.href = "theaterMainForm";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("상영관 등록이 실패하였습니다.");
			hostory.go(-1);
		</script>
	</c:if>
	<c:if test="${result == -1}">
		<script type="text/javascript">
			alert("상영관 등록이 실패하였습니다.");
			hostory.go(-1);
		</script>
	</c:if>
</body>
</html>