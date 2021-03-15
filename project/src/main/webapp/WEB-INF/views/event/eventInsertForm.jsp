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

<div class="container" align="center" id="container1">
	<table class="table table-hover" style="margin-top: 30px;">
		<tr>
			<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; font-size: 30px; margin-top: 30px;">이벤트 추가</td>
		</tr>
	</table>
	<hr>
	<form action="eventInsert.do" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 700px; height: 300px;">
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">이벤트 이름 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;"><input type="text" name="e_title"></td>
			</tr>
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">이벤트 종류 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;">
					<select class="form-control" name="e_state" style="width: 180px;">
						<option value="쿠폰">쿠폰</option>
						<option value="상품권">상품권</option>				
					</select>
				</td>
			</tr>
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">할인금액 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;"><input type="number" name="e_sale"></td>
			</tr>
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">포스터 이미지 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;"><input type="file" name="file"></td>
			</tr>
			<tr style="height: 50px;">
				<td colspan="3" align="center" style="vertical-align:middle;"><input type="button" class="btn btn-info btn-lg" onclick="location.href='mypage.do'" value="목록으로">&nbsp;&nbsp;<input type="submit" class="btn btn-warning btn-lg"></td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="../mainFloor.jsp" %>
</body>
</html>