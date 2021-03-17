<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>


</head>
<body>
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>



<div class="container" align="center">

<c:if test="${result >0 }">
 <script type="text/javascript">
 alert("결제가 완료되었습니다");
 </script>


 <table ><tr><td><h2>상품 구매가 완료되었습니다</h2></td></tr></table>
 	<hr style="border: 0px; height: 1px; background-color: #cccccc;">
 
 <table style="width: 500px; height: 200px;">
 
   <tr>
  <td colspan="2"><img alt="" src="resources/images/s_pop/${store.s_Pimage}" height="150">
  ${ store.s_Pname }</td></tr>



				<tr>
					<th>구성품</th>
					<td>${store.s_Pconfig }</td>
				</tr>

				<tr>
					<th>총 상품금액</th>
					<td><fmt:formatNumber pattern="###,###"
							value="${ord.full_price}" />원</td>
				</tr>



				<tr>
					<th>거래방법</th>
					<td>${bank.t_deal}</td>
				</tr>


			
 	
 	<tr>

<th>유효기간</th>
<td>${ord.s_validity}</td> 
</tr>
 	
 </table>
</c:if>

	<a href="mainForm.do" class="btn btn-warning"
   style="width: 230px; height: 40px; font-weight: bold; font-size: 15px; 
   vertical-align:middle; bottom: 0; margin-right: 5px;">메인으로</a>

</div>



<c:if test="${result ==0 }">
 <script type="text/javascript">
 alert("구매 실패했습니다. 다시 확인해주세요");
 history.go(-1);
 </script>
</c:if>

<c:if test="${result ==-1 }">
 <script type="text/javascript">
 alert("오류가 발생했습니다.");
 history.go(-1);
 </script>
</c:if>
<%@ include file="../mainFloor.jsp" %>
</body>
</html>