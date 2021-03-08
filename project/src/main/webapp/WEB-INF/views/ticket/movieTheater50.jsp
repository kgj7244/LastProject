<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="container" style="width: 650px;">
		<form name="frm12">
		<div align="center"> <!-- 스크린 위치 -->
			<img alt="XXX" src="${path}/resources/images/스크린.png" width="100%" height="100%"> 
		</div>
			<table>
				<!-- 90석 -->
				<c:forTokens var="i" items="A,B,C,D,E" delims=",">
					<tr height="30px;">
							<td align="right" style="b">
								<span style="font-weight: bold;">${i}열</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<td>
							<td>						
								<c:forEach var="y" begin="1" end="10">
									<c:if test="${y==3 || y==7}">
										<input class="active" type="button" name="${i}${y}" id="rowNumber" value="${y}" onclick="row(this.name)" style="background-color: rgba(204, 197, 198, 0.9); color:white; border: none; border : 1px solid #a4a4a4; font-weight: bold;">&nbsp;&nbsp;
									</c:if>
									<c:if test="${y!=3 && y!=7}">
										<input class="active" type="button" name="${i}${y}" id="rowNumber" value="${y}" onclick="row(this.name)" style="background-color: rgba(204, 197, 198, 0.9); color:white; border: none; border : 1px solid #a4a4a4; font-weight: bold;">
									</c:if> 
								</c:forEach>
								<br>	
							</td>
					</tr>
					</c:forTokens>
			</table>
		</form>
	</div>
</body>
</html>