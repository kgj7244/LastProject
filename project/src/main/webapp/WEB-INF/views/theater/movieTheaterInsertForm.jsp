<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 추가</title>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
	<div class="container" align="center" >
	<h2>상영관 추가</h2>
	<form action="movieTheaterInsert.do" method="post" name="frm">
		<table class="table table-bordered">
			<tr>
				<th>극장번호</th>
				<td width="70%">
					<select name="t_num">
						<c:forEach var="theater" items="${list}">
							<option value="${theater.t_num }">${theater.t_num}(${theater.t_title })</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>상영관 번호</th>
				<td width="70%">
					<%-- <select required="required" autofocus="autofocus" name="mt_name">
						<c:forEach var="movieNum" items="${movieTheaterList}">
							<option value="${movieNum.mt_name }">${movieNum.mt_name }</option>
						</c:forEach>
					</select> --%>
					<select name="mt_name">
						<option value="1관">1관</option>
						<option value="2관">2관</option>
						<option value="3관">3관</option>
						<option value="4관">4관</option>
						<option value="5관">5관</option>
						<option value="6관">6관</option>
						<option value="7관">7관</option>
						<option value="8관">8관</option>
						<option value="9관">9관</option>
						<option value="10관">10관</option>
					</select>
				</td>				
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록" >
				<button><a href="#">목록</a></button>
			</tr>
		</table>
	</form>
	</div>

<%@include file="../mainFloor.jsp" %>
</body>
</html>