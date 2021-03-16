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
	
	<div align="left" style="margin-top: 30px;"><p style=" font-weight: bold; font-size: 20px;">${theaterView.t_title}점 안내</p></div>
	
	<table style="width:1110px; height:auto">
		<tr height="50px;">
			<td style="font-weight: bold; font-size: 30px;">${theaterView.t_content}</td>
		</tr>
		<tr height="30px;">
			<td style="font-size: 13px;">연락처 : ${theaterView.t_loc}(${theaterView.t_title})점 / ${theaterView.t_number}</td>
		</tr>
		<tr height="150px;">
			<td>
				<div style="color:#503396; font-size: 20px; font-weight: bold;">시설안내</div>
				<div style="font-weight: bold; font-size: 17px;">보유시설</div>
				<div style="margin-bottom: 20px;"> - ${theaterView.t_gui}</div>
				
				<div style="font-weight: bold; font-size: 17px;">층별안내</div>
				<div> - ${theaterView.t_floor}</div>
			</td>
		</tr>
		<tr height="100px;">
			<td>
				<div style="color:#503396; font-size: 20px; font-weight: bold;">교통안내</div>
				<div style="font-weight: bold; font-size: 17px;">약도</div>
				<div> - 도로명 주소 : ${theaterView.t_addr}</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>