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
	<!-- 상영하는 영화, 극장 선택 -->
	<div class="container">
		<!-- 상영 영화/극장/전체영화 선택  -->
		<div class="time-table-page">
			<div id="choice-movie" class="btn-group-vertical" style="float: left">
				<ul style="list-style: none;">
					<li><a id="movie" class="btn btn-success" title="영화별 선택">영화별</a></li>
					<li><a id="theater" class="btn btn-warning" title="극장별 선택">극장별</a></li>
					<li><a id="all-movie" class="btn btn-primary" title="전체 영화">전체 영화</a></li>
				</ul>
			</div>
			<!-- 영화별 선택 -->
			<div id="disp-choice-movie"></div>
			<!-- 극장별 선택 -->
			<div id="disp-movie-theather"></div>
			<!-- 전체 영화 제목만 보여주기 -->
			<div id="disp-all-movie"></div>
		</div>
		<!-- 상영시간표 날짜  -->
		<div class="time-table-date">
	<!-- 	임시로 막음!!!!!
			<table>
				<tr>
					<td>
						<div id="disp-date"></div>
					</td>
				</tr>
			</table> -->
			<table>
				<tr>
					<td>
						<div id="disp-date"></div>
					</td>
				</tr>
				<!-- 임시 상영관 구현 -->
				<tr>
					<th>서울</th>
					<td>강남</td>
					<td>용산</td>
					<td>불광</td>	
				</tr>
				<tr>
					<th>대전</th>
					<td>대전</td>
					<td>용인</td>
					<td>수원</td>
					<td>이천</td>
				</tr>
				<tr>
					<th>광주</th>
					<td>쌍팔</td>
					<td>이연</td>
					<td>지연</td>
					<td>희주</td>	
				</tr>
			</table>
		</div>
	</div>
</body>
</html>