<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>


<div class="container" align="center">
	
	<form action="memberStoreRefund.do" method="post" enctype="multipart/form-data">
	
	<input type="hidden" name="s_num" value="${store.s_num}">
	<input type ="hidden" name = "member_id" value = "${member.member_id }">
	<input type ="hidden" name = "ord_num" value = "${ord.ord_num }">
	
	<div align="left"><h2>${store.s_Pname }</h2> </div>
	
	<div style="width:50%; float:left;">
	 <div><img src="resources/images/s_pop/${store.s_Pimage}" height="200"></div>
	</div>
	
<!-- ====================================== -->  
		<div style="width:50%; float:right;">
		<table>


<tr><th>
<h3><fmt:formatNumber pattern="###,###" value="${store.s_prive }"/>원</h3></th></tr>

<tr>
<th>구성품</th>
<td>${store.s_Pconfig }</td>
</tr>

<tr>
<th>주문번호</th>
<td>${ord.ord_num}</td> 

<th>유효기간</th>
<td>${ord.s_validity}</td> 
</tr>
 
 
 <tr><td>
  <input type="submit" value="환불요청">


</td></tr>
	
</table>
</div>

</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>