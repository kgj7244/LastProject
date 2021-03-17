<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#ta {
	margin-top: 60px;
	margin-bottom: 20px;
}

#rt {
	margin-bottom: 40px;
}

#t {
	padding-top: 15px;
	padding-bottom: 15px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#boardDisp').load('boardList.do table', 'pageNum=${pageNum}')
		$('#reBoardListDisp').load('reBoardList.do', 'b_num=${board.b_num}');
		$('#reInsert').click(function() {
			var sendData = $('#frm').serialize();
			$.post('reInsert.do', sendData, function(data) {
				alert("댓글이 작성 되었습니다");
				$('#reBoardListDisp').html(data);
				frm.r_text.value = ""; // 댓글 지우기
			});
		});
	});
</script>
</head>
<body>
	<%@ include file="../mainTop.jsp"%>
	<%@ include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<table class="table table-borderd" id="ta">
			<tr>
				<td colspan="6" align="center"><button type="button"
						class="btn btn-warning disabled btn-block btn-sm" id="t">
						<h2><b>Question & Answer Detail</b></h2>
					</button></td>
			</tr>
			<tr>
				<td colspan="8" align="right">
					<!-- 회원이 아니면 수정/삭제 버튼 안보이기 -->
					<c:if
						test="${board.member_id == member_id || member_id == 'master'}">
						<a
							href="boardUpdateForm.do?b_num=${board.b_num }&pageNum=${pageNum }"
							class="btn btn-outline-warning btn-lg"><b>UPDATE</b></a>
						<a href="boardDelete.do?b_num=${board.b_num }&pageNum=${pageNum }"
							class="btn btn-outline-warning btn-lg"><b>DELETE</b></a>

					</c:if>
			</tr>
			<tr align="center">
				<td>아이디</td>
				<td>${board.member_id }</td>
				<td>조회수</td>
				<td>${board.b_readcount}</td>
				<td>작성일</td>
				<td>${board.b_date}</td>
			</tr>
			<tr align="center">
				<td>카테고리</td>
				<c:if test="${board.b_code == 'mem' }">
					<td>회원</td>
				</c:if>
				<c:if test="${board.b_code == 'tk' }">
					<td>예매</td>
				</c:if>
				<c:if test="${board.b_code == 'st' }">
					<td>스토어</td>
				</c:if>
				<c:if test="${board.b_code == 'etc' }">
					<td>기타</td>
				</c:if>
				<td>제목</td>
				<td colspan="3" align="left">${board.b_title }</td>
			</tr>
			<tr>
				<td align="center">내용</td>
				<td colspan="5"><pre>${board.b_content }</pre></td>
			</tr>
		</table>
		<div id="reBoardListDisp"></div>
		<form action="" name="frm" id="frm">
			<!-- board.num을 숨겨서 넘겨 -->
			<input type="hidden" name="b_num" value="${board.b_num }"> <input
				type="hidden" name="pageNum" value="${pageNum }">
			<c:if test="${member_id == 'master' }">
			<h1 class="text-warning">REPLY</h1>
				<table class="table" id="rt">
					<tr>
						<td align="center">작성자</td>
						<td><input type="text" name="member_id"
							value="${member_id }" size="4" readonly="readonly" class="form-control"></td>
						<td align="center">댓글</td>
						<td><textarea rows="2" cols="100" name="r_text" class="form-control"></textarea></td>
						<th><input type="button" value="WRITE" id="reInsert"
							class="btn btn-outline-warning btn-lg"></th>
					</tr>
				</table>
			</c:if>
		</form>
		<div id="boardDisp"></div>
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>