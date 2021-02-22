<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 목록</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">영화</h2>
		<div>
			<c:if test="${empty movieList}">
				<div>게시글이 없습니다</div>
			</c:if>
		</div>
		<div>
			<c:if test="${not empty movieList}">
				<c:forEach var="movie" items="${movieList}">
					<div class="box-image">
			            <a href="movieView.do">
			            	<span class="thumb-image">
			                	<img alt="" src="resources/images/m_poster/${movie.m_poster}" height="100px">
			                </span>
			            </a>
			            
			        </div>
			        <div class="box-contents">
			        	<a href="movieView.do?m_title=${movie.m_title}">
			            	<strong class="title">${movie.m_title}</strong>
			            </a>
			            <div class="score">
			                <strong class="percent">
			                	예매율
			                	<span><!-- 예매율 수치 --></span>
			                </strong>
			                <div class='m_grade'>
								평점
			                	<span class='percent'><!-- 평점 수치 --></span>
			            	</div>
			            </div>
			            <span class="txt-info">
			               	<strong>
			                    ${movie.m_opendate}
			                	<span>
			                		<c:if test="${movie.m_state.equals('yet')}">개봉예정</c:if>
			                		<c:if test="${movie.m_state.equals('open')}">개봉</c:if>
			                		<c:if test="${movie.m_state.equals('reopen')}">재개봉</c:if>
			                		<c:if test="${movie.m_state.equals('close')}">상영종료</c:if>
			                	</span>    
			                </strong>
			            </span>
			            <span class="like"> 
			            	<a class="link-reservation" href="#">예매</a>
			        	</span>
			    	</div> 
				</c:forEach>
			</c:if>
		</div>
    	<div align="center">
			<a href="movieInsertForm.do">영화 추가</a>
		</div>
	</div>
</body>
</html>