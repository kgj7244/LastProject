<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

			<c:forEach var="movieTheater" items="${showLocList}">
				<tr>
					<td>
						<input type="button" value="${movieTheater.theater.t_title }(${movieTheater.mt_name })" onclick="movieTheaterChk'${movieTheater.mt_name}')">
						<span id="disp-name"></span>
					</td>
				</tr>
			</c:forEach>