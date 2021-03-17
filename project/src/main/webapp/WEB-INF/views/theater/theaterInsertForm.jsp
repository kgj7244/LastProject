<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 추가</title>
<script type="text/javascript">
	function TLocChk() {
		if(!frm.t_loc.value || !frm.t_title.value){
			alert("모든 정보를 입력해주세요.");
			frm.t_loc.focus();
			return false;
		}
		$.post("TLocChk.do","t_loc="+frm.t_loc.value+"&t_title="+frm.t_title.value, function(data) {
			$('#disp').html(data);
		})
	}
</script>
<style type="text/css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">
</style>
<style type="text/css">
	#container1{
		height: 750px;
	}
</style>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
	<div class="container" align="center" id="container1">
	<table class="table table-hover" style="margin-top: 30px;">
		<tr>
			<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; font-size: 30px; margin-top: 30px;">극장 추가</td>
		</tr>
	</table>
	<hr>
	<form action="theaterInsert.do" method="post" name="frm">
		<table class="table table-bordered">
			<tr>
				<td width="50%" align="right" style="vertical-align:middle;">지역 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;">
					<input type="text" name="t_loc" required="required" autofocus="autofocus">
					<input type="button" onclick="TLocChk()" class="btn btn-warning" value="중복 확인">
					<div id="disp" style="color: red;"></div>
				</td>
			</tr>
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">극장명 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;"><input type="text" name="t_title" required="required" autofocus="autofocus"></td>
				
			</tr>
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">주소 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;"><input type="text" name="t_addr" required="required"></td>
			</tr>
			
			
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">극장정보 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;"><input type="text" name="t_content" required="required"></td>
			</tr>
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">층별안내 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;"><input type="text" name="t_floor" required="required"></td>
			</tr>
			
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">전화번호 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;">
					<input type="tel" name="t_number" pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx" required="required">
				</td>
			</tr>
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">시설 안내 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;"><input type="text" name="t_gui" required="required"></td>
			</tr>
			<tr>
				<td align="center" colspan="3"><input type="button" value="목록" onclick="location.href='mypage.do'" class="btn btn-info btn-lg">&nbsp;&nbsp;<input type="submit" value="등록" class="btn btn-warning btn-lg"></td>
			</tr>	
		</table>
	</form>
	</div>

<%@include file="../mainFloor.jsp" %>
</body>
</html>