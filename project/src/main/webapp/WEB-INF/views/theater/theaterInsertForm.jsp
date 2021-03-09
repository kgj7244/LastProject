<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 추가</title>
<script type="text/javascript">
	function TnumChk() {
		if(!frm.t_num.value){
			alert("중복체크를 해주세요.");
			frm.t_num.focus();
			return false;
		}
		$.post("TnumChk.do","t_num=" +frm.t_num.value, function(data) {
			$('#disp').html(data);
		})
	}
</script>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
	<div class="container" align="center" >
	<h2>상영관 추가</h2>
	<form action="theaterInsert.do" method="post" name="frm">
		<table class="table table-bordered">
			<!-- <tr>
				<th>상영관 번호</th>
				<td>
					<input type="number" name="t_num" required="required" autofocus="autofocus">
					<input type="button" onclick="TnumChk()" class="btn btn-warning" value="중복 확인">
					<div id="disp" style="color: red;"></div>
				</td>
			</tr> -->
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="t_title" required="required" autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<th>지역</th>
				<td>
					<select name="t_loc">
					<c:forEach var="title" items="${titleList}">
						<option>${title.t_title}(${title.t_loc})</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>주소</th>
					<td>
						<input type="text" name="t_addr" required="required">
					</td>
			</tr>
			<tr>
				<th>전화번호</th>
					<td>
						<input type="text" name="t_number" required="required">
					</td>
			</tr>
			<tr>
				<th>시설 안내</th>
					<td>
						<input type="text" name="t_gui" required="required">
					</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="submit" value="등록">
				</td>
			</tr>	
		</table>
	</form>
	</div>




<%@include file="../mainFloor.jsp" %>
</body>
</html>