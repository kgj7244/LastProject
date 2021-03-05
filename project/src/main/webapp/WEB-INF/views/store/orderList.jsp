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

<form  action="order.do" method="post" name=order>
<input type ="hidden" name = "s_num" value = "${store.s_num }">
<input type ="hidden" name = "s_Pname" value = "${store.s_Pname }">
<input type ="hidden" name = "s_Pimage" value = "${store.s_Pimage }">
<input type ="hidden" name = "s_prive" value = "${store.s_prive }">
<input type ="hidden" name = "s_prive" value = "${s_purchase}">


<table>
 <thead>
<tr>
<th>#</th>
<th>상품명</th>
<th>판매금액</th>
<th>수량</th>
<th>구매금액</th>
</tr>
</thead>


 <tbody>
   
        <tr>
  <td><img alt="" src="resources/images/s_pop/${store.s_Pimage}" height="150"></td>
            <td>${ store.s_Pname }</td>
            <td>${ store.s_prive }</td>
            <td>${ store.s_purchase }</td>
            <td>${ store.s_prive * s_purchase }</td>
        </tr>

  </tbody>
  <tfoot>
    <tr>
        <td colspan="5"></td>
        <td>${ store.s_prive }</td>
        
    </tr>
  </tfoot>
</table>



</form>
</body>
</html>