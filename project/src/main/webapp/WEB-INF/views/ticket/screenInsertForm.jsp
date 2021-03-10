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
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>

<div class="container" align ="center">
	<h2>상영 추가 하기 폼</h2>
	<form action="screenInsert.do" method="post" name="frm17">
	    <input type="hidden" name="t_title">
		<table class="table table-bordered">
			<tr>
				<td>영화</td>
				<td>
					<select name="m_title">
						<c:forEach var="m" items="${movie}">
							<option value="${m.m_title}">${m.m_title}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>극장</td>
				<%-- <td>
					<select name="t_title">
						<c:forEach var="t" items="${theater}">
							<option>${t.t_title}(${t.t_loc})</option>
						</c:forEach>				
					</select>
				</td> --%>
				<td> 
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
				<td>상영관</td>
				<td>
					<div id="movieTheater"></div>
				</td>
			</tr>
			<tr>
				<td>상영일</td>
				<td><input type="date" name="sc_date"></td>
			</tr>
			<tr>
				<td>시작시간</td>
				<td><input type="text" name="sc_start"></td>
			</tr>
			<tr>
				<td>종료시간</td>
				<td><input type="text" name="sc_end"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="추가하기"><input type="button" value="Home" onclick="#"></td>
			</tr>			
		</table>
	</form>
</div>

<%@include file="../mainFloor.jsp" %>
</body>
</html>