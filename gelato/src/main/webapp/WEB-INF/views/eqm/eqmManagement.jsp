<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설비관리(조회, 수정/삭제)</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
    href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
</head>
<body>
	<br>
	<h2>설비관리</h2>
	<br>
	<div>
		<label>구분</label> 
		<select name="gubun">
			<option value="전체" <c:if test="${eqm.gubun == '전체'}">selected</c:if>>전체
			<option value="배합" <c:if test="${eqm.gubun == '배합'}">selected</c:if>>배합
			<option value="운송" <c:if test="${eqm.gubun == '운송'}">selected</c:if>>운송
			<option value="측정" <c:if test="${eqm.gubun == '측정'}">selected</c:if>>측정
			<option value="가공" <c:if test="${eqm.gubun == '가공'}">selected</c:if>>가공
		</select>
		<button>조회</button>
	</div>
	<div id="codeGrid" style="width: 500px;"></div>
<script>	
var Grid = tui.Grid;
const codeGrid = new Grid({
	el: document.getElementById('codeGrid'),
	data : {
	  api: {
	    readData: 	{ url: '${path}/eqm/eqmList.do', method: 'GET'}
	  },
	  contentType: 'application/json'
	},
	rowHeaders: ['checkbox'],
	selectionUnit: 'row',
	bodyHeight: 600,
	pageOptions: {
	    type: 'scroll'
    },
	columns:[
			{
	          header: '설비코드',
	          name: 'eqmId'
	        },
	        {
	          header: '설비명',
	          name: 'eqmName'
	        },
	        {
	          header: '공정코드',
	          name: 'prcsId'
	        },
	        {
	          header: '공정명',
	          name: 'name'
	        },
	        {
	          header: '사용여부',
	          name: 'useYn'
	        }
		]
});

</script>
</body>
</html>