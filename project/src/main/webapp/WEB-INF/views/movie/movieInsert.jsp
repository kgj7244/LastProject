<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 추가 결과</title>
</head>
<body>
	<c:if test="${result > 0}">
		<script type="text/javascript">
			alert("입력 성공했습니다.");
			location.href="movieMainForm.do";
		</script>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("입력 실패했습니다. 다시 시도해주세요.");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${result == -1}">
		<script type="text/javascript">
			alert("이미 있는 영화 번호입니다. 다른 번호로 적어주세요.");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>