<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${movie.m_title} | 영화 상세 보기</title>
<style type="text/css">
	div.header {
		position: -webkit-sticky;
		position:sticky;
		top:0;
		background-color: white;
	}
	.carousel {
		height: 400px;
	}
   	.carousel-control {
   		height: 405px;
		background: black !important;
        filter: none !important; 
    	progid: none !important;
	}
	
	.navbar-fixed-top  {
     -webkit-backface-visibility: hidden;
	}
</style> 
<script type="text/javascript">
	$(function() {
		$('#rInsert').click(function() {
			var sendData = $('#frm').serialize();
			$.post('rInsert.do', sendData, function(data) {
				alert('댓글이 작성되었습니다');
				location.reload();
				frm.re_con.value = "";
			});
		});
	});
	
	function rDelete(m_num, re_num) {
		var sendData = 'm_num=' + m_num + '&re_num=' + re_num;
		var cf = confirm("정말로 삭제하시겠습니까?");
		
		if (cf) {
			$.post('rDelete.do', sendData, function(data) {
				alert("댓글이 삭제되었습니다");
				location.reload();
			});
		}
		else alert("삭제가 취소되었습니다.");
	}
	
	function rUpdate(m_num, re_num) {
		var txt = $('#td_' + re_num).text();
		
		$('#td_' + re_num).html("<textarea rows='3' cols=90' id='rt'>" + 
				txt + "</textarea>");
		
		$('#btn_' + re_num).html("<input type='button' onclick='up(" + 
			m_num + "," + re_num + ")' class='btn btn-sm btn-danger'" + 
			"value='확인'> <input type='button' onclick='lst(" + 
			 re_num + ")' class='btn btn-info btn-sm' value='취소'>");
	}
	
	function up(m_num, re_num) {
		var sendData = 're_con=' + $('#rt').val() +
			'&m_num=' + m_num + '&re_num=' + re_num;
		
		$.post('rUpdate.do', sendData, function(data) {
			alert('수정 되었습니다');
			location.reload();
		});
	}

	function lst(m_num) {
		location.reload();
	}
