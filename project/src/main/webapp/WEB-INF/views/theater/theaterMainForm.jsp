<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showtime</title>
<script type="text/javascript">
	window.onload = function() {
		var today = new Date(2021,1,26);
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var date = today.getDate();
		document.write("년도 : "+year+"<br>");
		document.write("월 : "+month+"<br>");
		document.write("일 : "+date+"<p>");
		
		
		today.setDate(today.getDate()+10);
		var year2 = today.getFullYear();
		var month2 = today.getMonth() + 1;
		var date2 = today.getDate();
		document.write("년도 : "+year2+"<br>");
		document.write("월 : "+month2+"<br>");
		document.write("일 : "+date2+"<br>");
		
	}
</script>
</head>
<body>

</body>
</html>