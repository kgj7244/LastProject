<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
<script type="text/javascript">

 function a12() {
	 var full_price =(order.s_purchase.value*order.s_prive.value)-(order.s_purchase.value*order.s_prive.value)*(order.s_sale.value/100);
	 $('#full_price').val(full_price);
}

</script>

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

<c:if test="${store.s_Pclass==4}">
<tr><th>판매기간</th>
<td>${store.s_per } ~ ${store.s_pernd }</td>
</tr>
</c:if>

<tr><th>
<h3><fmt:formatNumber pattern="###,###" value="${store.s_prive }"/>원</h3></th></tr>

<tr>
<th>구성품</th>
<td>${store.s_Pconfig }</td>
</tr>

<tr>
<th>유효기간</th>
<td>구매일로부터 12개월</td>
</tr>

<c:if test="${store.s_Pclass==4}">
<tr><th>한정 판매 </th><td>남은 수량 ${store.s_total }개 </td></tr>
   <c:if test="${store.s_sale!=0}">
   <tr><th>할인율 </th><td> ${store.s_sale }%</td></tr>
   </c:if>
</c:if>

<tr>
<th>총 상품금액</th>
<td><input type="number" readonly="readonly" style="border:none" 
value="${store.s_prive }" name="full_price" id="full_price">
</td>
</tr>
<!--  style="border:none" -->

<!-- ====================================== -->  

<tr><td>
<form name="order" method="post" action="orderList.do"> 
		<input type="hidden" name="s_prive" value="${store.s_prive}">
		<input type="hidden" name="s_sale" value="${store.s_sale}">
<%-- <form action="<c:url value='orderList.do' />" method="post">	 --%>
	
<%-- 	<c:set var="s_purchase" value="${s_purchase}"></c:set> --%>
		
		<select name="s_purchase" onchange="a12()">
			<c:forEach begin="1" end="10" var="i">
				<option value="${i}">${i}</option> </c:forEach>
		</select>&nbsp;개 
	
		
		<input type="hidden" name="s_num" value="${store.s_num}">
		<button type="submit" class="btn btn-primary">구매하기</button>
		
	</form></td></tr>
	
	
	
</table>
</div>


	<%-- 	<div align="center">
			<input type="hidden" name="member_id" value="${member_id}">
			<c:if test="${member_id == 'master'}">
				<a href="storeInsertForm.do">상품 추가</a>
			</c:if>
		</div> --%>
	
<!-- ====================================== -->

		<div align="left" class="side">

	<br>
	<h3>이용 안내</h3>
	- 스토어 상품은 회원만 구매할 수 있습니다.<br> - 유효기간은 12개월로 구매일 기준입니다.<br>
	- 결제가 완료된 상품은 마이페이지 > 스토어 구매 내역에서 확인할 수 있습니다. 
	<br> - 상기 이미지는 실제 제품과 다를 수 있습니다.<br> <input type="hidden" name="s_Pclass" value="${store.s_Pclass}">
	
	<c:if test="${store.s_Pclass==2}">
		- 탄산음료가 기본으로 제공되며, 사이즈 및 기타 음료로 변경 시 금액이 추가됩니다. <br>
	</c:if>


	
	</div>
</div>

<div><%@include file="../mainFloor.jsp" %></div>
</body>
</html>