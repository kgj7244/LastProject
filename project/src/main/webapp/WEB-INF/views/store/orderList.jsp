<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세</title>
<style type="text/css">
#trans1 {display: none;}
</style>
<script type="text/javascript">
 function trans() {
	 alert("질러라");
	 $('#trans1').css('display','block');
	
}
 function show() {
	 $('#trans1').css('display','none');
	
}

</script>



</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>


<div class="container" align="center">
<div align="left"><h3>구매상품 정보</h3> </div>

<form action="order.do" method="post" name="frm" enctype="multipart/form-data">

<input type ="hidden" name = "s_num" value = "${store.s_num }">
<input type ="hidden" name = "member_id" value = "${member.member_id }">
<input type ="hidden" name = "s_purchase" value = "${ord.s_purchase }">


<table class="table" style="width: 1000px; height: 150px; ">
<thead>
<tr>
<th colspan="2">상품명</th>
<th>판매금액</th>
<th>수량</th>
<th>구매금액</th>
</tr>
</thead>


 <tbody>
   
  <tr>
  <td colspan="2"><img alt="" src="resources/images/s_pop/${store.s_Pimage}" height="150">
  ${ store.s_Pname }</td>
          
            <td>${ store.s_prive }</td>
            <td>${ord.s_purchase}</td>
            <td>${store.s_prive * ord.s_purchase }</td>
        </tr>
        
      <tr>
        <td colspan="4">총 결제 예정금액</td>
        <td><input type="text" name = "full_price" value="${store.s_prive * ord.s_purchase }">
        </td></tr>
	 

  </tbody>

  
  <tfoot>
   <tr>
      <td>주문자 정보 확인</td>
     <td>이름
     <input type="text" name="member_name" value="${ member.member_name }" readonly  required="required"></td>
     <td>휴대전화 번호
     <input type="text" name="member_number" value="${ member.member_number }" readonly  required="required"></td>
        
    </tr>
    
    
 <!-- ====================================== -->     
   <tr>
   <td>결제 수단</td>         
   <td><input type="radio" name="t_deal" value="휴대폰 결제" onclick="show()" checked>휴대폰 결제</td> 
   <td><input type="radio" name="t_deal" value="계좌이체" onclick="trans()">계좌이체</td>  
   </tr>
   
 
   
   <input type="hidden" name="t_price" value="${store.s_prive * ord.s_purchase }">
     
   
  
  <tr id="trans1">  
   <td>입금계좌<input type="text" name="aam_account" value="${ aam_bank.aam_account }" readonly></td>
   <td>은행 <input type="text" name="bank_name" value="${ aam_bank.bank_name }" readonly ></td>
   <td>이름 <input type="text" name="aam_name" value="${ aam_bank.aam_name }" readonly></td>
  </tr>  
 
    
  </tfoot>
</table>



<!-- ====================================== -->  
    <button type="submit">구매하기</button>
</form>
</div>

</body>
</html>

