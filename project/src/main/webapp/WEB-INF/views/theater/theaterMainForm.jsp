<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">	
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
	function theaterMove(t_num) {
		$.post("theaterView.do","t_num="+t_num, function(data){
			$('#theaterView').html(data);
		});
	}
</script> 

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
	<!-- 상영하는 영화, 극장 선택 -->
	<div class="container" align="center" id="container1">	
	<h2 align="left">극장</h2>
	<hr style="border: 0px; height: 3px; background-color: #cccccc;">
		<table class="table table-bordered"  style="border-color:black; width: 1000px; height: 300px; align-items: center;">
			<tr>
				<td title="영화별 선택" width="10%" align="center" id="movie">
					<input type="button" value="영화별">
				</td>
				<td rowspan="2" width="60%" id="disp-choice-movie"></td> <!-- 영화별, 극장별 보여주는 곳 -->
				<td rowspan="2" width="30%" id="disp-poster"></td> <!-- 영화별 클릭시 포스터 사진 출력 -->
			</tr>
			<tr>
				<td id="theater" title="극장별 선택" align="center">
					<input type="button" value="극장별">
				</td>
			</tr>
		</table>
		<div id="theaterView"></div><!-- 아래에다가 극장에 대한 정보를 뿌려줄 예쩡 -->
		<div>
			<input type="button" class="btn btn-Secondary btn-lg" value="영화" onclick="location.href='movieMainForm.do?m_ing=0'">
			<input type="button" class="btn btn-warning btn-lg" value="예매" onclick="location.href='ticketMainForm.do'">
			<input type="button" class="btn btn-info btn-lg" value="스토어" onclick="location.href='storeMainForm.do'">
		</div>		
	</div>
	<%@ include file="../mainFloor.jsp" %>
</body>
</html>