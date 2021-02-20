<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$('#selectMovie').click(function(){
		$('#selectMovie1').hide();
	});
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
				<td>극장</td>
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
												<td><img src="resources/images/m_rank/전체.png" height="30px" width="30px"></td>
											</c:when>									
											<c:when test="${i.m_rank == 12}">
												<td><img src="resources/images/m_rank/12세.png" height="30px" width="30px"></td>
											</c:when>									
											<c:when test="${i.m_rank == 15}">
												<td><img src="resources/images/m_rank/15세.png" height="30px" width="30px"></td>
											</c:when>									
											<c:when test="${i.m_rank == 19}">
												<td><img src="resources/images/m_rank/청불.png" height="30px" width="30px"></td>
											</c:when>									
										</c:choose>
										<td><input type="button" id="selectMovie" value="${i.m_title}"></td>
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
						<tr>
							<td>서울(29)</td>
							<td>서울리스트</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="table table-bordered">
						<tr>
							<td>날짜 쫙~</td>
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
					<td>
						<%-- <div id="selectMovie1"><img alt="${movie.m_title}"src=""></div> --%>
					</td>
					<td>영화선택</td>
					<td>좌석선택</td>
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