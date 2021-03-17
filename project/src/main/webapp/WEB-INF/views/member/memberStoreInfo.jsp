<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매한 상품 상세보기</title>
<script type="text/javascript">
 function hey() { 
			 
	 var con = confirm("환불 시 결제상품을 이용할 수 없습니다. 환불하시겠습니까?");
		if (con)
			 document.w2.submit();
		else{  
			alert("취소되었습니다");
		
		    return;
		}  
 }
 </script>
<!-- /*  function hey() { 
	if (confirm("환불 시 결제상품을 이용할 수 없습니다. 환불하시겠습니까?") == true){ 
		    document.form.submit();
		}else{  alert("취소되었습니다"); history.go(-1);
		    return;
		} 

 */
 -->

</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>


<div class="container" align="center">
	
<!-- 	<form action="memberStoreRefund.do" method="post" enctype="multipart/form-data"> -->
	
<form action="memberStoreRefund.do" method="post" enctype="multipart/form-data" name="w2"> 
	<input type="hidden" name="s_num" value="${store.s_num}">
	<input type ="hidden" name = "member_id" value = "${member.member_id }">
	<input type ="hidden" name = "ord_num" value = "${ord.ord_num }">
	
	 <div align="left"> <h3>구매상품 정보</h3></div>
		<hr style="border: 0px; height: 3px; background-color: #cccccc;">
	
	
	<div style="width:50%; float:left;">
	 <div><img src="resources/images/s_pop/${store.s_Pimage}" height="200"></div>
	</div>
	
<!-- ====================================== -->  
		<div style="width:50%; float:right;">
		<table>

 <tr><th>



<h2>${store.s_Pname }</h2> 
</th></tr>

<tr>
<th>구성품</th>
<td>${store.s_Pconfig }</td>
</tr>

<tr>
<th>주문번호</th>
<td>${ord.ord_num}</td> 

<th>유효기간 :</th>
<td>${ord.s_validity}</td> 
</tr>

<tr>
<th>판매 금액</th>
<td><fmt:formatNumber pattern="###,###" value="${store.s_prive}"/>원</td> 


<th>구매 수량</th>
<td>${ord.s_purchase}개</td> 


<th>구매 금액</th>
<td><fmt:formatNumber pattern="###,###" value="${ord.full_price }"/>원</td> 
</tr>

<%-- <tr>
<th>거래방법</th>
<td>${bank.t_deal}</td> 
 </tr>
<tr>
 --%>
 

 <c:if test="${ord.del=='n'}">	
 <tr>
 <td><input type="button" onclick="hey()" value="환불요청">  </td></tr>
 

 </c:if>

 
 <c:if test="${ord.del=='y'}">
 <tr><td>환불된 상품입니다</td></tr>
 </c:if>

	
</table>
</div>

</form> 
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>