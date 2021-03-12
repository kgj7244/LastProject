<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* function eventChk(e_num, member_id) {
		$('.content').click(function(){});
		$.post("eventOverChk.do", "member_id="+member_id+"&e_num="+e_num, function(data){
			$('#disp').html(data);
		});
	} */
</script>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
<div class="container" align="center">
	<h2>이벤트 상품 목록입니다.</h2>
	<%-- <form action="#" method="post">
		<table class="table table-bordered">
			<tr>
				<td>이벤트 번호</td>
				<td>이벤트 제목</td>
				<td>이벤트 종류</td>
				<td>할인금액</td>
				<td>사진</td>
			</tr>
			<tr>
				<c:forEach var ="i" items="${eventList}">
					<td>${i.e_num}</td>
					<td>${i.e_title}</td>
					<td>${i.e_state}</td>
					<td>${i.e_sale}</td>
					<td>${i.e_poster}</td>
				</c:forEach>
			</tr>
		</table>
	</form>	 --%>
		<c:forEach var="i" begin="0" end="7" items="${eventList}">
			
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="${path}/resources/images/event/${i.e_poster}" alt="사진없는거 아니여?" width="230px;" height="300px;">
					<div class="caption">
						<div align="center">
							<h4 style="font-weight: bold;">
								<a href="#" style="color:black;">${i.e_title}</a>
							</h4>
						</div>
						<div align="center">
							<button id="" class="btn btn-primary" role="button" style="width: 150px; height: 40px; font-weight: bold; font-size: 15px; vertical-align:middle;" onclick="location.href='eventPart.do?e_num=${i.e_num}'">이벤트 참여하기</button>
							<%-- <button id="" class="btn btn-primary" role="button" style="width: 150px; height: 40px; font-weight: bold; font-size: 15px; vertical-align:middle;" onclick="eventChk(${i.e_num},'${member_id}')">이벤트 참여하기</button> --%>
						</div>
					</div>
				</div>
			</div>
			<c:if test="${i.e_num==4}"><p></c:if>
		</c:forEach>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>