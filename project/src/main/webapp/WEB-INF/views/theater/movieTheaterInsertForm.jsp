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
	<div class="container" align="center">
	<table class="table table-hover" style="margin-top: 30px;">
		<tr>
			<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; font-size: 30px; margin-top: 30px;">상영관 추가</td>
		</tr>
	</table>
	<hr>
	<form action="movieTheaterInsert.do" method="post" name="frm">
		<table class="table table-bordered">
			<tr>				
				<td width="50%" align="right"style="vertical-align:middle;">극장번호 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;">
					<select name="t_num" class="form-control" style="width: 180px;">
						<c:forEach var="theater" items="${list}">
							<option value="${theater.t_num }">${theater.t_num}(${theater.t_title })</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">상영관 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;">
					<select name="mt_name" class="form-control" style="width: 180px;">
						<option value="1관">1관</option>
						<option value="2관">2관</option>
						<option value="3관">3관</option>
						<option value="4관">4관</option>
						<option value="5관">5관</option>
					</select>
				</td>	
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="목록으로" class="btn btn-info btn-lg" onclick="location.href='mypage.do'">
					<input type="submit" value="등록" class="btn btn-warning btn-lg">
				</td>
			</tr>
		</table>
	</form>
	</div>

<%@include file="../mainFloor.jsp" %>
</body>
</html>