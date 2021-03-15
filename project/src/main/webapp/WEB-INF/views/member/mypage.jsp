<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	margin-top: 25px;
}

#ml {
	font-size: large;
	font-color: black;
}

.text-warning {
	margin-top: 50px;
}
</style>
<script type="text/javascript">
	function del() {
		var con = confirm("정말 탈퇴하시겠습니까?");
		if (con)
			location.href = "memberDelete.do";
		else {
			alert("탈퇴가 취소되었습니다");
			return;
		}
	}
</script>
</head>
<body>
	<%@ include file="../mainTop.jsp"%>
	<%@ include file="../mainNav.jsp"%>
	<div class="container" align="center">
		<c:if test="${member.member_id == 'master' }">
			<h1 class="text-warning">관리자 페이지</h1>
			<table class="table table">
				<tr>
					<td align="center"><button type="submit"
							class="btn btn-warning btn-lg"
							onclick="location.href='masterMemberList.do'" id="ml">
							<b>회원 관리</b>
						</button></td>
					<td align="center"><button type="submit"
							class="btn btn-warning btn-lg"
							onclick="location.href='noticeInsertForm.do?n_num=0&pageNum=1'"
							id="ml">
							<b>공지 추가</b>
						</button></td>
					<td align="center"><button type="submit"
							class="btn btn-warning btn-lg"
							onclick="location.href='eventList.do'" id="ml">
							<b>이벤트 관리</b>
						</button></td>
				</tr>
				<tr>
					<td align="center"><button type="submit"
							class="btn btn-warning btn-lg"
							onclick="location.href='screenInsertForm.do'" id="ml">
							<b>상영 추가</b>
						</button></td>
					<td align="center"><button type="submit"
							class="btn btn-warning btn-lg" onclick="location.href='theaterInsertForm.do'"
							id="ml">
							<b>극장 추가</b>
						</button></td>
					<td align="center"><button type="submit"
							class="btn btn-warning btn-lg"
							onclick="location.href='eventInsertForm.do'" id="ml">
							<b>이벤트 추가</b>
						</button></td>
				</tr>
				<tr>
					<td align="center"><button type="submit"
							class="btn btn-warning btn-lg" onclick="location.href='movieTheaterInsertForm.do'"
							id="ml">
							<b>상영관 추가</b>
						</button></td>
					<td align="center"><button type="submit"
							class="btn btn-warning btn-lg" onclick="location.href='allMovieList.do'"
							id="ml">
							<b>영화 목록</b>
						</button></td>
					<td align="center"><button type="submit"
							class="btn btn-warning btn-lg" onclick="location.href='master_Storelist.do'"
							id="ml">
							<b>스토어 상품 목록</b>
						</button></td>
				</tr>
			</table>
		</c:if>
		<c:if test="${member.member_id != 'master' }">
			<h1 class="text-warning">${member.member_id }님 환영합니다</h1>
			<table class="table table">
				<tr align="center">
					<td><button type="submit" class="btn btn-warning btn-lg"
							onclick="location.href='memberView.do'" id="ml">
							<b>회원정보조회</b>
						</button></td>
				</tr>
				<tr align="center">
					<td><button type="submit" class="btn btn-warning btn-lg"
							onclick="location.href='memberUpdateForm.do'" id="ml">
							<b>회원정보수정</b>
						</button></td>
				</tr>
				<tr align="center">
					<td><button type="submit" class="btn btn-warning btn-lg"
							onclick="location.href='memberTicket.do'" id="ml">
							<b>티켓예매내역조회</b>
						</button></td>
				</tr>
				<tr align="center">
					<td><button type="submit" class="btn btn-warning btn-lg"
							onclick="location.href='memberStore.do'" id="ml">
							<b>스토어주문조회</b>
						</button></td>
				</tr>
				<tr align="center">
					<td><a href="memberCouponForm.do" class="btn btn-warning btn-lg" id="ml"><b>쿠폰조회</b></a></td>
				</tr>
				<tr align="center">
					<td><a onclick="del()" class="btn btn-warning btn-lg" id="ml"><b>회원탈퇴</b></a></td>
				</tr>
			</table>
		</c:if>
		<!-- <a href="mainForm.do" class="btn btn-info btn-sm">HOME</a> <a href="memberLogout.do" class="btn btn-danger btn-sm">로그아웃</a>-->
	</div>
	<%@ include file="../mainFloor.jsp"%>
</body>
</html>