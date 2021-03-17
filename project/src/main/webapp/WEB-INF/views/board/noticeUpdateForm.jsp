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

input {
	width: 770px;
}
</style>
</head>
<body>
	<%@ include file="../mainTop.jsp"%>
	<%@ include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<form action="noticeUpdate.do" method="post" name="frm">
			<input type="hidden" name="n_num" value="${notice.n_num }"> <input
				type="hidden" name="n_branch" value="${notice.n_branch }"> <input
				type="hidden" name="pageNum" value="${pageNum }">
			<table class="table table-borderd">
				<tr>
					<td colspan="4" align="center"><button type="button"
							class="btn btn-warning disabled btn-block" id="t">
							<h2>
								<b>NOTICE UPDATE</b>
							</h2>
						</button></td>
				</tr>
				<tr>
					<td align="center"><b>지점</b></td>
					<td><select name="n_branch" required="required"
						class="form-control">
							<c:forTokens var="i"
								items="전체,신촌,강남,용산,불광,대전,용인,수원,이천,쌍팔,용역,구리,미영" delims=",">
								<c:if test="${i==notice.n_branch }">
									<option selected="selected">${i }</option>
								</c:if>
								<c:if test="${i!=notice.n_branch }">
									<option>${i }</option>
								</c:if>
							</c:forTokens>
					</select></td>
					<td align="center"><b>제목</b></td>
					<td><input type="text" name="n_title" required="required"
						autofocus="autofocus" class="form-control"
						value="${notice.n_title }"></td>
				</tr>
				<tr>
					<td align="center"><b>내용</b></td>
					<td colspan="3"><textarea rows="5" cols="100"
							required="required" name="n_content" class="form-control">${notice.n_content }</textarea></td>
				</tr>
				<tr>
					<td colspan="4" align="center">

						<button type="submit" class="btn btn-outline-warning btn-lg">
							<b>UPDATE</b>
						</button>
						<button type="reset" class="btn btn-outline-warning btn-lg">
							<b>CANCLE</b>
						</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>