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
			<c:if test="${empty list}">
				<div>게시글이 없습니다</div>
			</c:if>
		</div>
		<div>
			<c:if test="${not empty list}">
				<div class="box-image" >
		            <a href="movie_view.do">
		            	<span class="thumb-image">
		                	<%-- <img alt="" src="resources/images/m_poster/${m_poster}">
		                    <img alt="" src="resources/images/m_rank/${m_rank}"> --%>
		                </span>
		            </a>
		            <span class="screentype">
		                            
		            </span>
		        </div>
		        <div class="box-contents">
		        	<a href="movieView.do?m_title=${movie.m_title}">
		            	<strong class="title">영화 제목<!-- ${m_title} --></strong>
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
		                    <%-- ${movie.m_opendate} --%>
		                	<span><!-- 개봉 / 예정 / 재개봉 --></span>    
		                </strong>
		            </span>
		            <span class="like"> 
		            	<a class="link-reservation" href="#">예매</a>
		        	</span>
		    	</div> 
			</c:if>
		</div>
    	<div align="center">
			<a href="movieInsertForm.do">영화 추가</a>
		</div>
	</div>
</body>
</html>