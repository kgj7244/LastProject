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
	<div class="container" align="center">
		<h2 class="text-primary">영화 전체 목록</h2>
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
		<a href="#" class="btn btn-info">관리자 페이지</a>
	</div>
</body>
</html>