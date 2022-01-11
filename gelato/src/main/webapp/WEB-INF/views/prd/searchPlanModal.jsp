<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과 조회 modal</title>
</head>
<style>
h1 {
	text-align: center
}
</style>
<body>
	<br>
	<h1>생산계획 검색</h1>
	<br>
	<div id="searchPlanGrid"></div>
	
	<!-- 모달창에서 버튼구현 -->
	<button type="button" id = "choOrderSht">선택</button>
	<button type="button" id = "closeModal">취소</button>
	<script>
var Grid = tui.Grid;

//그리드 테마
Grid.applyTheme('striped', {
	  cell: {
	    header: {
	      background: '#eef'
	    },
	    evenRow: {
	      background: '#fee'
	    }
	  }
	});
	
// 그리드 생성
const searchPlanGrid = new Grid({
	el: document.getElementById('searchPlanGrid'),
  	data : {
	  api: {
	    readData: { url:'${path}/prd/searchPlanList.do', method: 'GET'}
	  },
	  contentType: 'application/json'
	},
  	rowHeaders:['rowNum'],
  	selectionUnit: 'row',
  	columns:[
  		  {
		    header: '계획코드',
		    name: 'planId'
		  },
		  {
		    header: '계획명',
		    name: 'name',
		  },
		  {
		    header: '계획일자',
		    name: 'dt'
		  }
 		  
		]
});

</script>
</body>
</html>