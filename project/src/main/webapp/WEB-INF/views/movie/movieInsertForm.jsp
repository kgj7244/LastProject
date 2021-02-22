<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 추가</title>
<script type="text/javascript">
	function numChk() {
		if(!frm.m_num.value){
			alert("영화번호를 입력하고 중복 확인을 누르세요");
			frm.m_num.focus();
			return false;
		}
	
		$.post("numChk.do", "m_num=" + frm.m_num.value, function(data){
			$('#disp').html(data);
		});
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<form action="movieInsert.do" method="post" name="frm" enctype="multipart/form-data">
			<h2 class="text-primary">영화 추가</h2>
			<input type="hidden" name="m_grade" value="0">
			<table class="table table-bordered">
				<tr>
					<th>영화 번호</th>
					<td>
						<input type="number" name="m_num"
							required="required" autofocus="autofocus">
						<input type="button" onclick="numChk()" class="btn btn-warning btn-sm" value="중복 확인">
						<div id="disp" class="err"></div>
					</td>
					<th>장르</th>
					<td>
						<select name="m_genre">
							<option value="판타지">판타지</option>
							<option value="공포/스릴러">공포/스릴러</option>
							<option value="로맨스">로맨스</option>
							<option value="액션">액션</option>
							<option value="드라마">드라마</option>
							<option value="애니메이션">애니메이션</option>
							<option value="뮤지컬">뮤지컬</option>
							<option value="SF">SF</option>
							<option value="에로">에로</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>감독</th>
					<td>
						<input type="text" name="m_director" required="required">
					</td>
					<th>배우</th>
					<td>
						<input type="text" name="m_actor" required="required">
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">
						<input type="text" name="m_title" required="required">
					</td>
					
				</tr>	
				<tr>
					<th>내용</th>
					<td colspan="3">
						<textarea rows="20" cols="120" required="required" name="m_content"></textarea>
					</td>
				</tr>
				<tr>
					<th>개봉일</th>
					<td>
						<input type="date" name="m_opendate" required="required">
					</td>
					<th>상영 상태</th>
					<td>
						<input type="radio" name="m_state" value="yet" checked="checked">개봉예정
						<input type="radio" name="m_state" value="open">개봉
						<input type="radio" name="m_state" value="reopen">재개봉
						<input type="radio" name="m_state" value="close">상영종료
					</td>
				</tr>
				<tr>
					<th>상영시간</th>
					<td>
						<input type="number" name="m_time" required="required">
					</td>
					<th>관람 연령 등급</th>
					<td>
						<input type="radio" name="m_rank" value="전 연령" checked="checked">전 연령
						<input type="radio" name="m_rank" value="12세">12세
						<input type="radio" name="m_rank" value="15세">15세
						<input type="radio" name="m_rank" value="창불">청불
					</td>
				</tr>
				<tr>
					<th>
						포스터
						<span class="glyphicon glyphicon-picture"></span>
					</th>
					<td colspan="3">
						<input type="file" name="file" required="required">
					</td>
				</tr>
				<tr><td colspan="4" align="center"><input type="submit"></td></tr>
			</table>
		</form>
	</div>
</body>
</html>