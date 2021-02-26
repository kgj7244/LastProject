<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${movie.m_title} | 영화 상세 보기</title>

<script type="text/javascript">
	$(function() {
		//$('#gradedisp').load('${path}/grade/m_num/${movie.m_num}'); 통계부분
		$('#rvListDisp').load('${path}/reviewList.do?m_num=${movie.m_num}');
		$('#rInsert').click(function() {
			var sendData = $('#frm').serialize();
			$.post('${path}/rInsert.do', sendData, function(data) {
				alert('댓글이 작성되었습니다');
				$('#rvListDisp').html(data);
				frm.re_con.value = "";
			});
		});
	});
</script>
</head>
<body>
	<div><%@include file="../mainTop.jsp" %></div>
	<div><%@include file="../mainNav.jsp" %></div>
	<div class="container" align="center">
		<h2 class="text-primary">${movie.m_title}</h2>
		<div>
			<img alt="${movie.m_poster}" src="resources/images/m_poster/${movie.m_poster}" height="200px"><br>
			${movie.m_grade}<!-- 평점 --><br>
			<a class="link-reservation" href="#">예매</a>
		</div>
		<div>
			<table>
				<tr>
					<th>주요정보</th>
					<th>평점</th>
					<th>한줄평</th>
				</tr>
				<tr>
					<td colspan="3"><pre>${movie.m_content}</pre></td>
				</tr>
				<tr>
					<td colspan="3">
						감독 : ${movie.m_director}&nbsp;&nbsp;&nbsp;&nbsp;
						장르 : ${movie.m_genre}&nbsp;&nbsp;&nbsp;&nbsp;
						등급 : ${movie.m_rank}&nbsp;&nbsp;&nbsp;&nbsp;
						개봉일 : ${movie.m_opendate}<br>
						출연진 : ${movie.m_actor}
					</td>
				</tr>
			</table>
		</div>
		<div id="gradedisp"><!-- 통계 --></div>
		<div id="rvListDisp"><!-- 한줄평 리스트 --></div>
		<div class="review" align="center">
			<input type="hidden" name="member_id" value="${member_id}">
			<c:if test="${member_id != null}">
				<form action="" name="frm" id="frm">
					<input type="hidden" name="m_num" value="${movie.m_num}">
					<table class="table table-striped">
						<tr>
							<td>
								<input type="text" name="member_id" value="${member_id}">
							</td>
							<td>
								<select name="re_grade">
									<option value="5">★★★★★</option>
									<option value="4">★★★★☆</option>
									<option value="3">★★★☆☆</option>
									<option value="2">★★☆☆☆</option>
									<option value="1">★☆☆☆☆</option>
									<option value="0">☆☆☆☆☆</option>
								</select>
								<textarea rows="3" cols="70" name="re_con"></textarea>
							</td>
							<td>
								<input type="button" value="댓글 입력" id="rInsert">
							</td>
						</tr>
					</table>
				</form>
			</c:if>
		</div>
		<div align="center">
			<ul class="pagination">
				<c:if test="${rpb.startPage > rpb.pagePerBlock}">
					<li>
						<a href="${path}/reviewList.do?m_num=${movie.m_num}&pageNum=1">
						<span class="glyphicon glyphicon-backward"></span>
						</a>
					</li>
					<li>
						<a href="${path}/reviewList.do.do?m_num=${movie.m_num}&pageNum=${rpb.startPage - 1}">
							<span class="glyphicon glyphicon-triangle-left"></span>
						</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${rpb.startPage}" end="${rpb.endPage}">
					<c:if test="${rpb.currentPage == i}">
						<li class="active">
							<a href="${path}/reviewList.do?m_num=${movie.m_num}&pageNum=${i}">${i}</a>
						</li>
					</c:if>
					<c:if test="${rpb.currentPage != i}">
						<li>
							<a href="${path}/reviewList.do?m_num=${movie.m_num}&pageNum=${i}">${i}</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${rpb.endPage < rpb.totalPage}">
					<li>
						<a href="${path}/reviewList.do?m_num=${movie.m_num}&pageNum=${rpb.endPage+1}">
							<span class="glyphicon glyphicon-triangle-right"></span>
						</a>
					</li>
					<li>
						<a href="${path}/reviewList.do?m_num=${movie.m_num}&pageNum=${rpb.totalPage}">
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