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
		$.post('${path}/rDelete', sendData, function(data) {
			alert("댓글이 삭제되었습니다");
			$('#rvListDisp').html(data);
		});
	}
	
	function rUpdate(m_num, re_num) {
		var txt = $('#td_' + re_num).text();
		$('#td_' + re_num).html("<textarea rows='3' cols='30' id='rt'>" + 
				txt + "</textarea>");
		$('#btn_' + re_num).html("<input type='button' onclick='up(" + 
			m_num + "," + re_num + ")' class='btn btn-sm btn-danger'" + 
			"value='확인'> <input type='button' onclick='lst(" + 
			 bno + ")' class='btn btn-info btn-sm' value='취소'>");
	}
	
	function up(m_num, re_num) {
		var sendData = 're_con=' + $('#rt').val() + 
			'&m_num=' + m_num + '&re_num=' + re_num;
		$.post('${path}/rUpdate', sendData, function(data) {
			alert('수정 되었습니다');
			$('#rvListDisp').html(data);
		});
	}
	
	function lst(m_num) {
		$('#rvListDisp').load('${path}/movie/replyList/m_num/' + m_num);
	}
</script>
</head>
<body>
	<div>
		<input type="hidden" name="member_id" value="${member_id}">
		<c:if test="${member_id != null}">
			<form action="" name="frm" id="frm">
				<input type="hidden" name="re_grade" value="0"/>
				<input type="hidden" name="m_num" value="${movie.m_num}">
				<h2 class="text-primary">한줄평 작성</h2>
				<table class="table table-striped">
					<tr>
						<td>
							${member_id}
						</td>
						<td class="rating" align="center">
				           	<div class="ratefill"></div>
				               	<input type="checkbox" name="re_grade" id="rating1" value="1" class="rate_radio">
				                <label for="rating1"></label>
				                <input type="checkbox" name="re_grade" id="rating2" value="2" class="rate_radio">
				                <label for="rating2"></label>
				                <input type="checkbox" name="re_grade" id="rating3" value="3" class="rate_radio" >
				                <label for="rating3"></label>
				                <input type="checkbox" name="re_grade" id="rating4" value="4" class="rate_radio">
				                <label for="rating4"></label>
				                <input type="checkbox" name="re_grade" id="rating5" value="5" class="rate_radio">
				                <label for="rating5"></label>
						</td>
						<td>
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
	<c:if test="${empty rvList}">
		<table class="table table-striped">
			<tr>
				<td colspan="5">아직 리뷰가 없습니다. 리뷰를 남겨주세요.</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${not empty rvList}">
		<table class="table table-striped">
			<c:forEach var="rv" items="${rvList}">
				<c:if test="${rv.re_del == 'y'}">
					<tr>
						<td colspan="4">삭제된 댓글입니다</td>
					</tr>
				</c:if>
				<c:if test="${rv.re_del != 'y'}">
					<tr>
						<!-- 작성자 -->
						<td>${rv.member_id}</td>
						<!-- 평점 -->
						<td>${rv.grade}점</td>
						<!-- 댓글 -->
						<td id="td_${rv.re_num}">${rv.re_con}</td>
						<!-- 작성일 -->
						<td>${rv.re_date}</td>
						<c:if test="${rv.member_id == mem.member_id}">
							<td id="btn_${rv.re_num}">
								<button class="btn btn-warning btn-sm" 
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
</body>
</html>