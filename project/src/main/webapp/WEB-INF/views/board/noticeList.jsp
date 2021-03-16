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
	padding-top: 12px;
	padding-bottom: 12px;
}

.my.pagination>.active>a {
	background-color: #ffe194;
	border-color: #ffe194;
}
</style>
</head>
<body>
	<%@include file="../mainTop.jsp"%>
	<%@include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<table class="table table-borderd">
			<c:set var="n_num" value="${no }"></c:set>
			<tr>
				<td colspan="4" align="left"><c:if
						test="${member_id == 'master' }">
						<a href="noticeInsertForm.do?n_num=0&pageNum=1"
							class="btn btn-outline-warning btn-lg"><b>NOTICE WRITE</b></a>
					</c:if> <a href="boardList.do" class="btn btn-outline-warning btn-lg"><b>Question
							& Answer</b></a></td>
			</tr>
			<tr>
				<td colspan="4" align="center"><button type="button"
						class="btn btn-warning disabled btn-block" id="t">
						<h2>
							<b>NOTICE</b>
						</h2>
					</button></td>
			</tr>
			<!-- 검색 -->
			<tr>
				<td colspan="4" align="center">
					<form action="noticeList.do" class="form-inline pull-right">
						<input type="hidden" name="pageNum" value="1"> <select
							name="search" class="form-control">
							<c:forTokens var="sh" items="n_branch,n_title,n_content,n_subcon"
								delims="," varStatus="i">
								<c:if test="${sh == notice.search }">
									<option value="${sh }" selected="selected">${tit[i.index] }</option>
								</c:if>
								<c:if test="${sh != notice.search }">
									<option value="${sh }">${tit[i.index] }</option>
								</c:if>
							</c:forTokens>
						</select> &nbsp;<input type="text" name="keyword" class="form-control"
							value="${notice.keyword }"> &nbsp;
						<button type="submit" class="btn btn-outline-warning btn-lg">
							<b>SEARCH</b>
						</button>
					</form>
				</td>
			</tr>
			<tr class="table-light" align="center">
				<th>번호</th>
				<th>지점</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:if test="${empty list }">
				<tr align="center">
					<th colspan="4">공지사항이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="notice" items="${list }">
					<tr>
						<td align="center">${n_num}</td>
						<c:set var="n_num" value="${n_num -1}"></c:set>
						<c:if test="${notice.n_del == 'y' }">
							<th colspan="6" align="center">삭제된 공지사항입니다</th>
						</c:if>
						<c:if test="${notice.n_del != 'y' }">
							<td align="center">${notice.n_branch }</td>
							<td title="${notice.n_content }"><a
								href="noticeView.do?n_num=${notice.n_num }&pageNum=${pb.currentPage}"><button
										class="btn btn-warning btn-sm">공지</button> ${notice.n_title }</a></td>
							<td align="center">${notice.n_date }</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="4" align="center">
					<ul class="pagination my justify-content-center pagination-lg">
						<c:if test="${pb.startPage > pb.pagePerBlock }">
							<li class="page-item"><a class="page-link"
								href="noticeList.do?pageNum=1&search=${notice.search }&keyword=${notice.keyword}">
									<span class="glyphicon glyphicon-backward"></span>
							</a></li>
							<li class="page-item"><a class="page-link"
								href="noticeList.do?pageNum=${pb.startPage-1 }&search=${notice.search }&keyword=${notice.keyword}">
									<span class="glyphicon glyphicon-triangle-left"></span>
							</a></li>
						</c:if>
						<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
							<c:if test="${pb.currentPage == i }">
								<li class="page-item active"><a class="page-link"
									href="noticeList.do?pageNum=${i }&search=${notice.search }&keyword=${notice.keyword}">${i }</a></li>
							</c:if>
							<c:if test="${pb.currentPage != i }">
								<li class="page-item"><a class="page-link"
									href="noticeList.do?pageNum=${i }&search=${notice.search }&keyword=${notice.keyword}">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pb.endPage < pb.totalPage }">
							<li class="page-item"><a class="page-link"
								href="noticeList.do?pageNum=${pb.endPage+1 }&search=${notice.search }&keyword=${notice.keyword}">
									<span class="glyphicon glyphicon-triangle-right"></span>
							</a></li>
							<li class="page-item"><a class="page-link"
								href="noticeList.do?pageNum=${pb.totalPage }&search=${notice.search }&keyword=${notice.keyword}">
									<span class="glyphicon glyphicon-forward"></span>
							</a></li>
						</c:if>
					</ul>
				</td>
		</table>
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>