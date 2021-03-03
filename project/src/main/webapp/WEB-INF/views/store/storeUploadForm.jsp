<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가 페이지</title>
</head>
<body>

<div class="container" align="center">

<form action="storeUpload.do" method="post" name="frm"
 enctype="multipart/form-data">
 
<input type="hidden" name="s_num" value="${store.s_num }"> 

<h2 class="text-primary">상품 수정</h2>


<table class="table table-bordered">


<tr><td>상품 분류</td>
<td>
 <select name="s_Pclass">
   <option value="관람권">관람권</option>
   <option value="콤보">콤보</option>
   <option value="팝콘/음료">팝콘/음료</option>
   <option value="이벤트">이벤트</option>
 </select>
</td></tr>


<tr><td>상품 이름</td><td><input type="text" name="s_Pname" 
required="required" value="${store.s_Pname }"></td></tr>

<tr><td>상품 구성</td><td><input type="text" name="s_Pconfig"
required="required" value="${store.s_Pconfig }"></td></tr>

<tr><td>상품 이미지</td><td><input type="file" name="file"
required="required"></td></tr>

<tr><td>가격</td><td><input type="number" name="s_prive"
required="required" value="${store.s_prive }"></td></tr>


<tr><td>판매기간</td>
<td>
<input type="date" name="s_per" value="${store.s_per }">
<input type="date" name="s_pernd" value="${store.s_pernd }">
</td></tr>

<tr><td>총 판매수량</td><td><input type="number" name="s_total"
 value="${store.s_total }"></td></tr>


<tr><td>할인율</td><td><input type="number" name="s_sale"
value="${store.s_sale }"></td></tr>



<tr><td colspan="2" align="center">
<input type="submit" value="확인" class="btn btn-warning"></td></tr>


</table>
</form>
</div>

</body>
</html>