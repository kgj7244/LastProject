<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한줄평 작성</title>
<script type="text/javascript">
	function rDelete(m_num, re_num) {
		var sendData = 'm_num=' + m_num + '&re_num=' + re_num;
		var cf = confirm("정말로 삭제하시겠습니까?");
		
		if (cf) {
			$.post('${path}/rDelete.do', sendData, function(data) {
				alert("댓글이 삭제되었습니다");
				$('#rvListDisp').html(data);
			});
		}
		else alert("삭제가 취소되었습니다.");
	}
	
	function rUpdate(m_num, re_num) {
		var txt = $('#td_' + re_num).text();
		
		$('#td_' + re_num).html("<textarea rows='3' cols='30' id='rt'>" + 
				txt + "</textarea>");
		
		$('#btn_' + re_num).html("<input type='button' onclick='up(" + 
			m_num + "," + re_num + ")' class='btn btn-sm btn-danger'" + 
			"value='확인'> <input type='button' onclick='lst(" + 
			 re_num + ")' class='btn btn-info btn-sm' value='취소'>");
	}
	
	function up(m_num, re_num) {
		var sendData = 're_con=' + $('#rt').val() +
			'&m_num=' + m_num + '&re_num=' + re_num;
		
		$.post('${path}/rUpdate.do', sendData, function(data) {
			alert('수정 되었습니다');
			$('#rvListDisp').html(data);
		});
	}

	function lst(m_num) {
		$('#rvListDisp').load('${path}/reviewList.do?m_num=${movie.m_num}');
	}
</script>
</head>
<body>
	<div class="container" align="center">
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
					<%-- <c:if test="${rv.re_del == 'y'}">
						<tr>
							<td colspan="4" align="center">삭제된 댓글입니다</td>
						</tr>
					</c:if> --%>
					<c:if test="${rv.re_del != 'y'}">
						<tr>
							<!-- 작성자 -->
							<td>${rv.member_id}</td>
							<!-- 평점 -->
<<<<<<< HEAD
							<td> 
								<%-- <c:if test="${rv.re_grade.equals('0')}">☆☆☆☆☆</c:if>
								<c:if test="${rv.re_grade.equals('1')}">★☆☆☆☆</c:if>
								<c:if test="${rv.re_grade.equals('2')}">★★☆☆☆</c:if>
								<c:if test="${rv.re_grade.equals('3')}">★★★☆☆</c:if>
								<c:if test="${rv.re_grade.equals('4')}">★★★★☆</c:if>
								<c:if test="${rv.re_grade.equals('5')}">★★★★★</c:if> --%>
								(${rv.re_grade} / 5)
							</td>
=======
							<td>${rv.re_grade}점</td>
>>>>>>> branch 'master' of https://github.com/kgj7244/LastProject.git
							<!-- 댓글 -->
							<td id="td_${rv.re_num}">${rv.re_con}</td>
							<!-- 작성일 -->
							<td>${rv.re_update}</td>
							<%-- <c:if test="${rv.member_id == sessionScope.member.id}"> --%>
								<td id="btn_${rv.re_num}">
									<button class="btn btn-warning btn-sm" 
										onclick="rUpdate(${rv.m_num}, ${rv.re_num})">수정</button>
									<button class="btn btn-danger btn-sm" 
										onclick="rDelete(${rv.m_num}, ${rv.re_num})">삭제</button>
								</td>
							<%-- </c:if> --%>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
</html>