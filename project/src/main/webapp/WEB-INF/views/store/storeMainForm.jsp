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

<h2 class="text-primary">스토어</h2>
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
		<span><img alt="" src="resources/images/s_pop/${store.s_Pimage}" height="150"></span>
		 <span class="name"><h4>${store.s_Pname }</h4></span></a>
		 
 		  <div>${store.s_Pconfig }</div> 
 		  <div>${store.s_prive }원</div>
 		  
 		</div>
 		  </c:if>
 		
	 </c:forEach>
	  </div>
	 </c:if>
	

</div>
</div>
<!-- ====================================== -->  

<br>
<div align="center">
<input type="hidden" name="member_id" value="${member_id}">
	<c:if test="${member_id == 'master'}">
 		<a href="storeInsertForm.do">상품 추가</a>
	</c:if>
</div>

<div style="clea: "><%@include file="../mainFloor.jsp" %></div>
</body>
</html>