<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#disp').load('deptList.do');
});
</script>
</head>
<body>
<div class="container" align="center">
	<h2>부서정보 상세</h2>
	<table class="table table-bordered table-striped">
		<tr>
			<td>부서번호</td>
			<td>${dept.deptno}</td>
		</tr>
		<tr>
			<td>부서명</td>
			<td>${dept.dname}</td>
		</tr>
		<tr>
			<td>장소</td>
			<td>${dept.loc}</td>
		</tr>
	</table>
<a href="deptList.do" class="btn btn-info">부서목록</a>
<div id="disp"></div>
</div>
</body>
</html>