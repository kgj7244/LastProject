<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../header.jsp" %>   
 <%@include file="../mainTop.jsp" %>
 <%@include file="../mainNav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>스토어</h2>
<div class="container" align="center">
 <%@include file="storecategory.jsp" %>


<table class="table table-striped">

 <tr>
 <td>상품이름</td>
 <td>상품구성</td>
 <td>상품 이미지</td>
 <td>가격</td>
 </tr>
 
<!-- ====================================== -->

 <c:if test="${empty storeList }">
 <tr><td colspan="4">상품정보가 없습니다</td></tr>
 </c:if>

<!-- ====================================== --> 
 <c:if test="${not empty storeList }">
 <c:forEach var="store" items="${storeList }">
 
  <tr>
  <td><a class="btn btn-success btn-sm"
  href="storeContent.do?s_num=${store.s_num }"> ${store.s_Pname }</a></td>
 
  <td>${store.s_Pconfig }</td>
  <td><img alt="" src="resources/images/s_pop/${store.s_Pimage}" height="100"></td>
  <td>${store.s_prive }</td>
  </tr>
  
 </c:forEach></c:if></table>
<!-- ====================================== -->  

<div align="center">
 <a href="storeInsertForm.do">상품 추가</a>
</div>
</div>
</body>
</html>