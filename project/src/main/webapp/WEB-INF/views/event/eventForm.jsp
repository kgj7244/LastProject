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
	<div align="left"><h2>이벤트 상품 목록입니다.</h2></div>
	<hr>
		<c:forEach var="i" begin="0" end="7" items="${eventList}">
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="${path}/resources/images/event/${i.e_poster}" alt="사진없는거 아니여?" width="230px;" height="300px;">
					<div class="caption">
						<div align="center" style="height: 70px;">
							<h4 style="font-weight: bold;">
								<a href="eventPart.do?e_num=${i.e_num}" style="color:black;">${i.e_title}</a>
							</h4>
						</div>
						<div align="center">
							<button id="" class="btn btn-warning" role="button" style="width: 150px; height: 40px; font-weight: bold; font-size: 15px; vertical-align:middle;" onclick="location.href='eventPart.do?e_num=${i.e_num}'">이벤트 참여하기</button>
						</div>
					</div>
				</div>
			</div>
			<c:if test="${i.e_num==4}"><p></c:if>
		</c:forEach>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>