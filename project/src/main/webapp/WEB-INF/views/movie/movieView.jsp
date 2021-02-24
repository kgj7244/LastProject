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
		<div>
			<input type="hidden" name="member_id" value="${mem.member_id}">
			<input type="hidden" name="member_name" value="${mem.member_name}">
			<c:if test="${mem.member_id != null && mem.member_name != null}">
				<form action="" name="frm" id="frm">
					<input type="hidden" name="m_num" value="${movie.m_num}">
					<h2 class="text-primary">한줄평 작성</h2>
					<table class="table table-hover">
						<tr>
							<td>
								<input type="text" name="member_id"
									value="${mem.member_name}(${mem.member_id})" size="4">
							</td>
							<td>
								<input type="text">
							</td>
							<td>
								<textarea rows="3" cols="30"
									name="re_con"></textarea>
							</td>
							<td>
								<input type="button" value="댓글입력" id="rInsert">
							</td>
					</table>
				</form>
			</c:if>
		</div>
		<div id="gradedisp"><!-- 통계 --></div>
		<div id="rvListDisp"><!-- 한줄평 --></div>
	</div>
</body>
</html>