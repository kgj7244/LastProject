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
		doc ="년도 : "+year+"<br>";
		doc +="월 : "+month+"<br>";
		doc +="일 : "+date+"<p>";
		
		for (var i = 0; i < 10; i++) {
			today.setDate(today.getDate()+1);
			var year2 = today.getFullYear();
			var month2 = today.getMonth() + 1;
			var date2 = today.getDate();
			doc +="년도 : "+year2+"<br>";
			doc +="월 : "+month2+"<br>";
			doc +="일 : "+date2+"<br>";
		}
		$("#disp-date").html(doc);
	}
</script>
</head>
<body>
	<h4>여기는 상영페이지야!</h4>
	<!-- 상영하는 영화, 극장 선택 -->
	<div class="container">
		<div class="inner-wrap">
			<div class="time-table-page">
				<div class="movie-choice">
					<div class="left-choice">
						<ul>
							<li id="movie"><a href="#" class="btn" title="영화별 선택">영화별</a></li>
							<li id="theater"><a href="#" class="btn" title="극장별 선택">극장별</a></li>
						</ul>
					</div>
					
					<div class="center-choice">
						<ul>
							<li id="all-movie"><a href="#" class="btn" title="전체 영화">전체 영화</a></li>
						</ul>
					</div>
					
				</div>
			</div>
		</div>
		<!-- 상영시간표 날짜 구현 -->
		<div class="center-wrap">
			<div class="date-choice-page">
				<div id="disp-date"></div>
			</div>
		</div>
	</div>
</body>
</html>