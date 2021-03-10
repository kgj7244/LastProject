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
<table class="table table-hover">
	<c:forEach var ="i" items="${screen}">
			<tr>
				<td width="15%" align="center" style="vertical-align:middle;"> <!-- 시간 -->
					<span onclick="AllSelectChk(${i.mt_num},${i.sc_num},'${i.mt_name}','${i.sc_start}','${movie.m_title}','${theater.t_title}',${i.t_num})">
					<div>${i.sc_start}</div>
					<div>~</div>
					<div>${i.sc_end}</div>
					</span>
				</td>
				<td width="53%" align="center" style="vertical-align:middle;"> <!-- 제목 movie/theater -->
					<span style="padding-top: 30px; padding-bottom: 30px;"  onclick="AllSelectChk(${i.mt_num},${i.sc_num},'${i.mt_name}','${i.sc_start}','${movie.m_title}','${theater.t_title}',${i.t_num})">${movie.m_title}</span>
				</td>
				<td width="22%" align="center" style="vertical-align:middle;">
					<span style="padding-top: 30px; padding-bottom: 30px;" onclick="AllSelectChk(${i.mt_num},${i.sc_num},'${i.mt_name}','${i.sc_start}','${movie.m_title}','${theater.t_title}',${i.t_num})">${theater.t_title}</span><p> 
					<%-- <span>(${i.st_name}/100)</span> --%>
					<span style="font-size: 13px; font-weight: bold;">
						<c:choose>
							<c:when test="${i.mt_name == '1관'}">
								(${i.cnt}/50)
							</c:when>								
							<c:when test="${i.mt_name == '2관'}">
								(${i.cnt}/70)
							</c:when>									
							<c:when test="${i.mt_name == '3관'}">
								(${i.cnt}/80)
							</c:when>									
							<c:when test="${i.mt_name == '4관'}">
								(${i.cnt}/90)
							</c:when>
							<c:when test="${i.mt_name == '5관'}">
								(${i.cnt}/100)
							</c:when>							
						</c:choose>
					</span>
				</td>
				<td width="15%" align="center" style="vertical-align:middle;">
					<input type="button" id="btnChk" value="${i.mt_name}" onclick="AllSelectChk(${i.mt_num},${i.sc_num},'${i.mt_name}','${i.sc_start}','${movie.m_title}','${theater.t_title}',${i.t_num})" style="background-color: rgba( 255, 255, 255, 0.0 ); border: none; padding-top: 30px; padding-bottom: 30px;">
				</td>
			</tr>
	</c:forEach>
</table>
</body>
</html>