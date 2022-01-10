<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world! 
</h1>
<div align="center">
	<img src="${path}/resources/images/home_img.jpg">
</div>
</body>
</html>
