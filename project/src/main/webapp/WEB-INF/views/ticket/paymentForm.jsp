<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>

<div class="container" align="center">
	<h2>빠른 예매</h2>
	<hr>
	<form>
		<table class="table table-bordered">
			<tr>
				<td>관람인원 선택</td>
				<!-- 오른쪽 정보 제공 창 -->
				<td rowspan="3">
					<table class="table table-bordered">
						<tr>
							<td colspan="2">영화제목</td>
						</tr>
						<tr>
							<td>
								서울(신촌점)<br>
								1관<br>
								날짜<br>
								시간
							</td>
							<td>이미지</td>
						</tr>
						<tr>
							<td>좌석 설명</td>
							<td>선택 좌석</td>
						</tr>
						<tr>
							<td colspan="2">최종 금액</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>성인 몇명, 청소년 몇명</td>
				<td></td><!-- 공백 -->
			</tr>
			<!-- 좌석선택하는 곳 -->
			<tr>
				<td>그림 쫙~</td>
				<td></td><!-- 공백 -->
			</tr>
		</table>
	</form>
</div>


<%@ include file="../mainFloor.jsp" %>
</body>
</html>