<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비리스트 | AAM</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('#movieList2').load("movieList.do","m_ing=${movie.m_ing}&keyword=${movie.keyword}&pageNum=${pageNum}");
	    $("#chk_nowshow").change(function(){
	        if($("#chk_nowshow").is(":checked")){
	        	var m_ing = "1"; // 값이 있다
	        	$.post("movieList.do","m_ing="+m_ing+"&keyword="+frm27.keyword.value+"&pageNum=${pageNum}", function(data) {
					frm27.m_ing.value="1";
	    			$('#movieList2').html(data);
	    		});
	        }else{
	        	var m_ing = "0"; // 값이 없다
	        	$.post("movieList.do","m_ing="+m_ing+"&keyword="+frm27.keyword.value+"&pageNum=${pageNum}", function(data) {
	        		frm27.m_ing.value="0";
	    			$('#movieList2').html(data);
	    		});
	        }
	    });
	});
</script>
</head>
<body>
	<div><%@include file="../mainTop.jsp" %></div>
	<div><%@include file="../mainNav.jsp" %></div>
	<div class="container">
		<div align="left"><h2>무비리스트</h2></div>
		<hr style="border: 0px; height: 3px; background-color: #cccccc;">
		<div class="nowshow">
        	<c:if test="${movie.m_ing == '1'}">
	        	<input type="checkbox" id="chk_nowshow"  title="현재 선택됨" checked="checked"/>
	            <label for="chk_nowshow">현재 상영작만 보기</label>
            </c:if>
            <c:if test="${movie.m_ing == '0'}">
	        	<input type="checkbox" id="chk_nowshow"/>
	            <label for="chk_nowshow">현재 상영작만 보기</label>
            </c:if>                
       	</div>
       	<div>
			<form action="movieMainForm.do" name ="frm27">
				<input type="hidden" name="m_ing" value="${movie.m_ing}">
				<input type="hidden" name="pageNum" value="1">
				<input type="text" name="keyword" value="${moive.keyword}" placeholder="영화 검색">
				<input type="submit" value="검색" class="btn btn-warning btn-sm">
			</form>
       	</div>
		<div id="movieList2"></div>
	</div>
	<div><%@include file="../mainFloor.jsp" %></div>
</body>
</html>