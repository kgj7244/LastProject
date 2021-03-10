<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비리스트 | AAM</title>
<script type="text/javascript">
	$(document).ready(function(){
	    $("#chk_nowshow").change(function(){
	        if($("#chk_nowshow").is(":checked")){
	        	alert("체크되어있을 때");
	        }else{
	        	alert("체크 안되어있을 때");
	        }
	    });
	});
</script>

</head>
<body>
	<div><%@include file="../mainTop.jsp" %></div>
	<div><%@include file="../mainNav.jsp" %></div>
	<div class="container">
		<h2 class="text-primary">영화</h2>
		<div align="center">
			<c:if test="${sessionScope.member_id == 'master'}">
				<a href="movieInsertForm.do">영화 추가</a>
				<a href="allMovieList.do">영화 목록</a>
			</c:if>
		</div>
		<div class="nowshow">
        	<input type="checkbox" id="chk_nowshow"  title="현재 선택됨" checked/>
            <label for="chk_nowshow">현재 상영작만 보기</label>                
       	</div>
       	<div>
			<form action="movieMainForm.do">
				<input type="hidden" name="pageNum" value="1">
				영화 검색
				<input type="text" name="keyword" value="${moive.keyword}">
				<input type="submit" value="검색">
			</form>
       	</div>
       	<div id="view"></div>
		<div class="row" style="margin-top: 70px;">
			<c:if test="${not empty movieList}">
				<c:forEach var="movie" items="${movieList}">
					<c:if test="${movie.m_state != '3'}">
						<div class="col-sm-6 col-md-3">
							<div class="thumbnail">
					            <a href="movieView.do?m_num=${movie.m_num}">
					                <img alt="${movie.m_poster}" src="resources/images/m_poster/${movie.m_poster}" height="100px">
					            </a>
					            <div class="caption">
					            	<div align="center">
						            	<h4 style="font-weight: bold;">
						            		<c:if test="${movie.m_rank.equals('전 연령')}"><img alt="전 연령" src="resources/images/m_rank/전체.png" height="22px" width="22px"></c:if>
							                <c:if test="${movie.m_rank.equals('12세')}"><img alt="12세" src="resources/images/m_rank/12세.png" height="22px" width="22px"></c:if>
							                <c:if test="${movie.m_rank.equals('15세')}"><img alt="15세" src="resources/images/m_rank/15세.png" height="22px" width="22px"></c:if>
							                <c:if test="${movie.m_rank.equals('청불')}"><img alt="청불" src="resources/images/m_rank/청불.png" height="22px" width="22px"></c:if>        
							            	<a href="movieView.do?m_num=${movie.m_num}" style="text-decoration: none">
							            		<strong class="title" style="color: black;">${movie.m_title}</strong>
							            	</a>
							            </h4>
					            	</div>
					            	<p align="center" style="font-size: 15px;">${movie.m_opendate} / ${movie.m_grade}</p>
									<div align="center">
										<a class="btn btn-danger" style="width: 230px; height: 40px; font-weight: bold; font-size: 15px; vertical-align:middle;" 
											href="ticketMainForm.do">예매</a>
									</div>
					           	</div>
					        </div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
		<div align="center">
			<ul class="pagination">
				<c:if test="${pb.startPage > pb.pagePerBlock}">
					<li>
						<a href="movieMainForm.do?pageNum=1&keyword=${movie.keyword}">
						<span class="glyphicon glyphicon-backward"></span>
						</a>
					</li>
					<li>
						<a href="movieMainForm.do?pageNum=${pb.startPage - 1}&keyword=${movie.keyword}">
							<span class="glyphicon glyphicon-triangle-left"></span>
						</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
					<c:if test="${pb.currentPage == i}">
						<li class="active">
							<a href="movieMainForm.do?pageNum=${i}&keyword=${movie.keyword}">${i}</a>
						</li>
					</c:if>
					<c:if test="${pb.currentPage != i}">
						<li>
							<a href="movieMainForm.do?pageNum=${i}&keyword=${movie.keyword}">${i}</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${pb.endPage < pb.totalPage}">
					<li>
						<a href="movieMainForm.do?pageNum=${pb.endPage + 1}&keyword=${movie.keyword}">
							<span class="glyphicon glyphicon-triangle-right"></span>
						</a>
					</li>
					<li>
						<a href="movieMainForm.do?pageNum=${pb.totalPage}&keyword=${movie.keyword}">
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