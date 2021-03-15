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

#ti {
	width: 910px;
}
</style>
</head>
<body>
	<%@ include file="../mainTop.jsp"%>
	<%@ include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<form action="noticeInsert.do" method="post" name="frm">
			<input type="hidden" name="n_num" value="${n_num }"> <input
				type="hidden" name="pageNum" value="${pageNum }">
			<table class="table table-borderd">
				<tr>
					<td colspan="4" align="center"><button type="button"
							class="btn btn-warning disabled btn-block" id="t">
							<h2>
								<b>NOTICE WRITE</b>
							</h2>
						</button></td>
				</tr>
				<tr>
					<td align="center"><b>지점</b></td>
					<td><select name="n_branch" required="required"
						class="form-control">
							<option id="n_branch" hidden="hidden"></option>
							<!-- 선택안했을시 required호출용 -->
							<option>전체</option>
							<option>신촌</option>
							<option>강남</option>
							<option>용산</option>
							<option>불광</option>
							<option>대전</option>
							<option>용인</option>
							<option>수원</option>
							<option>이천</option>
							<option>쌍팔</option>
							<option>용역</option>
							<option>구리</option>
							<option>미영</option>
					</select></td>
					<td align="center"><b>제목</b></td>
					<td><input type="text" id="ti" name="n_title" required="required"
						class="form-control" autofocus="autofocus"></td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td align="center"><b>내용</b></td>
					<td colspan="3"><textarea rows="5" cols="100"
							class="form-control" required="required" name="n_content"></textarea></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<button type="submit" class="btn btn-outline-warning btn-lg">
							<b>WRITE</b>
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