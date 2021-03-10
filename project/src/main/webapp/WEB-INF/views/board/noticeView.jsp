<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		$(function() {
			$('#noticeDisp').load('noticeList.do table', 'pageNum=${pageNum}')
		});
	</script>
	<%@ include file="../mainTop.jsp"%>
	<%@ include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<h2 class="text-primary">공지 상세 내역</h2>
		<table class="table table-striped">
			<tr>
				<th>지점</th>
				<td>${notice.n_branch }</td>
				<th>작성일</th>
				<td>${notice.n_date}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="5" align="center">${notice.n_title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="7"><pre>${notice.n_content }</pre></td>
			</tr>
			<tr>
				<td colspan="2">
					<%-- <a href="noticeList.do?pageNum=${pageNum }"
					class="btn btn-info">공지 목록</a> --%> <c:if
						test="${member_id == 'master' }">
						<a
							href="noticeUpdateForm.do?n_num=${notice.n_num }&pageNum=${pageNum }"
							class="btn btn-warning">수정</a>
						<a
							href="noticeDelete.do?n_num=${notice.n_num }&pageNum=${pageNum }"
							class="btn btn-danger">삭제</a>
					</c:if>
			</tr>
		</table>
		<div id="noticeDisp"></div>
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>