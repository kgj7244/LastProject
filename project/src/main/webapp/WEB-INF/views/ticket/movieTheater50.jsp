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
						<td width="50px;"><!-- choose로 숫자에 맞는 열 출력 -->
							<c:forEach var="x" begin="1" end="5" > <!-- 상영관에 맞춰서 end 바꾸기 1줄에 10칸 좌석 -->
								<c:choose> 
									<%--<c:when test="${x==1}"><span><input type="text" value="A" id="row"></span></c:when>
									<c:when test="${x==2}"><span><input type="text" value="B" id="row"></span></c:when> --%>
									<c:when test="${x==1}"><span id="row">A</span></c:when>
									<c:when test="${x==2}"><span id="row">B</span></c:when>
									<c:when test="${x==3}"><span id="row">C</span></c:when>
									<c:when test="${x==4}"><span>D</span></c:when>
									<c:when test="${x==5}"><span>E</span></c:when>
									<c:when test="${x==6}"><span>F</span></c:when>
									<c:when test="${x==7}"><span>G</span></c:when>
									<c:when test="${x==8}"><span>H</span></c:when>
									<c:when test="${x==9}"><span>I</span></c:when>
									<c:when test="${x==10}"><span>J</span></c:when>
									<c:when test="${x==11}"><span>K</span></c:when>
									<c:when test="${x==12}"><span>L</span></c:when>
									<c:when test="${x==13}"><span>M</span></c:when>
									<c:when test="${x==14}"><span>N</span></c:when>
									<c:when test="${x==15}"><span>O</span></c:when>
									<c:when test="${x==16}"><span>P</span></c:when>
									<c:when test="${x==17}"><span>Q</span></c:when>
									<c:when test="${x==18}"><span>R</span></c:when>
									<c:when test="${x==19}"><span>S</span></c:when>
									<c:when test="${x==20}"><span>T</span></c:when>
									<c:when test="${x==21}"><span>U</span></c:when>
									<c:when test="${x==22}"><span>V</span></c:when>
									<c:when test="${x==23}"><span>W</span></c:when>
									<c:when test="${x==24}"><span>X</span></c:when>
									<c:when test="${x==25}"><span>Y</span></c:when>
									<c:when test="${x==26}"><span>Z</span></c:when>
								</c:choose>
							</c:forEach>
						</td>
						<td>
							<span><label for="num"><input type="checkbox" id="num" name="a1" value="a1" style="display:none" onclick="test1(${num})">1</label></span>
							<span><label for="num"><input type="checkbox" id="num" name="a2" value="a2" style="display:none" onclick="test1(${num})">2</label></span>
							<span><label for="num"><input type="checkbox" id="num" name="a3" value="a3" style="display:none" onclick="test1(${num})">3</label></span>
							<span><label for="num"><input type="checkbox" id="num" name="a4" value="a4" style="display:none" onclick="test1(${num})">4</label></span>
							<span><label for="num"><input type="checkbox" id="num" name="a5" value="a5" style="display:none" onclick="test1(${num})">5</label></span>
							<span><label for="num"><input type="checkbox" id="num" name="a6" value="a6" style="display:none" onclick="test1(${num})">6</label></span>
							<span><label for="num"><input type="checkbox" id="num" name="a7" value="a7" style="display:none" onclick="test1(${num})">7</label></span>
							<span><label for="num"><input type="checkbox" id="num" name="a8" value="a8" style="display:none" onclick="test1(${num})">8</label></span>
							<span><label for="num"><input type="checkbox" id="num" name="a9" value="a9" style="display:none" onclick="test1(${num})">9</label></span>			
							<span><label for="num"><input type="checkbox" id="num" name="a10" value="a10" style="display:none" onclick="test1(${num})">10</label></span>
						</td>
					</tr>
			</table>
		</form>
	</div>
	<%-- <c:forEach var="y" begin="1" end="10">
							<c:if test="${y==4 || y==8}"> <!-- 4와 8을 만날때 앞에 공백 3칸 -->
								<span>&nbsp;&nbsp;&nbsp;<button name="${x}${y}" onclick="test1(${x},${y})" id="seatSelect" value="${y}">${y}</button></span>
								<span><label for="number"><input type="checkbox" id="number" name="${row.value}" value="${y}" style="display: none" onclick="test1(${number})">${y}</label></span>
							</c:if>
							<c:if test="${y!=4 && y!=8}"> <!-- 그외 공백없이 쭉 출력 -->
							<span><button name="${x}${y}" onclick="test1(${x},${y})" id="seatSelect" value="${y}">${y}</button></span>
							<span><label for="number"><input type="checkbox" id="number" name="${row.value}" value="${y}" style="display: none" onclick="test1(${number})">${y}</label></span>
							</c:if>
						</c:forEach>	 --%>	
</body>
</html>