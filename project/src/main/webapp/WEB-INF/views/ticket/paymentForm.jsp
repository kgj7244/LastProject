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
	var $count1;
	var count_val; // 성인
	var count1_val; // 어린이
	var adult=0; //성인표 갯수
	var youth=0; //청소년 표 갯수
	var total=0; //표 토탈 갯수
	var totalPrice = 0;
	
	$(document).ready(function() {
		$('#count_adult input[count_adult]').click(function(e) {
			e.preventDefault();
			type = $(this).attr('count_adult');
			$count = $(this).parent().children('input.count');
			count_val = $count.val(); // min 1
			if(total < 9){
				if (type == 'm') {
					if (count_val < 1) {
						return;
					}
					$count.val(parseInt(count_val) - 1);
					adult=parseInt(count_val)-1;
					frm20.adult_ticket.value=adult;
					
				} else if (type == 'p') {
					if(total >= 8){
						alert('예매는 8장까지');
						return;
					}else{
						if (count_val < 8) {
						$count.val(parseInt(count_val) + 1);
						adult = parseInt(count_val) + 1;
						frm20.adult_ticket.value=adult;
						}	
					}
				}
			}else{
				return;
			}
			MpTotal();
			PriceTotal();
		});
	});
	
	$(document).ready(function() {
		$('#count_youth input[count_youth]').click(function(e) {
			e.preventDefault();
			type = $(this).attr('count_youth');
			$count1 = $(this).parent().children('input.count1');
			count1_val = $count1.val(); // min 1
			if(total < 9){
				if (type == 'm') {
					if (count1_val < 1) {
						return;
					}else{
					$count1.val(parseInt(count1_val) - 1);
					youth=parseInt(count1_val)-1;
					frm20.youth_ticket.value=youth;
					}
				}else if (type == 'p') {
					if(total >= 8){
						alert('예매는 8장까지');
						return;
					}else{
						if (count1_val < 8) {
						$count1.val(parseInt(count1_val) + 1);
						youth = parseInt(count1_val) + 1;
						frm20.youth_ticket.value=youth;
						}
					}
				}
			}else{
				return;
			}
			MpTotal();
			PriceTotal();
		});
	});
	
	function MpTotal() {
		total = adult+youth; // total 합: 성인 + 어린이
		var Aprice = adult * 11000;
		var Yprice = youth * 8000;
		totalPrice = Aprice + Yprice;
	}
	function PriceTotal() {
		$('#adult').html("<input type='text' name='adult' value='성인 "+adult+"'명 disabled='disabled' id='adult'>");
		$('#youth').html("<input type='text' name='youth' value='청소년 "+youth+"'명 disabled='disabled' id='youth'>");
		$('#totalPrice').html("<input type='text' value='최종결제금액 "+totalPrice+"원' disabled='disabled' >");
		frm20.totalPrice.value=totalPrice;
		
	}
	
	// 좌석뷰
	$(function() {
		$('#seatDisp').load('${path}/movieTheater50.do');
	});
	
	function row(selectSeat) {
		if(total==0){
			alert('최소 한장 이상 구매를 하셔야 합니다.');
			return;
		}
		if(selectList.length <= total){ 
			var select = selectSeat;
			if(selectList.indexOf(select) == -1){ 
				if(selectList.length < total){ // 값이 total 보다 작을때만  리스트에 추가하고  
					selectList.push(select); 	// 리스트에 추가
				}else{ // total 값이 같거나 많을때 
					alert('구입하려는 수보다 많은 좌석을 클릭하셨습니다.');
					return;
				}
			}else{  
				selectList.splice(selectList.indexOf(select),1); // 리스트에서 삭제함
			}
			$('#rowSelect').html("<input type='text' value="+selectList+">");
			frm20.selectList.value=selectList;
		}
		else{
			alert('구입하려는 수보다 많은 좌석을 클릭하셨습니다.');
			return;
		}
	}
</script>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>

<div class="container" align="center">
	<h2>빠른 예매</h2>
	<hr>
	<form action="payment.do" name="frm20" method="post">
		<input type="hidden" name="totalPrice">
		<input type="hidden" name="selectList">
		<input type="hidden" name="adult_ticket">
		<input type="hidden" name="youth_ticket">
		<input type="hidden" name="m_title" value="${movie.m_title}">
		<input type="hidden" name="t_title" value="${theater.t_title}">
		<input type="hidden" name="mt_num2" value="${mt_num}">
		<input type="hidden" name="sc_num2" value="${sc_num}">

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
							<td colspan="2">
								<span id="adult"></span>
								<span id="youth"></span><p>
								<span id="totalPrice">최종결제금액 0원</span>
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="결제하기"></td>
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
				<td><div id="seatDisp" style="width: 100px;"></div></td>
			</tr>
		</table>
	</form>
</div>


<%@ include file="../mainFloor.jsp" %>
</body>
</html>