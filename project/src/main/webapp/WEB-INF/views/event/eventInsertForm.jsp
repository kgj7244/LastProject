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
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>

<div class="container" align="center">
	<h2>이벤트 추가</h2>
	<form action="eventInsert.do" method="post" enctype="multipart/form-data">
		<table class="table table-bordered">
			<tr>
				<td>이벤트 이름</td>
				<td><input type="text" name="e_title"></td>
			</tr>
			<tr>
				<td>이벤트 종류</td>
				<td>
					<select name="e_state">
						<option value="쿠폰">쿠폰</option>
						<option value="상품권">상품권</option>				
					</select>
				</td>
			</tr>
			<tr>
				<td>할인금액</td>
				<td><input type="number" name="e_sale"></td>
			</tr>
			<tr>
				<td>포스터 이미지</td>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="btn btn-info"></td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../mainFloor.jsp" %>
</body>
</html>