<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../header.jsp" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 <c:if test="${not empty storeList }">
 <c:forEach var="store" items="${storeList }">
 
 
 		<c:if test="${store.s_del != 'y' }">	
 <div class="image">
 <div class="a1">
 
 			
 <a href="storeContent.do?s_num=${store.s_num }">
<span><img alt="" src="resources/images/s_pop/${store.s_Pimage}" height="150"></span>

  <div class="name"><h4>${store.s_Pname }</h4></div>  
  </a>
 
  <div>${store.s_Pconfig }</div>
 
  <div>${store.s_prive }원</div>
		
			
 			
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
<fmt:formatDate value="${store.s_pernd }" pattern="yyyy-MM-dd" var="s_pernd"/>

<c:if test="${today >= s_pernd }">

현재 구매가 불가능한 상품입니다

</c:if>

			
			
 </div></div>
 		</c:if>
 </c:forEach>
 
 
 </c:if>
 </div>
</div>

<!-- ====================================== -->  




<div><%@include file="../mainFloor.jsp" %></div>
</body>
</html>