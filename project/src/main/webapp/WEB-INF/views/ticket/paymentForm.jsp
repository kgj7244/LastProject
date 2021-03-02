<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	var selectList = new Array();
	var type;
	var $count;
	var count_val;
	var $count1;
	var count1_val;
	$(document).ready(function() {
		$('#count_adult input[count_adult]').click(function(e) {
			e.preventDefault();
			type = $(this).attr('count_adult');
			$count = $(this).parent().children('input.count');
			count_val = $count.val(); // min 1
			if (type == 'm') {
				if (count_val < 1) {
					return;
				}
				$count.val(parseInt(count_val) - 1);
			} else if (type == 'p') {
				if (count_val < 8) {
				$count.val(parseInt(count_val) + 1);
				}
			}
		});
	});
	
	$(document).ready(function() {
		$('#count_youth input[count_youth]').click(function(e) {
			e.preventDefault();
			type = $(this).attr('count_youth');
			$count1 = $(this).parent().children('input.count1');
			count1_val = $count1.val(); // min 1
			if (type == 'm') {
				if (count1_val < 1) {
					return;
				}
				$count1.val(parseInt(count1_val) - 1);
			} else if (type == 'p') {
				if (count1_val < 8) {
					$count1.val(parseInt(count1_val) + 1);
				}
			}
			
		});
	});
	
	// 좌석뷰
	$(function() {
		$('#seatDisp').load('${path}/movieTheater50.do');
	});
	
	function row(selectSeat) {
		var select = selectSeat;
		if(selectList.indexOf(select) == -1){
			selectList.push(select);
		}else{
			selectList.splice(selectList.indexOf(select),1);
		}
		$('#rowSelect').html("<input type='text' value="+selectList+">");
	}
		
</script>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>

<div class="container" align="center">
	<h2>빠른 예매</h2>
	<hr>
	<form action="" name="frm10">
		<table class="table table-bordered">
			<tr>
				<td>관람인원 선택</td>
				<!-- 오른쪽 정보 제공 창 -->
				<td rowspan="3">
					<table class="table table-bordered">
						<tr>
							<td colspan="2">${movie.m_title}</td>
						</tr>
						<tr>
							<td>
								${theater.t_loc}(${theater.t_title}점)<br>
								${mt_num}관<br>
								${screen.sc_date}<br>
								${screen.sc_start} ~ ${screen.sc_end}
							</td>
							<td><img alt="보여줄 이미지가 없습니다." src="${path}/resources/images/m_poster/${movie.m_poster}" height="100px;" width="80px;"></td>
						</tr>
						<tr>
							<td>좌석 설명</td>
							<td><span id="rowSelect"></span></td>
						</tr>
						<tr>
							<td colspan="2">최종 금액</td>
						</tr>
					</table>
				</td>
			</tr>
			<!-- 인원수 체크 -->
			<tr>
				<td>
					성인&nbsp;&nbsp;&nbsp;&nbsp;			
					<span id="count_adult">
  						<input value="-" count_adult="m" type="button">
  						<input class="count" value="0" readonly="" name="" id="text1" disabled="disabled">
  						<input value="+" count_adult="p" type="button">
					</span>
					<p>
					청소년
					<span id="count_youth">
  						<input value="-" count_youth="m" type="button">
  						<input class="count1" value="0" readonly="" name="" disabled="disabled">
  						<input value="+" count_youth="p" type="button">
					</span>
				</td>
			</tr>
			<!-- 좌석선택하는 곳 -->
			<tr>
				<td><div id="seatDisp" style="width: 150px;"></div></td>
			</tr>
		</table>
	</form>
</div>


<%@ include file="../mainFloor.jsp" %>
</body>
</html>