<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<h2 class="text-primary">게시글 상세 내역</h2>
		<table class="table table-striped">
			<tr>
				<th>아이디</th>
				<td>${board.member_id }</td>
				<th>조회수</th>
				<td>${board.b_readcount}</td>
				<th>작성일</th>
				<td>${board.b_date}</td>
			</tr>
			<tr>
				<th>카테고리</th>
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
				<th>제목</th>
				<td colspan="5" align="center">${board.b_title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="7"><pre>${board.b_content }</pre></td>
			</tr>
			<tr>
				<td colspan="8">
					<%-- <a href="boardList.do?pageNum=${pageNum }"
					class="btn btn-info">게시글 목록</a> --%> <!-- 회원이 아니면 수정/삭제 버튼 안보이기 -->
					<c:if
						test="${board.member_id == member_id || member_id == 'master'}">
						<a
							href="boardUpdateForm.do?b_num=${board.b_num }&pageNum=${pageNum }"
							class="btn btn-warning">수정</a>
						<a href="boardDelete.do?b_num=${board.b_num }&pageNum=${pageNum }"
							class="btn btn-danger">삭제</a>

					</c:if>
			</tr>
		</table>
		<form action="" name="frm" id="frm">
			<!-- board.num을 숨겨서 넘겨 -->
			<input type="hidden" name="b_num" value="${board.b_num }"> <input
				type="hidden" name="pageNum" value="${pageNum }">
			<c:if test="${member.member_id == 'master' }">
				<h2 class="text-primary">댓글 작성</h2>
				<table class="table table-hover">
					<tr>
						<td>작성자</td>
						<td><input type="text" name="member_id"
							value="${member.member_id }" size="4" readonly="readonly"></td>
						<td>댓글</td>
						<td><textarea rows="2" cols="100" name="r_text"></textarea></td>
						<td><input type="button" value="입력" id="reInsert"
							class="btn btn-danger btn-sm"></td>
					</tr>
				</table>
			</c:if>
		</form>
		<div id="reBoardListDisp"></div>
		<div id="boardDisp"></div>
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>