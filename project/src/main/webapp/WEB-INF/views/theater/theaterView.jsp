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
<div class="container" align="center">
	
	<div align="left" style="margin-top: 30px;"><p style=" font-weight: bold; font-size: 20px;">${theaterView.t_title}점 안내</p></div>
	
	<table style="width:1110px; height:auto">
		<tr height="50px;">
			<td style="font-weight: bold; font-size: 30px;">${theaterView.t_content}</td>
		</tr>
		<tr height="30px;">
			<td style="font-size: 13px;">연락처 : ${theaterView.t_loc}(${theaterView.t_title})점 / ${theaterView.t_number}</td>
		</tr>
		<tr height="150px;">
			<td>
				<div style="color:#503396; font-size: 20px; font-weight: bold;">시설안내</div>
				<div style="font-weight: bold; font-size: 17px;">보유시설</div>
				<div style="margin-bottom: 20px;"> - ${theaterView.t_gui}</div>
				
				<div style="font-weight: bold; font-size: 17px;">층별안내</div>
				<div> - ${theaterView.t_floor}</div>
			</td>
		</tr>
		<tr height="100px;">
			<td>
				<div style="color:#503396; font-size: 20px; font-weight: bold;">교통안내</div>
				<div style="font-weight: bold; font-size: 17px;">약도</div>
				<div> - 도로명 주소 : ${theaterView.t_addr}</div>
				<div id="map" style="width:500px;height:400px;"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98ae60beff5597ace13d893d001cb332">
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = { 
					    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					    level: 3 // 지도의 확대 레벨
					};
					
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
					//마커가 표시될 위치입니다 
					var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
					
					//마커를 생성합니다
					var marker = new kakao.maps.Marker({
					position: markerPosition
					});
					
					//마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					//아래 코드는 지도 위의 마커를 제거하는 코드입니다
					//marker.setMap(null);    
				</script>
			</td>
		</tr>
	</table>
</div>
</body>
</html>