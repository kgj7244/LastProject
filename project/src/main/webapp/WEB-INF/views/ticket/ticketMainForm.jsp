<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	@import url("${path}/resources/bootstrap/css/reset.css");
</style>

<script type="text/javascript">
	var Mchk =0; var Tchk =0; var Dchk =0; 
	var m_title1=""; var t_title1=""; var sc_date1=""; var mt_num1="";	var sc_num1="";
	function movieChk(m_title, m_poster) {
		$('#img').html("<img alt='"+m_poster+"' src='${path}/resources/images/m_poster/"+m_poster+"' height='100px;' width='80px;'>");
		/* $('#m_title').html("<input type='text' name='m_title' value='"+m_title+"' disabled='disabled' id='m_title'>"); */
		$('#m_title').text(m_title);
		/* $('#m_title').html("<input type='text' name='m_title' value='"+m_title+"' disabled='disabled' id='m_title'>"); */
		Mchk = 1;
		m_title1=m_title;
		frm1.m_title2.value=m_title1;
		ThreeSelect(m_title1);
	}
	function theaterChk(t_loc) {
		$.post("selectTheater.do","id="+t_loc, function(data) {
			$('#theaterSelect').html(data);
		});
	}
	function theaterSelectChk(t_title) {
		$('#t_title').text("극장 : "+t_title+"점");
		/* $('#t_title').html("<input type='text' name='t_title' value='"+t_title+"점' disabled='disabled' id='t_title'>"); */
		Tchk =1;
		t_title1=t_title;
		frm2.t_title2.value=t_title1;
		ThreeSelect(t_title1);
	}
	function date_pick() {
		$('#sc_date').text("날짜 : "+cal1.value);
		/* $('#sc_date').html("<input type='text' name='sc_date' value='"+cal1.value+"' disabled='disabled' id='sc_date'>"); */
		Dchk =1;
		sc_date1 = cal1.value;
		frm3.sc_date2.value=sc_date1;
		ThreeSelect(sc_date1);
	}
	function ThreeSelect(){
		if(Mchk==1&&Tchk==1&&Dchk==1){
			$.post("selectTime.do","m_title="+m_title1+"&t_title="+t_title1+"&sc_date="+sc_date1, function(data) {
				$('#selectTime').html(data);
			});
		}
	}
	function AllSelectChk(mt_num, sc_num, mt_name, sc_start){
		mt_num1 = mt_num;
		sc_num1 = sc_num;
		frm9.sc_start.value=sc_start;
		$('#mt_name').html("상영관 : "+mt_name);
		/* $('#mt_name').html("<input type='text' name='mt_name' value='"+mt_name+"' disabled='disabled' id='mt_name'>"); */
	}
	function Chk1() {
		if(frm1.m_title2.value==""||frm2.t_title2.value==""||frm3.sc_date2.value==""){
			alert("영화, 극장, 날짜, 시간대를 선택해주세요");
			return false; 
		}else{
			frm9.m_title2.value=frm1.m_title2.value; // 영화제목
			frm9.t_title2.value=frm2.t_title2.value; // 극장명
			frm9.sc_date2.value=frm3.sc_date2.value; // 날짜
			frm9.mt_num2.value=mt_num1; // 상영관 번호
			frm9.sc_num2.value=sc_num1; // 상영 번호
		}
	}
	
</script>

