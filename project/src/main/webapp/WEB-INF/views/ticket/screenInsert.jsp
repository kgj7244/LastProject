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
<c:if test="${result>0}">
	<script type="text/javascript">
		alert('상영 등록 되었습니다.');
		location.href="mainForm.do";
		location.href
	</script>
</c:if>
<c:if test="${result ==0}">
	<script type="text/javascript">
		alert('상영 등록이 실패 됬습니다.');
		histroy.back();
	</script>
</c:if>
<c:if test="${result ==-1}">
	<script type="text/javascript">
		alert('상영 등록이 실패 됬습니다.');
		histroy.back();
	</script>
</c:if>

</body>
</html>