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
<%@ include file="../mainTop.jsp" %>
<%@ include file="../mainNav.jsp" %>
	<div class="container" align="center">
		<h2 class="text-primary">문의게시판</h2>
		<div class="bgroup">
			<a href="boardList.do">전체 </a> | <a
				href="boardlistByb_code.do?b_code=mem">회원</a> | <a
				href="boardlistByb_code.do?b_code=tk">예매</a> | <a
				href="boardlistByb_code.do?b_code=st">스토어</a> | <a
				href="boardlistByb_code.do?b_code=etc">기타</a>
			<p />
		</div>
		<c:set var="b_num" value="${no }"></c:set>
		<table class="table table-striped">
			<tr>
				<th>번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>아이디</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<th colspan="6">게시글이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="board" items="${list }">
					<tr>
						<td>${b_num}</td>
						<c:set var="b_num" value="${b_num -1}"></c:set>
						<c:if test="${board.b_del == 'y' }">
							<th colspan="4">삭제된 글입니다</th>
						</c:if>
						<c:if test="${board.b_del != 'y' }">
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
							<!-- 비밀글 설정시 제목에 자물쇠아이콘 나타내기 -->
							<c:if test="${board.b_password != null }">
								<td title="${board.b_content }"><span class="glyphicon glyphicon-lock"></span>
								<%-- <a href="boardViewForm.do?num=${board.b_num }&pageNum=${pb.currentPage}" class="btn btn-info btn-sm">${board.b_title }</a></td> --%>
								<a href="boardViewForm.do" class="btn btn-info btn-sm">${board.b_title }</a></td>
							</c:if>
							<c:if test="${board.b_password == null }">
								<td title="${board.b_content }"><a
									href="boardView.do?b_num=${board.b_num }&pageNum=${pb.currentPage}"
									class="btn btn-info btn-sm">${board.b_title }</a></td>
							</c:if>
							<td>${board.member_id }</td>
							<td>${board.b_readcount }</td>
							<td>${board.b_date }</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>	
		</table>
		<div align="center">
			<ul class="pagination">
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="boardList.do?pageNum=1&search=${board.search }&keyword=${board.keyword}">
						<span class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a href="boardList.do?pageNum=${pb.startPage-1 }&search=${board.search }&keyword=${board.keyword}">
							<span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<c:if test="${pb.currentPage == i }">
						<li class="active"><a
							href="boardList.do?pageNum=${i }&search=${board.search }&keyword=${board.keyword}">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a
							href="boardList.do?pageNum=${i }&search=${board.search }&keyword=${board.keyword}">${i }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a
						href="boardList.do?pageNum=${pb.endPage+1 }&search=${board.search }&keyword=${board.keyword}">
							<span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a
						href="boardList.do?pageNum=${pb.totalPage }&search=${board.search }&keyword=${board.keyword}">
							<span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
		<!-- 검색 -->
		<form action="boardList.do">
			<input type="hidden" name="pageNum" value="1"> 
			<select name="search">
				<c:forTokens var="sh" items="member_id,b_title,b_content,subcon" delims="," varStatus="i">
					<c:if test="${sh == board.search }">
						<option value="${sh }" selected="selected">${tit[i.index] }</option>
					</c:if>
					<c:if test="${sh != board.search }">
						<option value="${sh }">${tit[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
			<input type="text" name="keyword" value="${board.keyword }">
			<input type="submit" value="검색">
		</form>
		<div align="center">
			<a href="boardInsertForm.do?b_num=0&pageNum=1" class="btn btn-success">글쓰기</a>
			<a href="mainForm.do" class="btn btn-warning">HOME</a>
		</div>
	</div>
	<%@ include file="../mainFloor.jsp" %>
</body>
</html>