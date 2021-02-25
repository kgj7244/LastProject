<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showtime</title>
<script type="text/javascript">
	window.onload = function() {
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var date = today.getDate();
		document.write("년도 : "+year+"<br>");
		document.write("월 : "+month+"<br>");
		document.write("일 : "+date+"<p>");
		
		for (var i = 0; i < 10; i++) {
			today.setDate(today.getDate()+1);
			var year2 = today.getFullYear();
			var month2 = today.getMonth() + 1;
			var date2 = today.getDate();
			document.write("년도 : "+year2+"<br>");
			document.write("월 : "+month2+"<br>");
			document.write("일 : "+date2+"<br>");
		}
	}
</script>
<style type="text/css">
	{
		width: 100px;
		margin: 0 auto;
	}
</style>
</head>
<body>

</body>
</html>