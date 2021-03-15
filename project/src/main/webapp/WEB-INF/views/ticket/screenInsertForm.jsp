<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var cnt = 0;
	var loc = "";
	function theaterChk(t_loc) {
		$.post("selectTheater1.do","id="+t_loc, function(data) {
			$('#theaterSelect').html(data);
			loc = t_loc;
			cnt +=1;
			movieTheater();
		});
	}
	function theaterSelectChk(t_title) {
		$('#theaterSelectChk').text(t_title+"("+loc+")점 선택하셨습니다.");
		frm17.t_title.value=t_title;
		cnt +=1;
		movieTheater(frm17.t_title.value);
	}
	
	function movieTheater(t_title){
		if(cnt>=2){
			$.post("movieTheaterChk.do","t_title="+frm17.t_title.value, function(data) {
				$('#movieTheater').html(data);
			});
		}
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

<div class="container" align ="center" id="container1">
	<table class="table table-hover" style="margin-top: 30px;">
		<tr>
			<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; font-size: 30px; margin-top: 30px;">상영 추가</td>
		</tr>
	</table>
	<hr>
	<form action="screenInsert.do" method="post" name="frm17">
	    <input type="hidden" name="t_title">
		<table class="table table-bordered">
			<tr>
				<td width="50%" align="right" style="vertical-align:middle;">영화 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;">
					<select name="m_title" class="form-control">
						<c:forEach var="m" items="${movie}">
							<option value="${m.m_title}">${m.m_title}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">극장 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;">
					<c:if test="${not empty theater}">
						<c:forEach var="t" items="${theater}">
							<input type="button" value="${t.t_loc}" onclick="theaterChk('${t.t_loc}')" style="background-color: rgba( 255, 255, 255, 0.0 ); border: none; padding: 7px;">
						</c:forEach> 	
					</c:if>
					<div id="theaterSelect"></div>
					<div id="theaterSelectChk"></div>
				</td>
			</tr>
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">상영관 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;"><div id="movieTheater"><span style="color:red;">영화, 극장을 선택해주세요</span></div></td>
			</tr>
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">상영일 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;"><input type="date" name="sc_date"></td>
			</tr>
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">시작시간 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;"><input type="text" name="sc_start"></td>
			</tr>
			<tr>
				<td width="50%" align="right"style="vertical-align:middle;">종료시간 &nbsp;&nbsp;</td>
				<td width="50%" align="left"style="vertical-align:middle;"><input type="text" name="sc_end"></td>
			</tr>
			<tr height="50px;">
				<td colspan="2" align="center"><input type="button" class="btn btn-info btn-lg" value="Home" onclick="location.href='mypage.do'" value="메인으로">&nbsp;&nbsp; <input class="btn btn-warning btn-lg" type="submit" value="추가하기"></td>
			</tr>			
		</table>
	</form>
</div>

<%@include file="../mainFloor.jsp" %>
</body>
</html>