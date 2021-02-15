<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result>0}">
		<script type="text/javascript">
			alert("부서 입력 됬습니다.")
			location.href = "deptList.do";
		</script>
	</c:if>
	<c:if test="${result==0}">
		<script type="text/javascript">
			alert("오류가 발생했으")
			history.back();
		</script>
	</c:if>
	<c:if test="${result==-1}">
		<script type="text/javascript">
			alert("이미 있는거여 확인좀해 이눔아")
			history.back();
		</script>
	</c:if>
</body>
</html>