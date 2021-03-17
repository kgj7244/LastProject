<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
li>a {
	color: white;
	font-size: 20px;
	font-weight: bold;
}
/* .dropdown-menu>a
 {
	background-color: #ffe194;
}  */
/* 	border-color: #ffe194; */
</style>
<script type="text/javascript">
	function findChk() {
		if ((frm21.search.value == "") == true) {
			alert('영화제목을 입력해주세요.');
			return false;
		}
	}
</script>
</head>
<body>
	<%-- <div style="background-color: #0d0908; height: 50px; vertical-align:middle;">
	<div class="container" align="center">
		<div class="row">
			<div class="col-sm-10" align="center">
			<ul class="nav nav-pills nav-justified">
				<li><a href="movieMainForm.do?m_ing=0">영화</a></li>
				<li><a href="theaterMainForm.do">극장</a></li>
				<li><a href="ticketMainForm.do">예매</a></li>
				<li><a href="storeMainForm.do">스토어</a></li>
				<li><a href="noticeList.do">고객센터</a></li>
			</ul>
			</div>
			<div class="col-sm-2" align="center">
				<form action="movieMainForm.do" method="post" name="frm21" onsubmit="return findChk()">
					<input type="hidden" name="m_ing" value="0">
					<input type="hidden" name="pageNum" value="1">
					<input type="text" name="keyword" value="${moive.keyword}" placeholder="영화 검색" size="11px;">
					<input type="submit" class="btn btn-warning btn-sm" width="15px;" height="15px;" value="검색">
				<img src="${path}/resources/images/home/찾기.png" width="70%" height="70%"  style="margin-top: 5px;" id="Find" onclick="Chk()">
				</form>
			</div>
		</div>
	</div>
</div> --%>
	<nav class="navbar navbar-expand-lg navbar-light bg-warning">
		<!--<a class="navbar-brand" href="mainForm.do">HOME</a>-->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor03" aria-controls="navbarColor03"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>			
		<div class="collapse show navbar-collapse row" id="navbarColor03">
			<div class="col-sm-2"></div>
			<div class="col-sm-4" align="left">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="mainForm.do">HOME <span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="movieMainForm.do?m_ing=0">영화</a></li>
					<li class="nav-item"><a class="nav-link"
						href="theaterMainForm.do">극장</a></li>
					<li class="nav-item"><a class="nav-link"
						href="ticketMainForm.do">예매</a></li>
					<li class="nav-item"><a class="nav-link"
						href="storeMainForm.do">스토어</a></li>
					<!-- 극장/예매에서는 고객센터드롭다운이 실행되는데, 영화/스토어에서는 실행안됨 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">고객센터</a>
						<div class="dropdown-menu">
							<a class="dropdown-item bg-warning" href="noticeList.do">NOTICE</a>
							<a class="dropdown-item bg-warning" href="boardList.do">Q & A</a>
						</div></li>
				</ul>
			</div>
			<div class="col-sm-4" align="right">
				<form class="form-inline my-2 my-lg-0" action="movieMainForm.do"
					method="post" name="frm21" onsubmit="return findChk()"
					style="width: 220px;">
					<input type="hidden" name="m_ing" value="1">
					<input type="hidden" name="pageNum" value="1">
					<input class="form-control mr-sm-2" type="text" name="keyword"
						id="keyword" value="${moive.keyword}" placeholder="영화 검색" size="10px;">
					<button class="btn btn-warning my-2 my-sm-0 btn-lg" style="border: 1px solid #FFFFFF;" type="submit">
						<b>SEARCH</b>
					</button>
				</form>
			</div>
		</div>
	</nav>
</body>
</html>