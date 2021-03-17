<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<!-- <div style="background-color: #0d0908; height: 70px;"> -->
<div style="background-color: #0d0908; height: 110px;">
	<div class="container" id="mainTop" style="background-color: #0d0908; height: 110px;">
		<div class="row">
			<div class="col-sm-4" align="center" style="height: 110px;">
			
			</div>
			
			<div class="col-sm-4" align="center" style="height: 110px;">
				<img src="${path}/resources/images/home/로고.png" width="175px;" height="95px;" style="margin-top: 7px;" onclick="location.href='mainForm.do'">
			</div>
			
			<div class="col-sm-4" align="right" style="margin-top: 20px;">
				<c:if test="${member_id == null}"><!-- 진짜 css 모르겠다 그냥 다이렉트로 넣음 (ㅡ.ㅡ) -->
					<a href="memberLoginForm.do" style="color:#dbdbdb; font-size: 20px; font-weight: bold;">로그인</a> &nbsp;&nbsp;
					<a href="memberJoinForm.do" style="color:#dbdbdb; font-size: 20px; font-weight: bold;">회원가입</a>
				</c:if>
				<c:if test="${member_id != null && member_del == n}">
						<span style="color:#dbdbdb; font-size: 20px; font-weight: bold;">${member_id}님 &nbsp;&nbsp;</span>
						<a href="mypage.do" style="color:#dbdbdb; font-size: 20px; font-weight: bold;">마이페이지</a>&nbsp;&nbsp;
						<a href="memberLogout.do" style="color:#dbdbdb; font-size: 20px; font-weight: bold;">로그아웃</a>
				</c:if>
			</div>
		</div>
	</div>
</div>
</body>
</html>