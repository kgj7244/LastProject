<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		//$('#date').trigger('click');
		$('#date').show('click');
	});
	function chk(m_title, m_poster) {
		$('#img').html("<img alt='이미지 보여지는지' src='${path}/resources/images/m_rank/m_poster.png'>");
		$('#title').html(m_title);
	}
	function chk2(t_loc) {
		$.post("selectTheater.do","id="+t_loc, function(data) {
			$('#test').html(data);
		});
		$.post("selectCalendar.do","id="+t_loc, function(data) {
			$('#test1').html(data);
		});
	}
	function chk3(t_title) {
		$('#t_title').html("극장 : "+t_title);
	}
	function dal() {
		var val = $('#date').val();
		if (val != null && val !=""){
			$('#sc_date').html("일시 : " + val);	
		}
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
										<td><input type="button" value="${i.m_title}" onclick="chk('${i.m_title}','${i.m_poster}')"></td>
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
				<td>
					<table class="table table-bordered"> 
						<c:if test="${not empty theater}">
							<c:forEach var="i" items="${theater1}">
								<tr>
									<td><input type="button" value="${i.t_loc}" onclick="chk2('${i.t_loc}')"></td>
								</tr>
							</c:forEach> 	
						</c:if>
							<!-- <td>서울()</td>
							<td>서울리스트</td> -->
					</table>
				</td>
				<td>
					<table>
						<tr>
							<td id="test"></td>
						</tr>
					</table>
				</td>
				<td>
					<table class="table table-bordered">
						<tr>
							 <!-- <td><input type="date" id="date" onclick="dal()" ></td> -->
							 <form id="frm" name="form1">
								<input type="date" name="calendar" id = "cal1" onchange="date_pick(); " value=""> <br>
									<script>
										function date_pick() {
											if(frm.cal1.value != null){
											document.getElementById('sc_date').innerHTML = "일시 : " + frm.cal1.value;
											}
										}
									</script>
							</form>
							<!--<td>
								  <script>
									  $( function() {
									    $( "#datepicker" ).datepicker();
									  } );
								 </script>
								
							</td> -->
						</tr>
					</table>
				</td>
				<td>
					<table class="table table-bordered">
						<tr>
							<td>조조/심야</td>
						</tr>
					</table>	
				</td>		
			</tr>
		</table>
	</div>
	<div> <!-- 결제창 -->
		<form>
			<table class="table table-bordered">
				<tr>
					<td><div id="img"></div><div id="title"></div></td>
					<td>
						<table>
							<tr>
								<td id="t_title">극장 : </td>
							</tr>
							<tr>
								<td id="sc_date">일시 : </td>
							</tr>
							<tr>
								<td id="t_title">상영관 : </td>
							</tr>
							<tr>
								<td id="t_title">인원 : </td>
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