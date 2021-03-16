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
<div class="container" align="center">
	<table style="margin-top:15px;">
		<tr>	
			<td align="left"><h2>${theaterView.t_title}점 안내</h2></td>
		</tr>
	</table>
	<table class="table table-bordered">
		<tr>
			<td>${theaterView.t_content}</td>
		</tr>
		<tr>
			<td>${theaterView.t_loc}(${theaterView.t_title}) / ${theaterView.t_number}</td>
		</tr>
		<tr>
			<td>
				<span style="color:#503396">시설안내</span><p>
				보유시설<p>
				${theaterView.t_gui}<p><p><p><p>
				
				층별안내<p>
				${theaterView.t_floor}
			</td>
		</tr>
		<tr>
			<td>
				<span style="color:#503396">교통안내</span><p>
				약도<p>
				도로명 주소 : ${theaterView.t_addr}
			</td>
		</tr>
	</table>
</div>
</body>
</html>