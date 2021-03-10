<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showtime</title>
<script type="text/javascript">
	window.onload = function() {
		var doc = "";
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var date = today.getDate();
		doc = year+"년"+"\n";
		doc += month +"월" + "<br>"+ "<br>";
		//doc += "일 : " + date + "<br>";
		/* 현재를 기준으로 10일 표시 */
		for (var i = 0; i < 10; i++) {
			today.setDate(today.getDate() + 1);
			var year2 = today.getFullYear();
			var month2 = today.getMonth() + 1;
			var date2 = today.getDate();
			//doc += "<span>" + year2 + "<br>";
			//doc += "<span>월 : " + month2 + "<br>";
			doc += "<span>" + date2 +"일" +"</span>";
		}
		$("#disp-date").html(doc);
	}
	$(function() {
		$('#movie').click(function() {
			$.post('choiceMovie.do', function(data) {
				$('#disp-choice-movie').html(data);
			});
		});
		$('#theater').click(function() {
			$.post('choiceTheater.do', function(data) {
				$('#disp-choice-movie').html(data);
			});
		});
		$('#all-movie').click(function() {
			$.post('choiceAllMovie.do', function(data) {
				$('#disp-choice-movie').html(data);
			});
		});
	});
</script>
<style type="text/css">
	#disp-date span {
		height: 100px;
		float: left;
	}
</style> 
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
	<!-- 상영하는 영화, 극장 선택 -->
	<div class="container">	
		<!-- 상영관 추가, master만 가능  -->
		<input type="hidden" name="member_id" value="${member_id}">
			<c:if test="${member_id == 'master'}">
				<a href="theaterInsertForm.do">극장 추가</a>
				<a href="movieTheaterInsertForm.do">상영관 추가</a>
			</c:if>
			
			
		<table class="table table-bordered"  style="border-color:black; width: 1200px; height: 500px; align-items: center;">
			<tr>
				<td id="movie" title="영화별 선택" width="30%">영화별</td>
				<td rowspan="2" width="60%" id="disp-choice-movie"></td>
				<td rowspan="2" width="20%">${movie.m_poster}</td>
			</tr>
			<tr>
				<td id="theater" title="극장별 선택">극장별</td>
				<!-- <td id="disp-movie-theather"></td> -->
			</tr>
		</table>
		
		
		
		<!-- 상영시간표 날짜  -->
		<table class="table table-bordered">
			<tr>
				<td><div id="disp-date"></div></td>
			</tr>
		</table>
	</div>
	<%@ include file="../mainFloor.jsp" %>
</body>
</html>