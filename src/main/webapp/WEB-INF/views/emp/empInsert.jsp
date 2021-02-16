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
<c:if test="${result>0 }">
	<script type="text/javascript">
		alert("입력성공");
		location.href="empList.do?empno=${emp.empno}"
		//location.href="empList.do?deptno=${emp.deptno}"
	</script>
</c:if>
<c:if test="${result==0 }">
	<script type="text/javascript">
		alert("입력실패");
		history.back();
	</script>
</c:if>
<c:if test="${result==-1}">
	<script type="text/javascript">
		alert("이미 있는 사원인데 그사원 짜를꺼야? 딴 번호 찾아봐");
		history.back();
	</script>
</c:if>
</body>
</html>