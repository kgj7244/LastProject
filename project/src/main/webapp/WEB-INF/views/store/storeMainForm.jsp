<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../header.jsp" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어 목록</title>
<style type="text/css">
.a1 {float:left; width:200px;}

</style>
</head>
<body>
 <%@include file="../mainTop.jsp" %>
 <%@include file="../mainNav.jsp" %>

<div class="container" align="center">

<h2 align="left">스토어</h2>
<hr style="border: 0px; height: 3px; background-color: #cccccc;">

   <%@include file="storecategory.jsp" %>
<!-- ====================================== -->
<div>
 <c:if test="${empty storeList }">
   <div>상품정보가 없습니다</div>
 </c:if>
</div>
<!-- ====================================== --> 
<div>
 <c:if test="${not empty storeList}">
 	 <div class="image">
 	<c:forEach var="store" items="${storeList }">
 	
 	<c:if test="${store.s_del != 'y' }">	
 
 	
 		
 		
 		<div class="a1">
 	

		<a href="storeContent.do?s_num=${store.s_num }" >
		<span><img alt="" src="resources/images/s_pop/${store.s_Pimage}" height="170"></span>
		<h4> <span class="name">${store.s_Pname }</span></h4></a>
		 
 		  <div><h6>${store.s_Pconfig }</h6></div> 
 		  <div><h3><fmt:formatNumber pattern="###,###" value="${store.s_prive }"/>원</h3></div>
 
 		<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
<fmt:formatDate value="${store.s_pernd }" pattern="yyyy-MM-dd" var="s_pernd"/>

					<c:if test="${today >= s_pernd }">
									<h3 style="color: red;">현재 구매가 불가능한 상품입니다</h3>
								</c:if>	
 		 </div>
 	
 		
 		  </c:if>
 		
	 </c:forEach>
	  </div>
	 </c:if>
	

</div>
</div>
<!-- ====================================== -->  

<br>


<div style="clea: "><%@include file="../mainFloor.jsp" %></div>
</body>
</html>