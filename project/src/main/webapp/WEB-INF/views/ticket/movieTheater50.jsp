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
	<div class="container">
		<form name="frm12">
			<table>
				
					<tr>
						<td>
							<c:forTokens var="i" items="A,B,C,D,E" delims=",">
								<span>${i}열</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						
								<c:forEach var="y" begin="1" end="10">
									<c:if test="${y==3 || y==7}">
										<input type="button" id="rowNumber" value="${i}${y}" onclick="row(this.value)">&nbsp;&nbsp;
									</c:if>
									<c:if test="${y!=3 && y!=7}">
										<input type="button" id="rowNumber" value="${i}${y}" onclick="row(this.value)">
									</c:if>
								</c:forEach>
								<br>
							</c:forTokens>
						</td>
					</tr>
			</table>
		</form>
	</div>
</body>
</html>