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
		$('#rvListDisp').load('${path}/reviewList/m_num/${movie.m_num}');
		$('#rInsert').click(function() {
			var sendData = $('#frm').serialize();
			$.post('${path}/rInsert', sendData, function(data) {
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
		<div id="rvListDisp"><!-- 한줄평 --></div>
	</div>
	<div><%@include file="../mainFloor.jsp" %></div>
</body>
</html>