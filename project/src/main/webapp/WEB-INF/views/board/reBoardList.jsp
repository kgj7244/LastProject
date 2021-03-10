<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function reDelete(b_num,r_num) {
		var sendData = 'b_num='+b_num+'&r_num='+r_num;
		$.post('reDelete.do', sendData, function(data) {
			alert("댓글이 삭제되었습니다");
			$('#reBoardListDisp').html(data);
		});
	}
	function reUpdate(b_num,r_num) {
		var txt = $('#td_'+r_num).text();
		$('#td_'+r_num).html("<textarea rows='2' cols='100' id='rt'>"+
				txt+"</textarea>");
		$('#btn_'+r_num).html("<input type='button' onclick='up("+
				b_num+","+r_num+")' class='btn btn-sm btn-danger'"+
				"value='확인'> <input type='button' onclick='lst("+
				b_num+")' class='btn btn-info btn-sm' value='취소'>");
	}
	function up(b_num,r_num) {
		var sendData = 'r_text='+$('#rt').val()+
			'&b_num='+b_num+'&r_num='+r_num;
		$.post('reUpdate.do', sendData, function(data) {
			alert('댓글이 수정 되었습니다');
			$('#reBoardListDisp').html(data);
		});
	}
	/* 수정취소시 */
	function lst(b_num) {
		$('#reBoardListDisp').load('reBoardList.do','b_num=${b_num}');
	}
</script>
</head>
<body>
	<c:if test="${not empty rbList}">
		<table class="table table-striped">
				<tr>
					<td>작성자</td>
					<td>내용</td>
					<td>작성일</td>
					<td></td>
				</tr>
				<c:forEach var="rb" items="${rbList }">
					<c:if test="${rb.r_del == 'y' }">
						<tr>
							<td colspan="4">삭제된 댓글입니다</td>
						</tr>
					</c:if>
					<c:if test="${rb.r_del != 'y' }">
						<tr>
							<td>${rb.member_id }<!-- 작성자 --></td>
							<td id="td_${rb.r_num }">${rb.r_text }<!-- 댓글 --></td>
							<td>${rb.r_date }<!-- 작성일 --></td>
							<td id="btn_${rb.r_num }"><button class="btn btn-warning btn-sm" onclick="reUpdate(${rb.b_num},${rb.r_num})">수정</button>
								<button class="btn btn-danger btn-sm" onclick="reDelete(${rb.b_num},${rb.r_num})">삭제</button></td>
						</tr>
					</c:if>
				</c:forEach>
		</table>
	</c:if>
</body>
</html>