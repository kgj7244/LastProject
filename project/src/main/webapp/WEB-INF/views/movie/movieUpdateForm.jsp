<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 수정</title>
</head>
<body>
	<div><%@include file="../mainTop.jsp" %></div>
	<div><%@include file="../mainNav.jsp" %></div>
	<div class="container" align="center">
		<form action="movieUpdate.do" method="post" name="frm" enctype="multipart/form-data">
			<h2 class="text-primary">영화 수정</h2>
			<input type="hidden" name="m_grade" value="${movie.m_grade}">
			<input type="hidden" name="m_num" value="${movie.m_num}">
			<table class="table table-bordered">
				<tr>
					<th>영화 번호</th>
					<td>
						${movie.m_num}
					</td>
					<th>장르</th>
					<td>
						<select name="m_genre" id="m_genre">						
							<c:forEach var="mv" items="${movieList}">
								<c:if test="${mv.m_genre == movie.m_genre}">
									<option value="${movie.m_genre}" selected="selected">
										${mv.m_genre}</option>
								</c:if>
								<c:if test="${mv.m_genre != movie.m_genre}">
									<option value="${movie.m_genre}">
										${mv.m_genre}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>감독</th>
					<td>
						<input type="text" name="m_director" required="required"
							value="${movie.m_director}">
					</td>
					<th>배우</th>
					<td>
						<input type="text" name="m_actor" required="required"
							value="${movie.m_actor}">
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">
						<input type="text" name="m_title" required="required"
							value="${movie.m_title}">
					</td>
					
				</tr>	
				<tr>
					<th>내용</th>
					<td colspan="3">
						<textarea rows="20" cols="120" required="required" name="m_content" >
							${movie.m_content}</textarea>
					</td>
				</tr>
				<tr>
					<th>개봉일</th>
					<td>
						<input type="date" name="m_opendate" required="required"
							value="${movie.m_opendate}">
					</td>
					<th>상영 상태</th>
					<td>
						<select name="m_state">
							<c:forEach var="mv" items="${movieList}">
								<c:if test="${mv.m_state == movie.m_state}">
									<option value="${movie.m_state}" selected="selected">
										${mv.m_state}</option>
								</c:if>
								<c:if test="${mv.m_state != movie.m_state}">
									<option value="${movie.m_state}">
										${mv.m_state}</option>
								</c:if>
							</c:forEach>
						</select>
						<!-- <input type="radio" name="m_state" value="개봉예정">개봉예정
						<input type="radio" name="m_state" value="개봉">개봉
						<input type="radio" name="m_state" value="재개봉">재개봉
						<input type="radio" name="m_state" value="상영종료">상영종료 -->
					</td>
				</tr>
				<tr>
					<th>상영시간</th>
					<td>
						<input type="number" name="m_time" required="required"
							value="${movie.m_time}">
					</td>
					<th>관람 연령 등급</th>
					<td>
						<select name="m_rank">
								<c:forEach var="mv" items="${movieList}">
									<c:if test="${mv.m_rank == movie.m_rank}">
										<option value="${movie.m_rank}" selected="selected">
											${mv.m_rank}</option>
									</c:if>
									<c:if test="${mv.m_rank != movie.m_rank}">
										<option value="${movie.m_rank}">
											${mv.m_rank}</option>
									</c:if>
								</c:forEach>
							</select>
						<!-- <input type="radio" name="m_rank" value="전 연령" checked="checked">전 연령
						<input type="radio" name="m_rank" value="12세">12세
						<input type="radio" name="m_rank" value="15세">15세
						<input type="radio" name="m_rank" value="창불">청불 -->
					</td>
				</tr>
				<tr>
					<th>
						포스터
						<span class="glyphicon glyphicon-picture"></span>
					</th>
					<td colspan="3">
						<input type="file" name="file" value="${movie.m_poster}">
						${movie.m_poster}
					</td>
				</tr>
				<tr>
					<th>
						포스터
						<span class="glyphicon glyphicon-picture"></span>
					</th>
					<td colspan="3">
						<c:forEach var="st" items="${list}">
							<input type="file" name="file1" value="${st.m_stillcut}">
					 		${st.m_stillcut}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<input type="submit" value="수정">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div><%@include file="../mainFloor.jsp" %></div>
</body>
</html>