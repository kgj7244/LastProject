<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../mainTop.jsp" %>
<%@ include file="../mainNav.jsp" %>
	<div class="container" align="center">
		<h3 class="text-primary">공지 작성</h3>
		<form action="noticeInsert.do" method="post" name="frm">
		<input type="hidden" name="n_num" value="${n_num }">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<table class="table table-borderd">
			<tr>
				<td>지점</td>
				<td><select name="n_branch" required="required">
						<option id="n_branch" hidden="hidden"></option> <!-- 선택안했을시 required호출용 -->
						<option>전체</option>
						<option>신촌</option>
						<option>강남</option>
						<option>용산</option>
						<option>불광</option>
						<option>대전</option>
						<option>용인</option>
						<option>수원</option>
						<option>이천</option>
						<option>쌍팔</option>
						<option>용역</option>
						<option>구리</option>
						<option>미영</option>
					</select></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="n_title" required="required" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="40" required="required" name="n_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인" class="btn btn-warning"> &nbsp; <input type="reset" value="취소" class="btn btn-danger"></td>
			</tr>
		</table>
		</form> 
	</div>
	<%@ include file="../mainFloor.jsp" %>
</body>
</html>