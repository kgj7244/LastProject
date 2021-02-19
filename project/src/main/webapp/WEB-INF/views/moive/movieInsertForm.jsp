<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 추가</title>
</head>
<body>
	<div class="container" align="center"> -->
		<form action="movieinsert.do" method="post" enctype="multipart/form-data">
			<h2 class="text-primary">영화 추가</h2>
			<table class="table table-bordered">
				<tr>
					<td>영화 번호</td>
					<td>
						<input type="text" name="m_num"
							required="required" autofocus="autofocus">
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="m_title" required="required">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="100" cols="100" 
							required="required" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td>개봉일</td>
					<td>
						<input type="date" name="m_opendate" required="required">
					</td>
				</tr>
				<tr>
					<td>관람 연령 등급</td>
					<td>
						<input type="" name="m_rank" required="required">
					</td>
				</tr>
				<tr>
					<td>상영 상태</td>
					<td>
						<input type="" name="m_state" required="required">
					</td>
				</tr>
				<tr>
					<td>
						포스터
						<span class="glyphicon glyphicon-picture"></span>
					</td>
					<td>
						<input type="file" name="m_poster" required="required">
					</td>
				</tr>
				<tr><td colspan="2"><input type="submit"></td></tr>
			</table>
		</form>
	</div>
</body>
</html>