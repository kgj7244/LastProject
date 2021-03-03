<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
</head>
<body> 
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
<%@include file="storecategory.jsp" %>
	
	<div class="container" align="center">
	
	<div align="left"><h2>${store.s_Pname }</h2> </div>
	
	<div style="width:50%; float:left;">
	 <div><img src="resources/images/s_pop/${store.s_Pimage}" height="200"></div>
	</div>
	
<!-- ====================================== -->  
<div style="width:50%; float:right;">
<table>

<tr><th><h3>${store.s_prive }원</h3></th></tr>

<tr>
<th>구성품</th>
<td>${store.s_Pconfig }</td>
</tr>

<tr>
<th>유효기간</th>
<td>구매일로부터 12개월</td>
</tr>

<tr>
<th>금액/수량</th>
<td>
<input type="text" title="수량 입력" 
class="input-text" readonly="readonly" value="1">
</td>
</tr>

<tr><td>구매 수량</td><td>${store.s_purchase }</td></tr>

<tr>
<th>총 상품금액</th>
<td>${total+(s_prive*s_purchase)}원</td>
</tr>






<!-- ====================================== -->  
<tr>
<td><input type="submit" value="장바구니" onclick="location.href='cartList.do?s_num=${store.s_num}"></td> 
<td><input type="submit" value="구매하기" onclick="order()"></td>
</tr>

</table>
</div>


<!-- ====================================== -->  

<div align="left">

*<br>
<h3>이용 안내</h3>
- 스토어 상품은 회원만 구매할 수 있습니다.<br>
- 유효기간은 12개월로 구매일 기준입니다.<br>
- 결제가 완료된 상품은 마이페이지 > 스토어 구매 내역에서 확인할 수 있습니다. <br>
- 상기 이미지는 실제 제품과 다를 수 있습니다.<br>

	<input type="hidden" name="s_Pclass" value="${store.s_Pclass}">
<c:if test="${store.s_Pclass==2}">
- 탄산음료가 기본으로 제공되며, 사이즈 및 기타 음료로 변경 시 금액이 추가됩니다. <br>
</c:if>


</div>
</div>

<div><%@include file="../mainFloor.jsp" %></div>
</body>
</html>