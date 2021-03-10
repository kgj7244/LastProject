<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#bodyCss{height: auto;}
	div{margin: 0px;padding: 0px;}
	#mainTop{
		background-color: #0d0908; 
		height: 70px;"
	}
	#mainNav{
		background-color: #0d0908; 
		height: 50px;"
	}
	#mainCenterVideo{
		height:850px;
		background-image:url('${path}/resources/images/home/배경.png');
		background-size: 100%;
		background-repeat: no-repeat;
	}
	#mainCenterMovie{
		height: 960px;
		background-image:url('${path}/resources/images/home/배경1.jpg');
		background-size: 30%;
		background-repeat: repeat-x;
		/* background-image:url('${path}/resources/images/home/배경1.png');
		background-size:100%;
		background-repeat: repeat-x; */
	}
	#mainCenterEvent{
		height:400px;
		background-image:url('${path}/resources/images/home/배경2.jpg');
		background-size: 100%;
		background-repeat: no-repeat;
	}
	/* #mainCenterEvent{
		height:560px;
		background-image:url('${path}/resources/images/home/배경.png');
		background-size: 100%;
		background-repeat: no-repeat;
	} */
</style>
</head>
<body id="bodyCss">
	<!-- mainTop -->
	<div class="row" id="mainTop"> 
		<div class="col-md-1" align="center"></div>
		<div class="col-md-10">
			<%@include file="mainTop.jsp"%>
		</div>
		<div class="col-md-1" align="center"></div>
	</div>
	
	<!-- mainNav -->
	<div class="row" id="mainNav"> 
		<div class="col-md-1" align="center"></div>
		<div class="col-md-10">
			<%@include file="mainNav.jsp" %>
		</div>
		<div class="col-md-1" align="center"></div>
	</div>
	
	<hr style="margin: 0px;	padding: 0px;">
	
	
	<!-- mainCenter -->
	<div class="row" id="mainCenterVideo"> <!-- 영상 --> 					 							
		<div class="col-md-2" align="center"><a href="#"><img src="${path}/resources/images/home/왼쪽베너.png" width="100%" height="100%"></a></div>
		<div class="col-md-8">
			<%@include file="mainCenterVideo.jsp" %>
		</div>
		<div class="col-md-2" align="center"><a href="#"><img src="${path}/resources/images/home/오른쪽베너.png" width="100%" height="100%"></a></div>
	</div>
	
	<hr style="margin: 0px;	padding: 0px;">
	
	<div class="row" id="mainCenterMovie"> <!-- 영화 홍보 --> 					 							
		<div class="col-md-1" align="center"></div>
		<div class="col-md-10">
			<%@include file="mainCenterMovie.jsp" %>
		</div>
		<div class="col-md-1" align="center"></div>
	</div>
	
	<div class="row" id="mainCenterEvent"> <!-- 이벤트, 스토어 --> 					 							
		<div class="col-md-1" align="center"></div>
		<div class="col-md-10">
			<%@include file="mainCenterEvent.jsp" %>
		</div>
		<div class="col-md-1" align="center"></div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- mainFloor -->
	<div class="row"> 												
		<div class="col-md-1" align="center"></div>
		<div class="col-md-10">
			<%@include file="mainFloor.jsp" %>
		</div>
		<div class="col-md-1" align="center"></div>
	</div>
</body>
</html>