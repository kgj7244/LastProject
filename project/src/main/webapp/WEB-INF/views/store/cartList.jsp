<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>

<form  action="order.do" method="post" name=order>
<input type ="hidden" name = "s_num" value = "${cart.s_num }">
<input type ="hidden" name = "s_Pname" value = "${cart.s_Pname }">
<input type ="hidden" name = "s_Pimage" value = "${cart.s_Pimage }">
<input type ="hidden" name = "s_prive" value = "${cart.s_prive }">


<table>

<tr>
<th>#</th>
<th>상품명</th>
<th>판매금액</th>
<th>수량</th>
<th>구매금액</th>
</tr>

<c:if test="${empty list }">
<tr><td colspan="5">장바구니가 비어있습니다</td></tr></c:if>

<c:if test="${not empty list }">
 
 <c:forEach var="cart" items="${list }">

 
 <tr>
 <td><img src="s_Pimage/${cart.s_Pimage }" height="100" alt="${cart.s_Pimage }"></td>

 <td>${cart.s_Pname}</td>
 <td>${cart.s_prive}원</td> 
 <td><input type="checkbox">선택</td>
 
 </tr>

 <c:set var="price" value="${cart.s_prive}"/>
 <c:set var="count" value="${cart.s_purchase}"/>
 <c:set var="total" value="${total+(s_prive*s_purchase)}"/>
</c:forEach>
 <tr>
     <th colspan="6" class="buy">상품구매금액 : ${total}원</th>    
</tr>

    <tr>
<td><input type="submit" class="order" value="주문하기"></td>
 <td><input type="button" value="삭제하기" onclick="location.href='storeDelete.do?s_num=${store.s_num}'"></td>
</tr>


</c:if>
</table>
</form>
</body>
</html>