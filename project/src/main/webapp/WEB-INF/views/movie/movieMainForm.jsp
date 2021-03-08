<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비리스트 | AAM</title>
<style type="text/css">
	div.box-body{
	 	height: 270px;
		width: 210px;
		border-radius: 15px;
		display: inline-block;
		margin-top: 20px;
		margin-left: 20px;
		margin-bottom: 20px;
		position: relative;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		overflow: hidden;
	}
	.box-footer {
	  	position: absolute; 
	  	margin-top: 15px;
	  	margin-bottom: 6px;
	    bottom: 0; 
	    width: 314px;
	    font-size: 14px;
	    padding: 0 15px;
	}
</style>
</head>
<body>
	<div><%@include file="../mainTop.jsp" %></div>
	<div><%@include file="../mainNav.jsp" %></div>
	<div class="container" align="center">
		<h2 class="text-primary">영화</h2>
		<div align="center">
    		<!-- 나중에 관리자 적용되면 그때 master_id == 'master'로 변경 -->
    		<input type="hidden" name="member_id" value="${member_id}">
			<c:if test="${member_id == 'master'}">
				<a href="movieInsertForm.do">영화 추가</a>
			</c:if>
		</div>
		<div>
			<c:if test="${empty movieList}">
				<div>아직 영화가 없습니다</div>
			</c:if>
		</div>
		<div>
			<c:if test="${not empty movieList}">
				<c:forEach var="movie" items="${movieList}">
					<div class="box-body">
						<div class="box-header">
				            <a href="movieView.do?m_num=${movie.m_num}">
				                <img alt="${movie.m_poster}" src="resources/images/m_poster/${movie.m_poster}" height="100px">
				            </a>
				            <div class="rank">
				            	<c:if test="${movie.m_rank.equals('전 연령')}"><img alt="전 연령" src="resources/images/m_rank/전체.png" height="15px"></c:if>
				                <c:if test="${movie.m_rank.equals('12세')}"><img alt="12세" src="resources/images/m_rank/12세.png" height="15px"></c:if>
				                <c:if test="${movie.m_rank.equals('15세')}"><img alt="15세" src="resources/images/m_rank/15세.png" height="15px"></c:if>
				                <c:if test="${movie.m_rank.equals('청불')}"><img alt="청불" src="resources/images/m_rank/청불.png" height="15px"></c:if>        
				            </div>
				        </div>
				        <div class="box-contents">
				        	<a href="movieView.do?m_num=${movie.m_num}">
				            	<strong class="title">${movie.m_title}</strong>
				            </a>
				            <div class="score">
				            	예매율
				                <span><!-- 예매율 수치 --></span>
				            	/ 평점
				                <span class='percent'><!-- 평점 수치 --></span>
				            </div>
							<div class="state">
				            	${movie.m_opendate}
				               	<span>
				               		${movie.m_state}
				                </span>    
				            </div>
				    	</div>
				    	<div class="box-footer">
				    		<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
				    		<a href="ticketMainForm.do">예매</a>
				    	</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div><%@include file="../mainFloor.jsp" %></div>
</body>
</html>