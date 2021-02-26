<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var Mchk =0; // 영화가 선택 시 +1이 됨
	var Tchk =0; // 극장 선택시+1
	var Dchk =0; // 날짜 선택시+1
	var m_title1="";
	var t_title1="";
	var sc_date1="";
	function movieChk(m_title, m_poster) {
		$('#img').html("<img alt='"+m_poster+"' src='${path}/resources/images/m_rank/"+m_poster+"'>");
		$('#title').html("<input type='text' name='m_title' value='"+m_title+"' disabled='disabled' id='m_title'>");
		Mchk = 1;
		m_title1=m_title;
		ThreeSelect(m_title1);
	}
	function theaterChk(t_loc) {
		$.post("selectTheater.do","id="+t_loc, function(data) {
			$('#theaterSelect').html(data);
		});
	}
	function theaterSelectChk(t_title) {
		$('#t_title').html("<input type='text' name='t_title' value='"+t_title+"' disabled='disabled' id='t_title'>");
		/* var a = "<input type='text' name='t_title' value='"+t_title+"' disabled='disabled' id='t_title'>"; */
		Tchk =1;
		t_title1=t_title;
		ThreeSelect(t_title1);
	}
	function date_pick() {
		$('#sc_date').html("<input type='text' name='sc_date' value='"+cal1.value+"' disabled='disabled' id='sc_date'>");
		Dchk =1;
		sc_date1 = cal1.value;
		ThreeSelect(sc_date1);
	}
	function ThreeSelect(){
		if(Mchk==1&&Tchk==1&&Dchk==1){
			$.post("selectTime.do","m_title="+m_title1+"&t_title="+t_title1+"&sc_date="+sc_date1, function(data) {
				$('#selectTime').html(data);
			});
		}
	}
	function AllSelectChk(sc_num) {
		$('#mt_num').html("<input type='text' name='mt_name' value='"+mt_name+"' disabled='disabled' id='mt_name'>");
	}
	
</script>

</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
<div class="container" align="center">
	<h2>빠른 예매</h2>
	<div> <!-- 선택창 -->
		<table class="table table-bordered">
			<tr><!-- 제목 -->
				<td>영화</td>
				<td colspan="2">극장</td>
				<td>날짜</td>
				<td>시간</td>
			</tr>
			<tr>
				<td> <!-- 안에 내용 -->
					<form action="selectMovie.do" method="post" name="frm1">
						<table class="table table-bordered"> 
							<c:if test="${not empty movie}"> <!-- 값이 있으면 -->
								<c:forEach var="i" items="${movie}">
									<tr>
										<c:choose>
											<c:when test="${i.m_rank == '전체'}">
												<td><img src="resources/images/m_rank/전체.png" height="30px" width="30px" ></td>
											</c:when>								
											<c:when test="${i.m_rank == '12'}">
												<td><img src="resources/images/m_rank/12세.png" height="30px" width="30px"></td>
											</c:when>									
											<c:when test="${i.m_rank == '15'}">
												<td><img src="resources/images/m_rank/15세.png" height="30px" width="30px"></td>
											</c:when>									
											<c:when test="${i.m_rank == '19'}">
												<td><img src="resources/images/m_rank/청불.png" height="30px" width="30px"></td>
											</c:when>							
										</c:choose>
										<td><input type="button" value="${i.m_title}" onclick="movieChk('${i.m_title}','${i.m_poster}')"></td>
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
				<td>
					<table class="table table-bordered"> 
						<c:if test="${not empty theater1}">
							<c:forEach var="i" items="${theater1}">
								<tr>
									<td><input type="button" value="${i.t_loc}" onclick="theaterChk('${i.t_loc}')"></td>
								</tr>
							</c:forEach> 	
						</c:if>
					</table>
				</td>
				<td>
					<table>
						<tr>
							<td id="theaterSelect"></td> <!-- 극장 주소 선택시 그 해당 지점 리스트 출력하는곳 -->
						</tr>
					</table>
				</td>
				<td>
					<table class="table table-bordered">
						<tr>
							<td>
								<input type="date" name="calendar" id = "cal1" onchange="date_pick(); " value="">
								<!-- <form id="frm" name="form1">
									<input type="date" name="calendar" id = "cal1" onchange="date_pick(); " value=""> <br>
								</form> -->
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="table table-bordered">
						<tr>
							<td><span id="selectTime"></span></td>
						</tr>
					</table>	
				</td>		
			</tr>
		</table>
	</div>
	<div> <!-- 결제창 -->
		<form action="payment.do" method="post" onclick="Chk1('${t_title.value()}','${m_title.value()}',${sc_date.value()})">
			<table class="table table-bordered">
				<tr>
					<td><div id="img"></div><div id="title"></div></td>
					<td>
						<table>
							<tr>
								<td id="t_title"></td>
							</tr>
							<tr>
								<td id="sc_date"></td>
							</tr>
							<tr>
								<td id="t_title"></td>
							</tr>
							<tr>
								<td id="t_title"></td>
							</tr>
						</table>
					</td>
					<td>결제선택</td>
					<td>결제</td>
					<td>결제하기</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>