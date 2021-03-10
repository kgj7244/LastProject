<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세</title>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>




<div class="container" align="center">

<div align="left"><h3>구매상품 정보</h3> </div>


<form action="order.do" method="post" name="frm"
 enctype="multipart/form-data">

<input type ="hidden" name = "s_num" value = "${ord.s_num }">
<input type ="hidden" name = "s_Pname" value = "${ord.s_Pname }">
<input type ="hidden" name = "s_Pimage" value = "${ord.s_Pimage }">
<input type ="hidden" name = "s_prive" value = "${ord.s_prive }">
<input type ="hidden" name = "s_purchase" value = "${s_purchase}">


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
  <td colspan="2"><img alt="" src="resources/images/s_pop/${ord.s_Pimage}" height="150">
  ${ ord.s_Pname }</td>
          
            <td>${ ord.s_prive }</td>
            <td>${s_purchase}</td>
            <td>${ ord.s_prive * s_purchase }</td>
        </tr>

  </tbody>
  <tfoot>
    <tr>
        <td colspan="4"></td>
        <td>${total+(s_prive*s_purchase)}</td>
        
    </tr>
  </tfoot>
</table>


<!-- ======================================
    <input name="id" type="hidden" value="${ ord_num }" type="hidden" /> -->  
    <button type="submit">구매하기</button>
</form>
</div>

</body>
</html>