</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
<div class="container" align="center">
	<a href="screenInsertForm.do">상영 추가하기</a>
	<div style="margin-top: 50px;"> <!-- 선택창 -->
		<table class="table table-bordered" style="width: 1200px; height: 500px;">
			<tr height="40px;"><!-- 제목 -->
				<td style="background-color: #333333; color: #e9e9e9; font-weight: bold; vertical-align:middle;" align="center" height="35px;" width="30%" >영화</td>
				<td colspan="2" style="background-color: #333333; color: #e9e9e9; font-weight: bold;" align="center" width="20%">극장</td>
				<td style="background-color: #333333; color: #e9e9e9; font-weight: bold;" align="center" width="10%">날짜</td>
				<td style="background-color: #333333; color: #e9e9e9; font-weight: bold;" align="center" width="40%">시간</td>
			</tr>
			<tr height="auto;">
				
				<!-- 영화 -->
				<td style="overflow:auto;"> <!-- 안에 내용 -->
					<form action="selectMovie.do" method="post" name="frm1">
						<input type="hidden" name="m_title2">
						<table class="table table-hover" >
							<c:if test="${not empty movie}"> <!-- 값이 있으면 -->
								<c:forEach var="i" items="${movie}">
									<tr>
										<td align="left">
											<c:choose>
												<c:when test="${i.m_rank == '전체'}">
													<img src="resources/images/m_rank/전체.png" height="25px" width="25px" >
												</c:when>								
												<c:when test="${i.m_rank == '12세'}">
													<img src="resources/images/m_rank/12세.png" height="25px" width="25px">
												</c:when>									
												<c:when test="${i.m_rank == '15세'}">
													<img src="resources/images/m_rank/15세.png" height="25px" width="25px">
												</c:when>									
												<c:when test="${i.m_rank == '청불'}">
													<img src="resources/images/m_rank/청불.png" height="25px" width="25px">
												</c:when>							
											</c:choose>
											<input type="button" value="${i.m_title}" onclick="movieChk('${i.m_title}','${i.m_poster}')" style="background-color: rgba( 255, 255, 255, 0.0 ); border: none; padding: 10px;">
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${!not empty movie}"> <!-- 값이 없으면 -->
								<tr>
									<td>보여줄 영화가 없습니다</td>
								</tr>
							</c:if>
						</table>
					</form>
				</td>
				
				<!-- 극장 -->
				<td style="overflow:auto;">
					<table class="table table-hover"> 
						<c:if test="${not empty theater1}">
							<c:forEach var="i" items="${theater1}">
								<tr>
									<td width="100px;" align="center"><input type="button" value="${i.t_loc}" onclick="theaterChk('${i.t_loc}')" style="background-color: rgba( 255, 255, 255, 0.0 ); border: none; padding: 7px;"></td>
								</tr>
							</c:forEach> 	
						</c:if>
					</table>
				</td>
				
				<!-- 극장명 -->
				<td style="overflow:auto;">
					<form method="post" name="frm2">
						<input type="hidden" name="t_title2">
						<table class="table">
							<tr>
								<td width="170px;" align="center"><span id="theaterSelect"></span></td><!-- 극장 주소 선택시 그 해당 지점 리스트 출력하는곳 -->
							</tr>
						</table>
					</form>
				</td>
				
				<!-- 날짜 -->
				<td>
					<table class="table">
						<tr>
							<td>
								<input type="date" name="calendar" id = "cal1" onchange="date_pick(); " value="" style="border: none;" value="날짜를 입력해주세요">
							</td>
						</tr>
					</table>
				</td>
				
				<!-- 시간 -->
				<td style="overflow:auto;">
					<form method="post" name="frm3">
						<input type="hidden" name="sc_date2">
						<table class="table">
							<tr>
								<td><span id="selectTime"></span></td>
							</tr>
						</table>
					</form>
				</td>		
			</tr>
		</table>
	</div>
	<div> <!-- 결제창 -->
		<form action="paymentForm.do" method="post" onsubmit="return Chk1()" name="frm9" >
		<input type="hidden" name="m_title2">
		<input type="hidden" name="t_title2">
		<input type="hidden" name="sc_date2">
		<input type="hidden" name="mt_num2">
		<input type="hidden" name="sc_num2">
		<input type="hidden" name="sc_start">
			<table class="table" style="width: 1200px; height: 140px; background-color: #1d1d1c;"><!--background-color: #1d1d1c;  -->
				<tr>
					<td width="20%"></td>
					<td align="center" width="20%" style="vertical-align:middle; color: #cccccc"><span id="img" style="color: #cccccc; font-size: 30px;">영화선택</span><br><span id="m_title"></span></td>
					<td align="center" width="20%" style="vertical-align:middle;">
						<table>
							<tr>
								<td><span id="t_title" style="font-size:20px; color: #cccccc;"><span style="color: #cccccc; font-size: 30px;">극장선택</span></span></td>
							</tr>
							<tr>
								<td><span id="sc_date" style="font-size:20px; color: #cccccc;"></span></td>
							</tr>
							<tr>
								<td><span id="mt_name" style="font-size:20px; color: #cccccc"></span></td>
							</tr>
						</table>
					</td>
					<td width="20%" align="center" style="vertical-align:middle;"><input type="submit" value="결제" class="btn btn-info" style="padding :30px; 30px; font-size: 30px;"></td>
					<td width="20%"></td>
				</tr>
			</table>
		</form>
	</div>
</div>

<%@ include file="../mainFloor.jsp" %>
</body>
</html>