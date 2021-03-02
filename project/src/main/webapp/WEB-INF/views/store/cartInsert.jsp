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

<c:if test="${result >=0 }">
 <script type="text/javascript">
	if(confirm("장바구니에 담았습니다\n장바구니로 이동하시겠습니까?") == true){
		location.href="cartList.do?cart_id=${cart_id}";
	}else{
		history.go(-1);	
	}
 </script>
</c:if>

<c:if test="${result<0}">
<script type="text/javascript">
	alert("이미 장바구니에 있는 상품입니다.");
	history.go(-1);
 </script>
</c:if>

</body>
</html>