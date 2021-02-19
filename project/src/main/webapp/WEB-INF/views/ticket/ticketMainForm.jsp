<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div> <!-- 선택창 -->
		<table class="table table-bordered">
			<tr><!-- 제목 -->
				<td>영화</td>
				<td>극장</td>
				<td>날짜</td>
				<td>시간</td>
			</tr>
			<tr>
				<td> <!-- 안에 내용 -->
					<table class="table table-bordered"> 
						<tr>
							<td>등급</td>
							<td>제목</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="table table-bordered"> 
						<tr>
							<td>서울(29)</td>
							<td>서울리스트</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="table table-bordered">
						<tr>
							<td>날짜 쫙~</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="table table-bordered">
						<tr>
							<td>조조/심야</td>
						</tr>
					</table>	
				</td>		
			</tr>
		</table>
	</div>
	<div> <!-- 결제창 -->
		<form>
			<table class="table table-bordered">
				<tr>
					<td>영화선택</td>
					<td>좌석선택</td>
					<td>결제선택</td>
					<td>결제</td>
					<td>결제하기</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>