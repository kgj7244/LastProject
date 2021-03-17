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
<style type="text/css">

th{color:black;  }
td{color:black; }

</style>

</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>


<div class="container" align="center">
	
	
<form action="memberStoreRefund.do" method="post" enctype="multipart/form-data" name="w2"> 
	<input type="hidden" name="s_num" value="${store.s_num}">
	<input type ="hidden" name = "member_id" value = "${member.member_id }">
	<input type ="hidden" name = "ord_num" value = "${ord.ord_num }">
	
	 <div align="left"> <h3>결제내역</h3></div>
		<hr style="border: 0px; height: 3px; background-color: #cccccc;">
<!-- ====================================== -->  	
	
	<div style="width:30%; float:left;">
	 <div><img src="resources/images/s_pop/${store.s_Pimage}" height="200"></div>
	</div>
	

 <div style="width:70%; float:right;">
		
<table  class="table" style="width: 700px; height: 200px;  ">




<tr>
<th>구매일</th>
<td colspan="2">${ord.buy_date}</td> 

<th>주문번호</th>
<td colspan="2">${ord.ord_num}</td>

</tr>


<tr>
<th colspan="6">
<hr style="border: 0px; height: 1px; background-color: #cccccc;">
</th></tr>

<!-- ================================================== -->  	
<tr>
<th colspan="6" align="center" style="font-weight: bold; 
background-color: #f8f9fb; color: #908c88;" width="10%">구매상품 정보</th>
</tr> 

 <tr>
<th>상품명</th> 
<td>${store.s_Pname }</td>

<th>구성품</th>
<td>${store.s_Pconfig }</td>

<th></th>
<td></td>

</tr>


<tr>
<th>판매 금액</th>
<td><fmt:formatNumber pattern="###,###" value="${store.s_prive}"/>원</td> 

<th>구매 수량</th>
<td>${ord.s_purchase}개</td> 

<th>구매 금액</th>
<td><fmt:formatNumber pattern="###,###" value="${ord.full_price }"/>원</td> 
</tr>

<tr>
<th colspan="6" align="center" style="font-weight: bold; 
background-color: #f8f9fb; color: #908c88;" width="10%">발송 정보</th>
</tr> 

<tr>
<th>거래방법</th>
<td colspan="2">${bank.t_deal}</td> 

<th>유효기간 :</th>
<td colspan="2">${ord.s_validity}</td> 

</tr>

<tr>

 <c:if test="${ord.del=='n'}">	
 <tr><th>상태 : </th> <td colspan="2">사용가능 </td>
 <td colspan="3">
 <input type="button" onclick="hey()" class="btn btn-danger" 
 value="환불요청"  style="width: 100px; height: 30px; font-weight: bold; font-size: 15px; 
   vertical-align:middle; bottom: 0; margin-right: 5px; text-align: center;"></td></tr>
 

 </c:if>

 
 <c:if test="${ord.del=='y'}">
 <tr><td colspan="6" style="color: red;">환불된 상품입니다</td></tr>
 </c:if>



<tr><td colspan="6">
	<a href="memberStore.do" class="btn btn-outline-info" 
   style="width: 230px; height: 40px; font-weight: bold; font-size: 15px; 
   vertical-align:middle; bottom: 0; margin-right: 5px; text-align: center;">결제내역</a>
    
	<a href="mainForm.do" class="btn btn-warning"
   style="width: 230px; height: 40px; font-weight: bold; font-size: 15px; 
   vertical-align:middle; bottom: 0; margin-right: 5px;">메인으로</a>
      </td></tr>
	
</table>
</div>

</form> 


</div>



<%@ include file="../mainFloor.jsp" %>
</body>
</html>