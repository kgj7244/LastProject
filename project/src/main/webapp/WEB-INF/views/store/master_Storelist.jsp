<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어 상품 목록</title>
</head>
<body>
	<div><%@include file="../mainTop.jsp" %></div>
	<div><%@include file="../mainNav.jsp" %></div>
	<div class="container" align="center">
		<div align="left"><h2>스토어 전체 목록</h2></div>
		
		<hr style="border: 0px; height: 3px; background-color: #cccccc;">
		
		
		<table class="table table-bordered table-striped">
			<tr>
				<td>상품번호</td>
				<td>분류</td>
				<td>이름</td>
				
				<td>상품구성</td>				
				<td>가격</td>
				
				<td>상태</td>				
				<td>관리</td>
			</tr>
			<c:forEach var="store" items="${storeList}">
				<tr>
					<td align="center">${store.s_num}</td>
		
	<c:if test="${store.s_Pclass=='1'}"><td>관람권</td></c:if>
	<c:if test="${store.s_Pclass=='2'}"><td>콤보</td></c:if>
	<c:if test="${store.s_Pclass=='3'}"><td>팝콘/음료</td></c:if>
	<c:if test="${store.s_Pclass=='4'}"><td>이벤트</td></c:if>
		
			
									
				<c:if test="${store.s_del=='n'}">		
					<td>
						<a href="storeContent.do?s_num=${store.s_num}" style="text-decoration: none;  color: black;">
							<strong>${store.s_Pname}</a>
					</td>
				</c:if>		
				
				<c:if test="${store.s_del=='y'}">	
					
					<td style="text-decoration:line-through">
						<a href="storeContent.do?s_num=${store.s_num}" style="text-decoration: none;  color: black;">
							${store.s_Pname}</a>
					</td>
					
				</c:if>
					<td>${store.s_Pconfig}</td>
				
		<td><fmt:formatNumber pattern="###,###" value="${store.s_prive}"/>원</td>


					<c:if test="${store.s_del=='n'}">
						<td>구매 가능</td>
					</c:if>

					<c:if test="${store.s_del=='y'}">
						<td>상품 삭제</td>
					</c:if>
					
					
<c:if test="${store.s_del=='n'}">
	<td>
		<a class="btn btn-warning btn-sm"
			href="storeUploadForm.do?s_num=${store.s_num}">수정</a>

		<a class="btn btn-danger btn-sm"
			href="storeDelete.do?s_num=${store.s_num}">삭제</a>
			</td>
		</c:if>
		
		
	<c:if test="${store.s_del=='y'}">
	<td>
		<a class="btn btn-primary"
			href="storeRestore.do?s_num=${store.s_num}">상품 복원</a>
			
		</c:if>
		
		
		
				</tr>
			</c:forEach>
		</table>
		<a href="mypage.do" class="btn btn-info">관리자 페이지</a>
		<a href="storeInsertForm.do" class="btn btn-success">스토어 상품 추가</a>
		</div>
		
		