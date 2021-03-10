<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../header.jsp" %>
<select name="mt_name" id="mt_name">
	<c:forEach var="mt" items="${mTheater}">
			<option>${mt.mt_name}</option>
	</c:forEach>							
</select>