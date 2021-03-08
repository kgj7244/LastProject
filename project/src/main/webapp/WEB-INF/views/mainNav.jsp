<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	li>a{
		color:white;
		font-size: 20px;
		font-weight: bold;
	}
</style>
</head>
<body>
<div style="background-color: #0d0908; height: 50px; vertical-align:middle;">
	<div class="container" align="center">
		<div class="row">
			<div class="col-sm-1" align="center"><img src="${path}/resources/images/home/전체메뉴.png" width="70%" height="70%" style="margin-top: 5px;"></div>
			<div class="col-sm-10" align="center">
			<ul class="nav nav-pills nav-justified">
				<li><a href="movieMainForm.do">영화</a></li>
				<li><a href="theaterMainForm.do">극장</a></li>
				<li><a href="ticketMainForm.do">예매</a></li>
				<li><a href="storeMainForm.do">스토어</a></li>
				<li><a href="boardList.do">고객센터</a></li>
			</ul>
			</div>
			<div class="col-sm-1" align="center"><img src="${path}/resources/images/home/찾기.png" width="70%" height="70%"  style="margin-top: 5px;"></div>
		</div>
	</div>
</div>
</body>
</html>