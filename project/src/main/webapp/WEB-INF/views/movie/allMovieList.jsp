<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 전체 목록</title>
</head>
<body>
	<div><%@include file="../mainTop.jsp" %></div>
	<div><%@include file="../mainNav.jsp" %></div>
	<div class="container" align="center">
		<div align="left"><h2>영화 전체 목록</h2></div>
		<hr style="border: 0px; height: 3px; background-color: #cccccc;">
		<div align="right">
			<form action="allMovieList.do">
				<input type="hidden" name="pageNum" value="1">
				<select name="search">
					<c:forTokens var="sh" items="m_title, m_director" 
						delims="," varStatus="i">
						<c:if test="${sh == movie.search}">
							<option value="${sh}" selected="selected">${tit[i.index]}</option>
						</c:if>
						<c:if test="${sh != movie.search}">
							<option value="${sh}">${tit[i.index]}</option>
						</c:if>
					</c:forTokens>
				</select> 
				<input type="text" name="keyword" value="${movie.keyword}">
				<input type="submit" value="검색">
			</form>
		</div>
		<table class="table table-bordered table-striped">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>감독</td>
				<td>장르</td>
				<td>개봉일</td>
				<td>개봉상태</td>
				<td>수정여부</td>
			</tr>
			<c:forEach var="movie" items="${list}">
				<tr>
					<td>${movie.m_num}</td>
					<td>
						<a href="movieView.do?m_num=${movie.m_num}" style="text-decoration: none;  color: black;">
							${movie.m_title}</a>
					</td>
					<td>${movie.m_director}</td>
					<td>${movie.m_genre}</td>
					<td>${movie.m_opendate}</td>
					<td>${movie.m_state}</td>
					<td>
						<a class="btn btn-warning btn-sm"
							href="movieUpdateForm.do?m_num=${movie.m_num}">수정</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<a href="mypage.do" class="btn btn-info">관리자 페이지</a>
		<a href="movieInsertForm.do" class="btn btn-success">영화 추가</a>
		<div align="center">
			<ul class="pagination justify-content-center">
				<c:if test="${mpb.startPage > mpb.pagePerBlock}">
					<li>
						<a href="allMovieList.do?pageNum=1&search=${movie.search}&keyword=${movie.keyword}">
						<span class="glyphicon glyphicon-backward"></span>
						</a>
					</li>
					<li>
						<a href="allMovieList.do?pageNum=${mpb.startPage - 1}&search=${movie.search}&keyword=${movie.keyword}">
							<span class="glyphicon glyphicon-triangle-left"></span>
						</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${mpb.startPage}" end="${mpb.endPage}">
					<c:if test="${mpb.currentPage == i}">
						<li class="active">
							<a href="allMovieList.do?pageNum=${i}&search=${movie.search}&keyword=${movie.keyword}">${i}</a>
						</li>
					</c:if>
					<c:if test="${mpb.currentPage != i}">
						<li>
							<a href="allMovieList.do?pageNum=${i}&search=${movie.search}&keyword=${movie.keyword}">${i}</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${mpb.endPage < mpb.totalPage}">
					<li>
						<a href="allMovieList.do?pageNum=${mpb.endPage + 1}&search=${movie.search}&keyword=${movie.keyword}">
							<span class="glyphicon glyphicon-triangle-right"></span>
						</a>
					</li>
					<li>
						<a href="allMovieList.do?pageNum=${mpb.totalPage}&search=${movie.search}&keyword=${movie.keyword}">
							<span class="glyphicon glyphicon-forward"></span>
						</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
	<div><%@include file="../mainFloor.jsp" %></div>
</body>
</html>