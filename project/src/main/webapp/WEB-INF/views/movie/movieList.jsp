<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row" style="margin-top: 70px; display: inline-block;">
		<input type="hidden" value="${movie.m_ing}">
		<c:if test="${not empty movieList}">
			<c:forEach var="movie" items="${movieList}">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
				    	<a href="movieView.do?m_num=${movie.m_num}">
				        	<img alt="${movie.m_poster}" src="resources/images/m_poster/${movie.m_poster}">
				    	</a>
				        <div class="caption">
				        	<div align="center">
					        	<h4 style="font-weight: bold;">
					           		<c:if test="${movie.m_rank.equals('전 연령')}"><img alt="전 연령" src="resources/images/m_rank/전체.png" height="22px" width="22px"></c:if>
						            <c:if test="${movie.m_rank.equals('12세')}"><img alt="12세" src="resources/images/m_rank/12세.png" height="22px" width="22px"></c:if>
						            <c:if test="${movie.m_rank.equals('15세')}"><img alt="15세" src="resources/images/m_rank/15세.png" height="22px" width="22px"></c:if>
						            <c:if test="${movie.m_rank.equals('청불')}"><img alt="청불" src="resources/images/m_rank/청불.png" height="22px" width="22px"></c:if>        
						            <a href="movieView.do?m_num=${movie.m_num}" style="color:black; text-decoration: none;">${movie.m_title}</a>
							    </h4>
					    	</div>
						    <p align="center" style="font-size: 15px;">${movie.m_opendate}
						      	(<c:if test="${movie.m_state == '0'}">개봉예정</c:if>
								<c:if test="${movie.m_state == '1'}">개봉</c:if>
								<c:if test="${movie.m_state == '2'}">재개봉</c:if>
								<c:if test="${movie.m_state == '3'}">상영종료</c:if>) / ${movie.m_grade}</p>
							<div align="center">
								<a class="btn btn-danger" style="width: 230px; height: 40px; font-weight: bold; font-size: 15px; vertical-align:middle; bottom: 10px" 
									href="ticketMainForm.do">예매</a>
							</div>					       	
						</div>
				    </div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<div align="center">
		<ul class="pagination">
			<c:if test="${pb.startPage > pb.pagePerBlock}">
				<li>
					<a href="movieMainForm.do?pageNum=1&keyword=${movie.keyword}&m_ing=${movie.m_ing}">
					<span class="glyphicon glyphicon-backward"></span>
					</a>
				</li>
				<li>
					<a href="movieMainForm.do?pageNum=${pb.startPage - 1}&keyword=${movie.keyword}&m_ing=${movie.m_ing}">
						<span class="glyphicon glyphicon-triangle-left"></span>
					</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
				<c:if test="${pb.currentPage == i}">
					<li class="active">
						<a href="movieMainForm.do?pageNum=${i}&keyword=${movie.keyword}&m_ing=${movie.m_ing}">${i}</a>
					</li>
				</c:if>
				<c:if test="${pb.currentPage != i}">
					<li>
						<a href="movieMainForm.do?pageNum=${i}&keyword=${movie.keyword}&m_ing=${movie.m_ing}">${i}</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${pb.endPage < pb.totalPage}">
				<li>
					<a href="movieMainForm.do?pageNum=${pb.endPage + 1}&keyword=${movie.keyword}&m_ing=${movie.m_ing}">
						<span class="glyphicon glyphicon-triangle-right"></span>
					</a>
				</li>
				<li>
					<a href="movieMainForm.do?pageNum=${pb.totalPage}&keyword=${movie.keyword}&m_ing=${movie.m_ing}">
						<span class="glyphicon glyphicon-forward"></span>
					</a>
				</li>
			</c:if>
		</ul>
	</div>
</body>
</html>