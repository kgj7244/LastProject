<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<h3 class="text-primary">게시글 작성</h3>
		<form action="boardInsert.do" method="post" name="frm">
		<input type="hidden" name="b_num" value="${b_num }">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="member_id" value="${member_id }">
		<table class="table table-borderd">
			<tr>
				<td>아이디</td>
				<td>${member_id }</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><select name="b_code" required="required">
						<option id="b_code" hidden="hidden"></option> <!-- 선택안했을시 required호출용 -->
						<option value='mem'>회원</option>
						<option value='tk'>예매</option>
						<option value='st'>스토어</option>
						<option value='etc'>기타</option>
					</select></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="b_title" required="required" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="40" required="required" name="b_content"></textarea></td>
			</tr>
			<tr>
				<td>비밀글 선택</td>
				<td><input type="radio" name="b_lock" id="unlock" value="unlock" checked onclick="set1(this.tr)"> 공개  &nbsp;<input type="radio" name="b_lock" id="lock" value="lock" onclick="set2(this.tr)"> 비공개 <td>
			</tr>
 			<tr id="act1" style="display:none">
				<td>비밀번호</td>
				<td><input type="password" name="b_password" disabled="disabled" ></td>
			</tr>
			<tr id="act2" style="display:none">
				<td>비밀번호</td>
				<td><input type="password" name="b_password" title="비공개 선택시 비번을 입력하세요"></td>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인" class="btn btn-warning"> &nbsp; <input type="reset" value="취소" class="btn btn-danger"></td>
			</tr>
		</table>
		</form> 
	</div>
	<%@ include file="../mainFloor.jsp" %>
</body>
</html>