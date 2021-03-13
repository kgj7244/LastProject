<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	var selectList = new Array(); // 좌석 담는곳
	var temporary = new Array(); //임시저장소
	var type;
	var $count;
	var $count1;
	var count_val; // 성인
	var count1_val; // 어린이
	var adult=0; //성인표 갯수
	var youth=0; //청소년 표 갯수
	var total=0; //표 토탈 갯수
	var totalPrice = 0;
	var mt_name = "${mt_name}";
	var listSeat2  = new Array(); //임시저장소
	var listSeat = "${st_name}";
	
	
	
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
					if(selectList.length > 0){
						if(confirm("선택하신 좌석을 모두 취소하고 다시 선택 하시겠습니까?")==true){
							location.reload();	
						}else{
							return false;
						}
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
					}
					if(selectList.length > 0){
						if(confirm("선택하신 좌석을 모두 취소하고 다시 선택 하시겠습니까?")==true){
							location.reload();	
						}else{
							return false;
						}
					}
					$count1.val(parseInt(count1_val) - 1);
					youth=parseInt(count1_val)-1;
					frm20.youth_ticket.value=youth;
					
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
		$('#adult').text("성인 "+adult+"명");
		$('#youth').text(" · 청소년 "+youth+"명");
		$('#totalPrice').text(totalPrice);
		$('#totalPrice1').text("원");
		frm20.totalPrice.value=totalPrice;
		
	}
	
	// 좌석뷰
	$(function() {
		if(mt_name=='1관'){
			$('#seatDisp').load('${path}/movieTheater50.do');
		}else if(mt_name=='2관'){
			$('#seatDisp').load('${path}/movieTheater70.do');
		}else if(mt_name=='3관'){
			$('#seatDisp').load('${path}/movieTheater80.do');
		}else if(mt_name=='4관'){
			$('#seatDisp').load('${path}/movieTheater90.do');
		}else if(mt_name=='5관'){
			$('#seatDisp').load('${path}/movieTheater100.do');
		}
	});
	
	function row(selectSeat) {
		if(total==0){
			alert('최소 한장 이상 구매를 하셔야 합니다.');
			return;
		}
		if(selectList.length <= total){ 
			var select = selectSeat; // 선택한 좌석
			if(selectList.indexOf(select) == -1){ 
				if(selectList.length < total){ // 값이 total 보다 작을때만  리스트에 추가하고  
					selectList.push(select); 	// 리스트에 추가 요기
					temporary.push(select); // 임시에도 추가로 넣어줌
					$("input[name='"+select+"']").css("background-color","#503396");
					$("input[name='"+select+"']").css("color","white");
				}else{ // total 값이 같거나 많을때 
					alert('구입하려는 수보다 많은 좌석을 클릭하셨습니다.');
					return;
				}
			}else{  
				selectList.splice(selectList.indexOf(select),1); // 리스트에서 삭제함
				$("input[name='"+select+"']").css("background-color","rgba(204, 197, 198, 0.9)");
				$("input[name='"+select+"']").css("color","write");
				
			}
			Seat()
		}
		else{
			alert('구입하려는 수보다 많은 좌석을 클릭하셨습니다.');
			return;
		}
	}
	

	function CountChk() {
		if(total==0){
			alert('최소 한장 이상 구매를 하셔야 합니다.');
			return false;
		}else if(total != selectList.length){
			alert('선택한 수만큼 좌석을 선택해주세요.');
			return false;
		}
	}
    function Seat() {
     	if(selectList.length < temporary.length){
			for(var i=0; i<temporary.length; i++){
				$("#rowSelect"+i).text("");
			}
    		for(var i=0; i<selectList.length; i++){
    			$("#rowSelect"+i).text(selectList[i]);
    		}
    		frm20.selectList1.value=selectList;
    	}else  if(selectList.length == temporary.length){
    		for(var i=0; i<temporary.length; i++){
    			$("#rowSelect"+i).text(selectList[i]);
    		}
    		frm20.selectList1.value=temporary;
    	}
	} 
</script>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>

