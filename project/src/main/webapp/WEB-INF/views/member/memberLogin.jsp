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
<%@ include file="../mainTop.jsp" %>
<%@ include file="../mainNav.jsp" %>
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("로그인 되었습니다");
		location.href="mainForm.do"
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("잘못된 암호입니다");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result == -1}">
	<script type="text/javascript">
		alert("없는 아이디입니다");
		history.go(-1);
	</script>
</c:if>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>