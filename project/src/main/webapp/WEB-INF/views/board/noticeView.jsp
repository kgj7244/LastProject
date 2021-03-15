<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table {
	margin-top: 60px;
}
#t {
	padding-top: 15px;
	padding-bottom: 15px;
}
</style>
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
		<table class="table table-borderd">
					<tr>
				<td colspan="6" align="center"><button type="button"
						class="btn btn-warning disabled btn-block btn-sm" id="t">
						<h2><b>NOTICE Detail</b></h2>
					</button></td>
			</tr>
						<tr>
				<td colspan="4" align="right">
					<%-- <a href="noticeList.do?pageNum=${pageNum }"
					class="btn btn-info">공지 목록</a> --%> <c:if
						test="${member_id == 'master' }">
						<a
							href="noticeUpdateForm.do?n_num=${notice.n_num }&pageNum=${pageNum }"
							class="btn btn-outline-warning btn-lg"><b>UPDATE</b></a>
						<a
							href="noticeDelete.do?n_num=${notice.n_num }&pageNum=${pageNum }"
							class="btn btn-outline-warning btn-lg"><b>DELETE</b></a>
					</c:if>
			</tr>
			<tr>
				<th>지점</th>
				<td>${notice.n_branch }</td>
				<th>작성일</th>
				<td>${notice.n_date}</td>
			</tr>
			<tr class="table-light">
				<th>제목</th>
				<td colspan="5" align="center">${notice.n_title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="7"><pre>${notice.n_content }</pre></td>
			</tr>
		</table>
		<div id="noticeDisp"></div>
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>