<div class="container" align="center">
	<div align="left"><h2>빠른 예매</h2></div>
	<hr style="border: 0px; height: 3px; background-color: #cccccc;">
	<form action="payment.do" name="frm20" method="post" onsubmit="return CountChk()">
		<input type="hidden" name="totalPrice">
		<input type="hidden" name="selectList">
		<input type="hidden" name="adult_ticket">
		<input type="hidden" name="youth_ticket">
		<input type="hidden" name="m_title" value="${movie.m_title}">
		<input type="hidden" name="t_title" value="${theater.t_title}">
		<input type="hidden" name="mt_num2" value="${mt_num}">
		<input type="hidden" name="mt_name" value="${mt_name}">
		<input type="hidden" name="sc_num2" value="${sc_num}">
		<input type="hidden" name="selectList1">
		<input type="hidden" name="seat12" value="${st_name}">

		

		<table>
			<tr height="30px;">
				<td colspan="2" align="center" width="700px;" style="font-size: 20px; font-weight: bold; background-color: #F8F8F8; margin-top: 3px;">관람인원 선택</td>
				<!-- 오른쪽 정보 제공 창 -->
				<td rowspan="3" width="350px;" height="420px;" style="background-color: #333333;"> <!-- 오른쪽 창 3개 합친거 -->
					<table style="width:350px; height:420px;">
					
						<!-- 등급, 제목 -->
						<tr height="5%">
							<td width="10%"></td>
							<td width="10%" align="center" style="border-bottom: 1px; solid; red;">
								<c:choose>	
									<c:when test="${movie.m_rank == '전 연령'}">
										<img src="resources/images/m_rank/전체.png" height="20px" width="20px" >
									</c:when>								
								<c:when test="${movie.m_rank == '12세'}">
									<img src="resources/images/m_rank/12세.png" height="20px" width="20px">
								</c:when>									
								<c:when test="${movie.m_rank == '15세'}">
									<img src="resources/images/m_rank/15세.png" height="20px" width="20px">
								</c:when>									
								<c:when test="${movie.m_rank == '청불'}">
									<img src="resources/images/m_rank/청불.png" height="20px" width="20px">
								</c:when>							
								</c:choose>
							</td>
							<td colspan="3" width="80%" style="color:#FFFFFF; font-size:18px; text-shadow: 1px 0 #888371, 0 1px #888371,1px 0 #888371,0 1px #888371;">${movie.m_title}</td>			
						</tr>
						
						<!-- 애니메이션 -->
						<tr height="5%">
							<td></td>
							<td></td>
							<td colspan="3" style="font-size: 12px; color:#c4c4c4; text-shadow: 1px 0 #888371, 0 1px #888371,1px 0 #888371,0 1px #888371;">(${movie.m_genre})</td>
						</tr>
						
						<!-- 예매할 정보 -->
						<tr height="20%">
							<td width="10%"></td>
							<td colspan="2" width="40%" align="left" style="vertical-align:middle; color:#c4c4c4; font-size: 15px; text-shadow: 1px 0 #888371, 0 1px #888371,1px 0 #888371,0 1px #888371;">
								${theater.t_loc}(${theater.t_title}점)<br>
								${mt_name}<br>
								${screen.sc_date}<br><br>
								${screen.sc_start} ~ ${screen.sc_end}
							</td>
							<td colspan="2" width="50%" align="center"><img alt="보여줄 이미지가 없습니다." src="${path}/resources/images/m_poster/${movie.m_poster}" height="100px;" width="80px;"></td>
						</tr>
						
						<!-- 선택하신좌석 -->
						<tr>
							<td colspan="3"></td>
							<td colspan="2" align="center" style="color:#c4c4c4; text-shadow: 1px 0 #888371, 0 1px #888371,1px 0 #888371,0 1px #888371;">[선택하신좌석]</td>
						</tr>
						
						<!-- 좌석 -->
						<tr height="30%">
							<td colspan="3" width="50%" style="color:white; vertical-align:middle; font-weight: bold; border: 1px solid #FFFFFF;" align="center">
								<table>
									<tr>
										<td><img src="${path}/resources/images/home/좌석선택한거.png" width="20px;" height="20px;"></td>
										<td style="color:white;">&nbsp;&nbsp;선택</td>
									</tr>
									<tr>
										<td>　</td>
									</tr>
									<tr>
										<td><img src="${path}/resources/images/home/좌석예매불가.png" width="20px;" height="20px;"></td>
										<td style="color:white;">&nbsp;&nbsp;선택불가</td>
									</tr>
									<tr>
										<td>　</td>
									</tr>
									<tr>
										<td><img src="${path}/resources/images/home/좌석예매가능.png" width="20px;" height="20px;"></td>
										<td style="color:white;">&nbsp;&nbsp;일반</td>
									</tr>
								</table>
							</td>
							<td colspan="2" width="50%">
								<table class="table table-bordered" style="margin: 0px; padding: 0px; width: 210px;">
									<c:forEach var="i" begin="0" end="7" step="2">
										<tr height="40px;" style="vertical-align:middle;">
											<td width="50%" align="center"><span id="rowSelect${i}" style="vertical-align:middle; color:white;"></span></td>
											<td width="50%" align="center"><span id="rowSelect${i+1}" style="vertical-align:middle; color:white;"></span></td>
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
						
						<!-- 예매한 수 정보 -->
						<tr height="10%">
							<td></td>
							<td colspan="4" style="vertical-align:middle;" >
								<span id="adult" style="color:white;"></span>
								<span id="youth" style="color:white;"></span>
							</td>
						</tr>
						
						<!-- 최종금액 -->
						<tr height="10%">
							<td width="10%"></td>
							<td colspan="2" width="50%" style="color:white; font-weight: bold;">
								최종결제금액
							</td>
							<td align="right" width="30%">
								<span id="totalPrice" style="color:#329eb1; font-size: 25px; font-weight: bold;">0</span>
							</td>
							<td width="10%" style="color:white; text-shadow: 1px 0 #888371, 0 1px #888371,1px 0 #888371,0 1px #888371; font-weight: bold;" align="left">
								<span id="totalPrice1">원</span>
							</td>
						</tr>
						
						<!-- 결제 -->
						<tr height="20%">
							<td colspan="5" align="center"><input type="submit" value="결제하기" class="btn btn-warning btn-md"></td>
						</tr>
					</table>
				</td>
			</tr>
			<!-- 인원수 체크 -->
			<tr height="55px;">
				<td align="right" style="background-color: #F8F8F8; font-size: 15px; font-weight: bold;">
					성인&nbsp;
					<span id="count_adult">
  						<input value="-" count_adult="m" type="button" style="background-color: rgba(255, 255, 255, 0.0); border:none; border:1px solid #a4a4a4; margin: 0px; padding: 0px; width: 20px;">
  						<input class="count" value="0" readonly="" name="" id="text1" disabled="disabled" size="5px;" style="margin: 0px; padding: 0px; text-align: center;">
  						<input value="+" count_adult="p" type="button" style="background-color: rgba(255, 255, 255, 0.0); border:none; border:1px solid #a4a4a4; margin: 0px; padding: 0px; width: 20px;">
					</span>
				</td>
				<td align="left" style="background-color: #F8F8F8; font-size: 15px; font-weight: bold;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;청소년&nbsp;
					<span id="count_youth">
  						<input value="-" count_youth="m" type="button" style="background-color: rgba(255, 255, 255, 0.0); border:none; border:1px solid #a4a4a4; margin: 0px; padding: 0px; width: 20px;">
  						<input class="count1" value="0" readonly="" name="" disabled="disabled" size="5px;" style="margin: 0px; padding: 0px; text-align: center;">
  						<input value="+" count_youth="p" type="button" style="background-color: rgba(255, 255, 255, 0.0); border:none; border:1px solid #a4a4a4; margin: 0px; padding: 0px; width: 20px;">
					</span>
				</td>
			</tr>
			<!-- 좌석선택하는 곳 -->
			<tr>
				<td colspan="2"><div id="seatDisp" align="center"></div></td>
			</tr>
		</table>
	</form>
</div>


<%@ include file="../mainFloor.jsp" %>
</body>
</html>