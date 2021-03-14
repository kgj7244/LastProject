<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
</style>
<style type="text/css">
	#container1{
		height: 750px;
	}
</style>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
<div class="container" align="center" id="container">
	<table class="table table-hover" style="margin-top: 30px;">
		<tr>
			<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; font-size: 30px; margin-top: 30px;">${event.e_num}번의 이벤트 수정</td>
		</tr>
	</table>
	<form action="eventUpdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="e_num" value="${event.e_num}">
		<table  class="table table-bordered" style="width: 700px; height: 300px;">
			<tr>
				<td width="50%" align="right">이벤트 이름 &nbsp;&nbsp;</td>
				<td width="50%" align="left"><input type="text" name="e_title" value="${event.e_title}"></td>
			</tr>
			<tr>
				<td width="50%" align="right">이벤트 종류 &nbsp;&nbsp;</td>
				<td width="50%" align="left">
					<select class="form-control" name="e_state" style="width: 180px;">
						<option value="쿠폰">쿠폰</option>
						<option value="상품권">상품권</option>				
					</select>
				</td>
			</tr>
			<tr>
				<td width="50%" align="right">할인금액 &nbsp;&nbsp;</td>
				<td width="50%" align="left"><input type="number" name="e_sale" value="${event.e_sale}"></td>
			</tr>
			<tr>
				<td width="50%" align="right">포스터 이미지 &nbsp;&nbsp;</td>
				<td width="50%" align="left"><input type="file" name="file"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" class="btn btn-info" value="목록으로" onclick="location.href='eventListUpdate.do'">&nbsp;&nbsp;<input type="submit" class="btn btn-warning" value="확인"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>