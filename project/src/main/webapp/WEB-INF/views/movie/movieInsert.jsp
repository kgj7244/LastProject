<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 목록 추가 결과</title>
</head>
<body>
	<c:if test="${result > 0}">
		<script type="text/javascript">
			alert("입력 성공했습니다.");
			location.href="movieMainForm.do";
		</script>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("입력 실패했습니다. 다시 시도해주세요.");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${result == -1}">
		<script type="text/javascript">
			alert("이미 있는 영화 번호입니다. 다른 번호로 적어주세요");
			history.go(-1);
		</script>
	</c:if>
	<%-- 영화 번호 : ${m_num}
	제목 : ${m_title}
	줄거리 : ${m_content}
	장르 : ${m_genre}
	등급 : ${m_rank}
	상영 시간 : ${m_time}분
	개봉일 : ${m_opendate}
	상태 : ${m_state}
	감독 : ${m_director}
	배우 : ${m_actor}
	포스터 이름 : ${m_poster}
	<img alt="" src="resources/images/m_poster/${m_poster}"> --%>
	
</body>
</html>