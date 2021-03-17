<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#pa {font-size: medium;}

</style>

</head>
<body>

<div class="container" align="left">

<input type="hidden" name="s_Pclass" value="${store.s_Pclass}">
 	
<a class="btn btn-outline-info" href="storeMainForm.do" id="pa">전체</a>
<a class="btn btn-outline-info" href="i_snack.do?s_Pclass=1" id="pa">관람권</a>
<a class="btn btn-outline-info" href="i_snack.do?s_Pclass=2" id="pa">콤보</a>
<a class="btn btn-outline-info" href="i_snack.do?s_Pclass=3" id="pa">팝콘/음료</a>
<a class="btn btn-outline-info" href="i_snack.do?s_Pclass=4" id="pa">이벤트</a>
</div>
<br>


</body>
</html>