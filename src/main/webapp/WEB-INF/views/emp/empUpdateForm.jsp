<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function empChk() {
		if(!frm.empno.value){
			alert("사번을 입력해주세용~");
			frm.empno.focus();
			return false;
		}
		$.post("empChk.do", "empno="+frm.empno.value, function(data) {
			$('#empChk').html(data);
		});
	}
</script>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">직원정보 수정</h2>
<form action="empUpdate.do" method="post" name="frm">
<input type="hidden" name="empno" value="${emp.empno}">
<table class="table table-bordered">
	<tr>
		<td>사번</td>
		<td>${emp.empno}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="ename" value="${emp.ename}" required="required"></td>
	</tr>
	<tr>
		<td>업무</td>
		<td><input type="text" name="job" value="${emp.job}" required="required"></td>
	</tr>
	<tr>
		<td>관리자 사번</td>
		<td>
			<select name="mgr">
				<c:forEach var="e" items="${empList}">
					<c:if test="${emp.mgr==e.empno}">
						<option value="${e.empno}" selected="selected">${e.ename}(${e.empno})</option>
					</c:if>
					<c:if test="${emp.mgr!=e.empno}">
						<option value="${e.empno}">${e.ename}(${e.empno})</option>
					</c:if>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>입사일</td>
		<td><input type="date" name="hiredate" value="${emp.hiredate}" required="required"></td>
	</tr>
	<tr>
		<td>급여</td>
		<td><input type="number" name="sal" value="${emp.sal}" required="required"></td>
	</tr>
	<tr>
		<td>보너스</td>
		<td><input type="number" name="comm" value="${emp.comm}" required="required"></td>
	</tr>
	<tr>
		<td>부서코드</td>
		<td>
			<select name="deptno">
				<c:forEach var="dept" items="${deptList}"> <!-- 같으면 그 부서를 먼저 보여줘라 selected -->
					<c:if test="${emp.deptno==dept.deptno}">
						<option value="${dept.deptno}" selected="selected">${dept.dname}(${dept.deptno})</option>

					</c:if>
					<c:if test="${emp.deptno!=dept.deptno}">
						<option value="${dept.deptno}">${dept.dname}(${dept.deptno})</option>
					</c:if>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="확인" class="btn btn-danger"></td>
	</tr>
</table>
</form>
<a href="empSelect.do?empno=${emp.empno}" class="btn btn-info">직원 정보</a>
</div>
</body>
</html>