<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
<style type="text/css">
#trans1 {display: none;}

th{color:#2E2E2E;  }
li{color:#2E2E2E;  }

</style>


<script type="text/javascript">
 $(function() {
	 var full_price =(1*order.s_prive.value)-(order.s_purchase.value*order.s_prive.value)*(order.s_sale.value/100);
	 var total=full_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
	 $('#tt').text(total);
});
 function a12() {
	 var full_price =(order.s_purchase.value*order.s_prive.value)-(order.s_purchase.value*order.s_prive.value)*(order.s_sale.value/100);
	 var total=full_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
	 $('#tt').text(total);

}

</script>



</head>
<body> 
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>

	
 
	
	<div class="container" align="center">
	
	
	<div align="left"><h2>${store.s_Pname }</h2> </div> 
	
	


	
	<hr style="border: 0px; height: 3px; background-color: #cccccc;">
	<br>

	

	
	<div style="width:50%; float:left;">
	 <div><img src="resources/images/s_pop/${store.s_Pimage}" height="300"></div>
	</div>
	
<!-- ====================================== -->  
<div style="width:50%; float:right;">
<table>

<c:if test="${store.s_Pclass==4}">
<tr><th>판매기간</th>
<td style="font-weight: bold;">${store.s_per } ~ ${store.s_pernd }</td>
</tr>
</c:if>

<tr> </tr>

<tr>
<th colspan="2">
<h2 style="color: black; font-weight: bold;"><fmt:formatNumber pattern="###,###" value="${store.s_prive }"/>원</h2>
</th>
</tr>


<tr><th colspan="2">
<hr style="border: 0px; height: 1px; background-color: #cccccc;">
</th></tr>


<tr>
<th>구성품</th>
<td>${store.s_Pconfig }</td>
</tr>

<tr>
<th>유효기간</th>
<td>구매일로부터 12개월</td>
</tr>


<c:if test="${store.s_Pclass==4}">
<tr>
<th>한정 판매 </th>
<td>남은 수량 ${store.s_total }개 </td></tr>




   <c:if test="${store.s_sale!=0}">
   <tr style="color: blue;"><th>할인율 </th><td style="font-weight: bold; font-size: large;"> ${store.s_sale }%</td></tr>
   </c:if>
</c:if>


<tr><th colspan="2">
<hr style="border: 0px; height: 1px; background-color: #cccccc;">
</th></tr>


<!-- ====================================== -->  


<tr>
<form name="order" method="post" action="orderList.do"> 

		<input type="hidden" name="s_prive" value="${store.s_prive}">
		<input type="hidden" name="s_sale" value="${store.s_sale}">
		<input type="hidden" name="s_num" value="${store.s_num}">
		
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
<fmt:formatDate value="${store.s_pernd }" pattern="yyyy-MM-dd" var="s_pernd"/>


<c:choose>


    <c:when test="${today >= s_pernd }">
 <th colspan="2">   
     <h3 style="color: red;">종료된 이벤트입니다</h3>
    </c:when>
    

  <c:otherwise>
  <th>
  	<select name="s_purchase" onchange="a12()">
			<c:forEach begin="1" end="10" var="i">
				<option value="${i}">${i}</option> </c:forEach>
		</select>&nbsp;개 </th> 
		
<tr>
<th>총 구매금액</th>		

<td style="font-size: xx-large; color: black; font-weight: bold;">
<span id="tt" style="margin-left: 2cm;"></span>원</td>


	<tr><td>
	<a href="storeMainForm.do" class="btn btn-warning"
   style="width: 230px; height: 40px; font-weight: bold; font-size: 15px; 
   vertical-align:middle; bottom: 0; margin-right: 5px;">스토어로</a>
   </td>

	<td>
   <button type="submit" class="btn btn-secondary"
   style="width: 230px; height: 40px; font-weight: bold; font-size: 15px; vertical-align:middle; bottom: 0" >구매하기</button>
   </td></tr>
   
    </c:otherwise>

</c:choose>
	
	</form><tr>
	

</table>
</div>

	
<!-- ====================================== -->
<input type="hidden" name="s_Pclass" value="${store.s_Pclass}">


<div align="left" class="side">



	<br>  <!-- clear 왼쪽 이동 금지 -->
	<h3 style="clear: both; font-size: large;">이용 안내</h3>
	<ul style="list-style:square; font-size: medium; ">	
	
	 <c:if test="${store.s_Pclass==4}">
		<li style="font-weight: bold;">본 상품은 이벤트 상품으로 교환/환불/사용기한 연장이 불가하니 신중하게 구매 부탁드립니다.</li>
	</c:if>
      
      <li>스토어 상품은 회원만 구매할 수 있습니다.</li>
      <li>유효기간은 12개월로 구매일 기준입니다.</li>
      <li>지정된 해당 상품으로만 교환이 가능하며 각 지점 별 매점 운영 시간까지 구매 가능합니다.</li>
      <li>교환 완료한 상품의 환불 및 반품은 불가합니다.</li>
      
      <c:if test="${store.s_Pclass==2}">
		<li>탄산음료가 기본으로 제공되며, 사이즈 및 기타 음료로 변경 시 금액이 추가됩니다.</li>
	</c:if>
	
     
    </ul>
	
	</div>
</div>


<div><%@include file="../mainFloor.jsp" %></div>
</body>
</html>