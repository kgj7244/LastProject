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
	width: 800px;
}
</style>
<script type="text/javascript">
	function set1(tr){
		document.all["act1"].style.display = "";
		document.all["act2"].style.display = "none";
	}
	function set2(tr){
		document.all["act1"].style.display = "none";
		document.all["act2"].style.display = "";
	}
	function frm_submit(f){
		return true;
		}
</script>
</head>
<body>
<%@ include file="../mainTop.jsp" %>
<%@ include file="../mainNav.jsp" %>
	<div class="container" align="center">
		<form action="boardInsert.do" method="post" name="frm">
		<input type="hidden" name="b_num" value="${b_num }">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="member_id" value="${member_id }">
		<table class="table table-borderd">
						<tr>
					<td colspan="4" align="center"><button type="button"
							class="btn btn-warning disabled btn-block" id="t">
							<h2>
								<b>BOARD WRITE</b>
							</h2>
						</button></td>
				</tr>
			<tr>
				<td align="center"><b>아이디</b></td>
				<td>${member_id }</td>
			</tr>
			<tr>
				<td align="center"><b>카테고리</b></td>
				<td><select name="b_code" required="required" class="form-control">
						<option id="b_code" hidden="hidden"></option> <!-- 선택안했을시 required호출용 -->
						<option value='mem'>회원</option>
						<option value='tk'>예매</option>
						<option value='st'>스토어</option>
						<option value='etc'>기타</option>
					</select></td>
				<td align="center"><b>제목</b></td>
				<td><input type="text" id="ti" class="form-control" name="b_title" required="required" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td align="center"><b>내용</b></td>
				<td colspan="4"><textarea rows="5" cols="100" required="required" name="b_content" class="form-control"></textarea></td>
			</tr>
			<tr>
				<td align="center"><b>비밀글 선택</b></td>
				<td><input type="radio" name="b_lock" id="unlock" value="unlock" checked onclick="set1(this.tr)"> 공개  &nbsp;<input type="radio" name="b_lock" id="lock" value="lock" onclick="set2(this.tr)"> 비공개 <td>
			</tr>
 			<tr id="act1" style="display:none">
				<td>비밀번호</td>
				<td><input type="password" name="b_password" disabled="disabled" class="form-control"></td>
			</tr>
			<tr id="act2" style="display:none">
				<td>비밀번호</td>
				<td><input type="password" name="b_password" title="비공개 선택시 비번을 입력하세요" class="form-control"></td>
			<tr>
				<td colspan="4" align="center">
						<button type="submit" class="btn btn-outline-warning btn-lg">
							<b>WRITE</b>
						</button>
						<button type="reset" class="btn btn-outline-warning btn-lg">
							<b>CANCLE</b>
						</button>			</tr>
		</table>
		</form> 
	</div>
	<%@ include file="../mainFloor.jsp" %>
</body>
</html>