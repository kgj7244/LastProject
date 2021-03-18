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
<%@include file="../mainTop.jsp" %>
<%@include file="../mainNav.jsp" %>
<div class="container" align="center">



	<table class="table table-hover" style="margin-top: 30px;">
		<tr>
			<td align="center" style="font-weight: bold; background-color: #fedf9e; vertical-align: middle; color: #908c88; height: 60px; font-size: 30px; margin-top: 30px;">
			상품 추가</td>
		</tr>
	</table>	
<form action="storeInsert.do" method="post" name="frm"
 enctype="multipart/form-data">

<table class="table table-bordered">

<tr><td>상품 분류</td>
<td>
 <select name="s_Pclass">
   <option value="1">관람권</option>
   <option value="2">콤보</option>
   <option value="3">팝콘/음료</option>
   <option value="4">이벤트</option>
 </select>
</td></tr>


<tr><td >상품 이름</td><td><input type="text" name="s_Pname" 
required="required"></td></tr>

<tr><td>상품 구성</td><td><input type="text" name="s_Pconfig"
required="required"></td></tr>

<tr><td>상품 이미지</td><td><input type="file" name="file"
required="required"></td></tr>

<tr><td>가격</td><td><input type="number" name="s_prive"
required="required"></td></tr>


<tr><td>판매기간</td>
<td>
<input type="date" name="s_per" value="1111-01-01">
<input type="date" name="s_pernd" value="9999-12-31">
</td></tr>

<tr><td>총 판매수량</td><td><input type="number" name="s_total"  value="99999"></td></tr>

<tr><td>할인율</td><td><input type="number" name="s_sale"  value="0"></td></tr>

<tr><td colspan="2" align="center">
<input type="submit" value="확인" class="btn btn-warning"></td></tr>


</table>
</form>
</div>

<%@ include file="../mainFloor.jsp" %>
</body>
</html>