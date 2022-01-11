<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
설비구분 검색
<a href="#">배합</a>
<a href="#">운송</a>
<script>
	$("a").on("click", function(){
		var co = $(this).html();
		$("#txtCo").val(co);
		dialog.dialog("close");
	})
</script>
</body>
</html>