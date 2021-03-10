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
	
	<form action="memberStoreRefund.do" method="post">
	
	<input type="hidden" name="s_sum" value="${store.s_sum}">
	
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
<th>유효기간</th>
<%-- td>${ord.s_validity}</td> --%>
</tr>

<tr><td>
<c:if test="${ord.s_validity-sysdate<0}">
 <td>유효기간이 지났을 경우 환불 할 수 없습니다.</td>
 </c:if>
  <input type="submit" value="환불요청">


</td></tr>
	
</table>
</div>

</form>
</div>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>