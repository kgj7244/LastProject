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
		/* 날짜 보여주기 */
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
			doc += "<span>" + date2 +"일" +"\n"+"</span>";
		}
		$("#disp-date").html(doc);
	}
	$(function() {
		/* 영화 목록보여주기  */
		$('#movie').click(function() {
			$.post('choiceMovie.do', function(data) {
				$('#disp-choice-movie').html(data);
			});
		});
		/* 상영관 목록 보여주기 */
		$('#theater').click(function() {
			$.post('choiceTheater.do', function(data) {
				$('#disp-choice-movie').html(data);
			});
		});
		/* $('#all-movie').click(function() {
			$.post('choiceAllMovie.do', function(data) {
				$('#disp-choice-movie').html(data);
			});
		});*/
	});
	/* 극장(지역) 보여주기 */
	function timeLocChk(t_loc) {
		$.post("theaterLoc.do","t_loc="+t_loc, function(data) {
			$('#disp-showTimeList').html(data);
		});
	}
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
	<h2 align="left">극장</h2>
	<hr style="border: 0px; height: 3px; background-color: #cccccc;">
		<table class="table table-bordered"  style="border-color:black; width: 1000px; height: 300px; align-items: center;">
			<tr>
				<td title="영화별 선택" width="10%" align="center" id="movie">
					<input type="button" value="영화별">
				</td>
				<td rowspan="2" width="60%" id="disp-choice-movie"></td>
				<td rowspan="2" width="30%" id="disp-poster"></td>
			</tr>
			<tr>
				<td id="theater" title="극장별 선택" align="center">
					<input type="button" value="극장별">
				</td>
				<!-- <td id="disp-movie-theather"></td> -->
			</tr>
		</table>

		<!-- 상영시간표 상세  -->
<%-- 		<table class="table table-hover table-bordered" id="showtime" style="border-color:black; width: 1000px; height: 600px;">
			<tr height="100px">
				<td colspan="3">
					<span class="btn" id="disp-date" ></span>
				</td>
			</tr>
			<tr height="100px">
			<c:forEach var="theater" items="${showLocList }">
				<td align="center">
					<input type="button" value="${theater.t_loc }" onclick="timeLocChk('${theater.t_loc}')">
					<div id="disp-loc"></div>
				</td>
			</c:forEach>
			</tr>		
			<tr>
				<td colspan="3">
					<div id="disp-showTimeList"></div>
				</td>
			</tr>
		</table> --%>
		
	</div>
	<%@ include file="../mainFloor.jsp" %>
</body>
</html>