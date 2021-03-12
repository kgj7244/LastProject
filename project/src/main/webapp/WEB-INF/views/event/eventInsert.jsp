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
<c:if test="${result >0}">
	<script type="text/javascript">
		alert('이벤트 상품에 추가 되었습니다.');
		location.href="eventInsertForm.do";
	</script>
</c:if>
<c:if test="${result ==0}">
	<script type="text/javascript">
		alert('이벤트 상품에 실패 하였습니다.');
		history.back();
	</script>
</c:if>

</body>
</html>