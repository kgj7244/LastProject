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
	<%@include file="../mainTop.jsp"%>
	<%@include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<table class="table table-hover">
			<caption>
				<h2 class="text-primary" align="center">공지사항</h2>
			</caption>
			<tr>
				<td colspan="4" align="right"><c:if
						test="${member_id == 'master' }">
						<a href="noticeInsertForm.do?n_num=0&pageNum=1"
							class="btn btn-success btn-lg">공지 작성</a>
					</c:if> <a href="boardList.do" class="btn btn-warning btn-lg">문의게시판</a> <c:set
						var="n_num" value="${no }"></c:set></td>
			</tr>
			<tr>
				<th>번호</th>
				<th>지점</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<th colspan="4">공지사항이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="notice" items="${list }">
					<tr>
						<td>${n_num}</td>
						<c:set var="n_num" value="${n_num -1}"></c:set>
						<c:if test="${notice.n_del == 'y' }">
							<th colspan="6">삭제된 공지사항입니다</th>
						</c:if>
						<c:if test="${notice.n_del != 'y' }">
							<td>${notice.n_branch }</td>
							<td title="${notice.n_content }"><a
								href="noticeView.do?n_num=${notice.n_num }&pageNum=${pb.currentPage}"><button
										class="btn btn-danger btn-sm">공지</button> ${notice.n_title }</a></td>
							<td>${notice.n_date }</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="4" align="center">
					<ul class="pagination">
						<c:if test="${pb.startPage > pb.pagePerBlock }">
							<li><a
								href="noticeList.do?pageNum=1&search=${notice.search }&keyword=${notice.keyword}">
									<span class="glyphicon glyphicon-backward"></span>
							</a></li>
							<li><a
								href="noticeList.do?pageNum=${pb.startPage-1 }&search=${notice.search }&keyword=${notice.keyword}">
									<span class="glyphicon glyphicon-triangle-left"></span>
							</a></li>
						</c:if>
						<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
							<c:if test="${pb.currentPage == i }">
								<li class="active"><a
									href="noticeList.do?pageNum=${i }&search=${notice.search }&keyword=${notice.keyword}">${i }</a></li>
							</c:if>
							<c:if test="${pb.currentPage != i }">
								<li><a
									href="noticeList.do?pageNum=${i }&search=${notice.search }&keyword=${notice.keyword}">${i }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pb.endPage < pb.totalPage }">
							<li><a
								href="noticeList.do?pageNum=${pb.endPage+1 }&search=${notice.search }&keyword=${notice.keyword}">
									<span class="glyphicon glyphicon-triangle-right"></span>
							</a></li>
							<li><a
								href="noticeList.do?pageNum=${pb.totalPage }&search=${notice.search }&keyword=${notice.keyword}">
									<span class="glyphicon glyphicon-forward"></span>
							</a></li>
						</c:if>
					</ul>
				</td>
			</tr>
		</table>
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>