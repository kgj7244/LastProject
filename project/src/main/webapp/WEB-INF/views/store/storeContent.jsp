<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
</head>
<body> 

<form action="" method="post" name="storeContent">
<input type ="hidden" name = "s_Pclass" value = "${store.s_Pclass }">

<table>
 
<!-- 이름/분류 -->
<tr><td>${store.s_Pname }/${store.s_Pclass }</td></tr>

<tr><td>${store.s_prive }원</td></tr>

<tr><td>상품구성</td><td>${store.s_Pconfig }</td></tr>

<tr><td>유효기간</td><td>${store.s_validity }</td></tr>

<tr><td>이미지</td><td><img src="resources/images/s_pop/${store.s_Pimage}" height="100"></td></tr>

<tr><td>구매 수량</td><td>${store.s_purchase }</td></tr>
<tr><td>총 상품금액</td><td>${total+(s_prive*s_purchase)}</td></tr>


<tr>
<td><input type="button" value="장바구니" onclick="cartList()"></td> 
<td><input type="submit" value="구매하기" ></td>
</tr>

</table>
</form>

</body>
</html>