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

<div class="container" align="left">

<input type="hidden" name="s_Pclass" value="${store.s_Pclass}">
 	
<a class="btn btn-link" href="storeMainForm.do">전체</a>
<a class="btn btn-link" href="i_snack.do?s_Pclass=1">관람권</a>
<a class="btn btn-link" href="i_snack.do?s_Pclass=2">콤보</a>
<a class="btn btn-link" href="i_snack.do?s_Pclass=3">팝콘/음료</a>
<a class="btn btn-link" href="i_snack.do?s_Pclass=4">이벤트</a>
 

</div>
</body>
</html>