<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row" style="margin-top: 70px;">
		<c:forEach var="i" begin="0" end="3" items="${movieList}">
		<div class="col-sm-6 col-md-3">
			<div class="thumbnail">
				<img src="${path}/resources/images/m_poster/${i.m_poster}" alt="사진없는거 아니여?" onclick='location.href="movieView.do?m_num=${i.m_num}"'>
				<div class="caption">
					<div align="center">
						<h4 style="font-weight: bold;">
							<a href="movieView.do?m_num=${i.m_num}" style="color:black;">${i.m_title}</a>
							<c:choose>
								<c:when test="${i.m_rank == '전 연령'}">
									<img src="resources/images/m_rank/전체.png" height="22px" width="22px" >
								</c:when>								
								<c:when test="${i.m_rank == '12세'}">
									<img src="resources/images/m_rank/12세.png" height="22px" width="22px">
								</c:when>									
								<c:when test="${i.m_rank == '15세'}">
									<img src="resources/images/m_rank/15세.png" height="22px" width="22px">
								</c:when>									
								<c:when test="${i.m_rank == '청불'}">
									<img src="resources/images/m_rank/청불.png" height="22px" width="22px">
								</c:when>							
							</c:choose>
						</h4>
					</div>
					<p align="center" style="font-size: 20px;">${i.m_opendate} / 평점</p>
					<div align="center">
						<a class="btn btn-default" role="button" style="width: 100px; height: 40px; font-weight: bold; font-size: 15px; vertical-align:middle;" href="#"><span class="glyphicon glyphicon-thumbs-up">좋아요</span></a>&nbsp;&nbsp;
						<a class="btn btn-primary" role="button" style="width: 150px; height: 40px; font-weight: bold; font-size: 15px; vertical-align:middle;" href="ticketMainForm.do">예매</a>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		<div class="col-sm-3" align="center">　</div> <!-- (ㅡ.ㅡ)? 아니 딱 12씩 맞췄는데 왜 3이 비냐고... 일단 공백(특수문자 공백임 사실상 값이 들어있음)으로 씀  -->
		<div class="col-sm-1" align="center">　</div>
		<div class="col-sm-10" align="center">
			<form action="movieMainForm.do">
				<table class="table table-bordered" style="background-color: gray;">
					<tr height="50px;">
						<td width="25%" align="center" style="vertical-align:middle;">
							<input type="hidden" name="m_ing" value="1">
							<input type="hidden" name="pageNum" value="1">
							<input type="text" name="keyword" value="${moive.keyword}" placeholder="영화 검색">
							<input type="submit" class="btn btn-warning btn-sm" value="검색">
						</td>
						<td width="25%" align="center" style="vertical-align:middle; font-weight: bold; font-size: 15px;"><a href="#" style="color:black; text-decoration:none;"><span class="glyphicon glyphicon-calendar"></span>상영시간표</a></td>
						<td width="25%" align="center" style="vertical-align:middle; font-weight: bold; font-size: 15px;"><a href="movieMainForm.do" style="color:black; text-decoration:none;"><span class="glyphicon glyphicon-film"></span>영화</a></td>
						<td width="25%" align="center" style="vertical-align:middle; font-weight: bold; font-size: 15px;"><a href="ticketMainForm.do" style="color:black; text-decoration:none;"><span class="glyphicon glyphicon-phone"></span>예매</a></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-sm-1" align="center">　</div>
	</div>
</body>
</html>