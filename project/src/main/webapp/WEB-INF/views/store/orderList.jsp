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

th{color:black; text-align: center; }

</style>
<script type="text/javascript">
 function trans() {
	 alert("일부 카드는 카드사 사정으로 사용이 제한될 수 있습니다");
	 $('#trans1').css('display','block');
	
}
 function show() {
	 $('#trans1').css('display','none');
	 
}
function hey() { 
		 
var con = confirm("${ member.member_name }(${ member.member_number })로 스토어 교환권이 발송됩니다");
			if (con)
				 document.frm.submit();
			else{  
				alert("취소되었습니다");
			
			    return;
			}   
	
}

</script>


</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>


<div class="container" align="center">
<div align="left"><h2>구매상품 정보</h2> </div>
	<hr style="border: 0px; height: 3px; background-color: #cccccc;">
	<br>
	
	<div style="width:30%;">
	 <div><img src="resources/images/s_pop/결제순서 (1).jpg" width="450"></div>
	</div>
	

<form action="order.do" method="post" name="frm" enctype="multipart/form-data">

<input type ="hidden" name = "s_num" value = "${store.s_num }">
<input type ="hidden" name = "member_id" value = "${member.member_id }">
<input type ="hidden" name = "s_purchase" value = "${ord.s_purchase }">
<input type="hidden" name="t_price" value="${store.s_prive * ord.s_purchase }">


<table class="table" border="2" style="width: 1100px; height: 200px;  ">

<tr  style="background-color: #ffce67; text-align: center; font-size: 17px; font-weight: bold;" >
<th colspan="2">상품명</th>
<th>판매금액</th>
<th>수량</th>
<th>구매금액</th>
</tr>


    
 <!-- ====================================== -->     

   
  <tr>
  <td colspan="2" style="color: black;"><img alt="" src="resources/images/s_pop/${store.s_Pimage}" height="150">
  ${ store.s_Pname } /${store.s_Pconfig }</td>
          
            <td align="center" style="color: black;"><fmt:formatNumber pattern="###,###" value="${ store.s_prive }"/>원</td>
            <td align="center" style="color: black;">${ord.s_purchase}</td>
            
            <td align="center" style="color: black;"><fmt:formatNumber pattern="###,###" value="${store.s_prive * ord.s_purchase }"/>원
            </td>
	</tr>
   

  </table>
  <br>
   <h2 style="color: black;">최종결제</h2>  <br>
        
 <!--  <table class="table-info" style="color:white;  width: 1000px; height: 200px;font-size: 17px; font-weight: bold; border-radius: 10px;">  

  -->
  <table class="table" style="color:white; width: 1000px; height: 200px;
  background-color: #F5A9A9; font-size: 17px; font-weight: bold; border-radius: 10px;">  

      <tr>
        <td colspan="1">총 결제 예정금액</td>
         <td >할인율 ${store.s_sale }%</td>

        
 <td style="color: #0080FF; font-size: x-large; margin-left: 10cm;"><fmt:formatNumber  pattern="###,###" 
 value="${(store.s_prive * ord.s_purchase)-(store.s_prive * ord.s_purchase)*store.s_sale/100}"/>원
 </td></tr>



   <tr>
      <td>주문자 정보 확인</td>
     <td>이름
     <input type="text" name="member_name" value="${ member.member_name }" readonly  
     required="required" style="color: black;"></td>
     <td>휴대전화 번호
     <input type="text" name="member_number" value="${ member.member_number }" readonly required="required" style="color: black;"></td>
        
    </tr>
    
 
  
   <tr>
   <td>결제 수단</td>         
 <td><input type="radio" name="t_deal" value="휴대폰 결제"  onclick="show()" checked>휴대폰 결제</td> 
 <td><input type="radio" name="t_deal"  value="계좌이체" onclick="trans()">계좌이체</td> 
   
   
  <!-- <select name="t_deal" id="trans1">		
				<option value="신한">신한</option>
				<option value="BC">BC</option></select> </td> -->
   </tr>
   
 
</table>



<!-- ====================================== -->  
   <a href="storeMainForm.do" class="btn btn-warning"
   style="width: 230px; height: 40px; font-weight: bold; font-size: 15px;
   vertical-align:middle; bottom: 0;  margin-right: 5px;" >구매 취소</a>
   
    <input type="button"  onclick="hey()" class="btn btn-secondary" 
    style="width: 230px; height: 40px; font-weight: bold; font-size: 15px;
   vertical-align:middle; bottom: 0;" value="구매하기"> 
</form>



</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>