</script>
</head>
<body>
	<div><%@include file="../mainTop.jsp" %></div>
	<div><%@include file="../mainNav.jsp" %></div>
	<div class="container">
		<div align="left"><h2>영화 상세</h2></div>
		<hr style="border: 0px; height: 3px; background-color: #cccccc;">
		<c:set var="tot" value="${tot}"></c:set>
		<c:set var="grade" value="${grade}"></c:set>
		<div style="height: 400px;">
			<div>
				<img alt="${movie.m_poster}" src="resources/images/m_poster/${movie.m_poster}" height="400px" align="left">
			</div>
			<div style="height: 400px;" class="jumbotron">
				<h2 class="display-4">
					${movie.m_title}
					<c:if test="${movie.m_state.equals('개봉')}">
						<span class="badge badge-pill badge-success">현재 상영 중</span>
					</c:if>
					<c:if test="${movie.m_state.equals('개봉예정')}">
						<span class="badge badge-pill badge-danger">상영 예정</span>
					</c:if>
					<c:if test="${movie.m_state.equals('상영종료')}">
						<span class="badge badge-pill badge-dark">상영 종료</span>
					</c:if>
				</h2>
				<hr class="my-4">
			<%-- <c:choose>
				<c:when test="${grade > 0}">
					<fmt:formatNumber value="${grade}" pattern=".00"/>
				</c:when>
				<c:otherwise>아직 평점이 없습니다. 평점을 등록해주세요</c:otherwise>
			</c:choose> --%>
				<p>감독 : ${movie.m_director}&nbsp;&nbsp;/&nbsp;&nbsp;배우 : ${movie.m_actor}</p>
				<p>장르 : ${movie.m_genre}&nbsp;&nbsp;/&nbsp;&nbsp;등급 : ${movie.m_rank}</p>
				<p>개봉일 : <fmt:formatDate value="${movie.m_opendate}" pattern="yyyy.MM.dd (E)"/></p>
				<p>평점 : ${movie.m_grade}점</p>
			<a class="btn btn-secondary" 
				style="width: 230px; height: 40px; font-weight: bold; font-size: 15px; vertical-align:middle; bottom: 0" 
				href="ticketMainForm.do">예매</a>
			<br><br>
			<c:if test="${sessionScope.member_id == 'master'}">
				<a href="movieUpdateForm.do?m_num=${movie.m_num}" class="btn btn-danger"
					style="width: 230px; height: 40px; font-weight: bold; font-size: 15px; vertical-align:middle; bottom: 0">영화 수정</a>
				<a href="allMovieList.do" class="btn btn-success"
					style="width: 230px; height: 40px; font-weight: bold; font-size: 15px; vertical-align:middle; bottom: 0">영화 전체 목록</a>
			</c:if>
			</div>
		</div>
		<div class="header navbar navbar-fixed-top" role="navigation">
			<table class="table table-hover table-bordered">
				<tr class="table-warning">
					<th><a href="#content" style="text-decoration: none; color: black">주요정보</a></th>
					<th><a href="#stillcut" style="text-decoration: none; color: black">스틸컷</a></th>
					<th><a href="#review" style="text-decoration: none; color: black">한줄평</a></th>
				</tr>
			</table>
		</div>
		<h2 class="display-4" id="content">줄거리</h2>
		<hr class="my-4">
		<div class="jumbotron" style="white-space:pre;">
			<p>${movie.m_content}</p>		
		</div>
		<%-- <div class="jumbotron" style="white-space:pre;">
			<p>${movie.m_content}</p>		
		</div> --%>
		<h2 class="display-4" id="stillcut" align="left">스틸컷</h2>
		<hr class="my-4">
		<div class="jumbotron">
			<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false" align="center">
			   <div class="carousel-inner" role="listbox" style="width: 105%; height: 500px !important;">
					<c:forEach var="st" items="${list}" begin="0" end="0">
				        <div class="item active">	
							<img alt="" src="resources/images/stillcut/${st.m_stillcut}" class="d-block">
						 </div>
					</c:forEach>
					<c:forEach var="st" items="${list}" begin="1">
				        <div class="item">
							<img alt="" src="resources/images/stillcut/${st.m_stillcut}" class="d-block">
						 </div>
					</c:forEach>
				    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
				      <span class="glyphicon glyphicon-chevron-left"></span>
				      <span class="sr-only">Previous</span>
				    </a>
				    <a class="right carousel-control" href="#myCarousel" data-slide="next">
				      <span class="glyphicon glyphicon-chevron-right"></span>
				      <span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
		<h2 class="display-4" id="review" align="left">한줄평</h2>
		<hr class="my-4">
		<div class="jumbotron" id="rvListDisp">
			<p>${movie.m_title}에 대한 ${tot}개의 이야기가 있어요!</p>
			<c:if test="${empty rvList}">
				<table class="table table-striped">
					<tr>
						<td colspan="5" align="center">아직 리뷰가 없습니다. 리뷰를 남겨주세요.</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${not empty rvList}">
				<table class="table table-striped">
					<c:forEach var="rv" items="${rvList}">
						<c:if test="${rv.re_del != 'y'}">
							<tr>
								<!-- 작성자 -->
								<td>${rv.member_id}</td>
								<!-- 평점 -->
								<td width="50px">${rv.re_grade}점</td>
								<!-- 댓글 -->
								<td id="td_${rv.re_num}" style="word-break:break-all">${rv.re_con}</td>
								<!-- 작성일 -->
								<td>
									<fmt:formatDate value="${rv.re_update}" pattern="yy.MM.dd HH:mm"/>
								</td>
								<c:if test="${rv.member_id == sessionScope.member_id or sessionScope.member_id == 'master'}">
									<td id="btn_${rv.re_num}">
										<button class="btn btn-success btn-sm" 
											onclick="rUpdate(${rv.m_num}, ${rv.re_num})">수정</button>
										<button class="btn btn-danger btn-sm" 
											onclick="rDelete(${rv.m_num}, ${rv.re_num})">삭제</button>
									</td>
								</c:if>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</c:if>
		</div>
		<div class="review" align="center">
			<input type="hidden" name="member_id" value="${member_id}">
			<c:if test="${member_id != null and member_id != 'master'}">
				<form action="" name="frm" id="frm">
					<input type="hidden" name="m_num" value="${movie.m_num}">
					<table class="table table-striped">
						<tr>
							<td>
								<input type="text" name="member_id" value="${member_id}" readonly="readonly">
							</td>
							<td>
								<select name="re_grade">
									<option value="5" selected="selected">★★★★★</option>
									<option value="4">★★★★☆</option>
									<option value="3">★★★☆☆</option>
									<option value="2">★★☆☆☆</option>
									<option value="1">★☆☆☆☆</option>
									<option value="0">☆☆☆☆☆</option>
								</select>
							</td>
							<td>
								<textarea rows="3" cols="90" name="re_con" 
									placeholder="'${movie.m_title}' 재미있게 보셨나요?&#13;&#10;영화의 어떤 점이 좋았는지 500자 이내로 이야기해주세요."></textarea>
							</td>
							<td>
								<input type="button" value="댓글 입력" id="rInsert" class="btn btn-warning">
							</td>
						</tr>
					</table>
				</form>
			</c:if>
		</div>
		<div align="center">
			<ul class="pagination justify-content-center">
				<c:if test="${rpb.startPage > rpb.pagePerBlock}">
					<li>
						<a href="movieView.do?m_num=${movie.m_num}&pageNum=1">
						<span class="glyphicon glyphicon-backward"></span>
						</a>
					</li>
					<li>
						<a href="movieView.do?m_num=${movie.m_num}&pageNum=${rpb.startPage - 1}">
							<span class="glyphicon glyphicon-triangle-left"></span>
						</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${rpb.startPage}" end="${rpb.endPage}">
					<c:if test="${rpb.currentPage == i}">
						<li class="active">
							<a href="movieView.do?m_num=${movie.m_num}&pageNum=${i}">${i}</a>
						</li>
					</c:if>
					<c:if test="${rpb.currentPage != i}">
						<li>
							<a href="movieView.do?m_num=${movie.m_num}&pageNum=${i}">${i}</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${rpb.endPage < rpb.totalPage}">
					<li>
						<a href="movieView.do?m_num=${movie.m_num}&pageNum=${rpb.endPage+1}">
							<span class="glyphicon glyphicon-triangle-right"></span>
						</a>
					</li>
					<li>
						<a href="movieView.do?m_num=${movie.m_num}&pageNum=${rpb.totalPage}">
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