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
	<%@include file="../mainTop.jsp"%>
	<%@include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<table class="table table-borderd">
			<tr>
				<td colspan="6">
					<div align="left">
						<a href="noticeList.do" class="btn btn-outline-warning btn-lg"><b>NOTICE</b></a>
						<a href="boardInsertForm.do?b_num=0&pageNum=1"
							class="btn btn-outline-warning btn-lg"><b>WRITE</b></a>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6" align="center"><button type="button"
						class="btn btn-warning disabled btn-block btn-sm" id="t">
						<h2><b>Question & Answer</b></h2>
					</button></td>
			</tr>
			<tr>
				<td colspan="6"><div class="bgroup" align="right">
						<button type="button" class="btn btn-outline-warning btn-lg"
							onclick="location.href='boardList.do'"><b>전체</b></button>
						<button type="button" class="btn btn-outline-warning btn-lg"
							onclick="location.href='boardlistByb_code.do?b_code=tk'"><b>회원</b></button>
						<button type="button" class="btn btn-outline-warning btn-lg"
							onclick="location.href='boardlistByb_code.do?b_code=st'"><b>스토어</b></button>
						<button type="button" class="btn btn-outline-warning btn-lg"
							onclick="location.href='boardlistByb_code.do?b_code=etc'"><b>기타</b></button>
					</div></td>
			</tr>
			<c:set var="b_num" value="${no }"></c:set>
			<tr class="table-light" align="center">
				<th>번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>아이디</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<c:if test="${empty list }">
				<tr align="center">
					<th colspan="6">게시글이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="board" items="${list }">
					<tr>
						<td  align="center">${b_num}</td>
						<c:set var="b_num" value="${b_num -1}"></c:set>
						<c:if test="${board.b_del == 'y' }">
							<th colspan="6" align="center">삭제된 게시글입니다</th>
						</c:if>
						<c:if test="${board.b_del != 'y' }">
							<c:if test="${board.b_code == 'mem' }">
								<td align="center">회원</td>
							</c:if>
							<c:if test="${board.b_code == 'tk' }">
								<td align="center">예매</td>
							</c:if>
							<c:if test="${board.b_code == 'st' }">
								<td align="center">스토어</td>
							</c:if>
							<c:if test="${board.b_code == 'etc' }">
								<td align="center">기타</td>
							</c:if>
							<!-- 비밀글 설정시 제목에 자물쇠아이콘 나타내기 -->
							<c:if test="${board.b_password != null }">
								<c:if test="${member_id == 'master' }">
									<td title="${board.b_content }"><span
										class="glyphicon glyphicon-lock"></span> <a
										href="boardView.do?b_num=${board.b_num }&pageNum=${pb.currentPage}">${board.b_title }</a>
										<c:if test="${board.r_count > 0 }">
											<button class="btn btn-warning btn-sm">답변완료</button>
										</c:if></td>
								</c:if>
								<c:if test="${member_id != 'master'}">
									<td title="${board.b_content }"><span
										class="glyphicon glyphicon-lock"></span> <a
										href="boardViewForm.do?b_num=${board.b_num }&pageNum=${pb.currentPage}">${board.b_title }</a>
										<c:if test="${board.r_count > 0 }">
											<button class="btn btn-warning btn-sm">답변완료</button>
										</c:if></td>
								</c:if>
							</c:if>
							<c:if test="${board.b_password == null }">
								<td title="${board.b_content }"><a
									href="boardView.do?b_num=${board.b_num }&pageNum=${pb.currentPage}">${board.b_title }</a>
									<c:if test="${board.r_count > 0 }">
										<button class="btn btn-warning btn-sm">답변완료</button>
									</c:if></td>
							</c:if>
							<td align="center">${board.member_id }</td>
							<td align="center">${board.b_readcount }</td>
							<td align="center">${board.b_date }</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
			<tr align="center">
				<td colspan="6" align="center">
					<ul class="pagination pagination-sm">
						<c:if test="${pb.startPage > pb.pagePerBlock }">
							<li><a
								href="boardList.do?pageNum=1&search=${board.search }&keyword=${board.keyword}">
									<span class="glyphicon glyphicon-backward"></span>
							</a></li>
							<li><a
								href="boardList.do?pageNum=${pb.startPage-1 }&search=${board.search }&keyword=${board.keyword}">
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
				</td>
			</tr>
			<!-- 검색 -->
			<tr>
				<td colspan="6" align="center"><form action="boardList.do">
						<input type="hidden" name="pageNum" value="1"> <select
							name="search">
							<c:forTokens var="sh" items="member_id,b_title,b_content,subcon"
								delims="," varStatus="i">
								<c:if test="${sh == board.search }">
									<option value="${sh }" selected="selected">${tit[i.index] }</option>
								</c:if>
								<c:if test="${sh != board.search }">
									<option value="${sh }">${tit[i.index] }</option>
								</c:if>
							</c:forTokens>
						</select> <input type="text" name="keyword" value="${board.keyword }">
						<button type="submit" class="btn btn-outline-warning btn-lg"><b>SEARCH</b></button>
					</form></td>
			</tr>
		</table>
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>