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
var searchPlanGrid = new Grid({
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

// 그리드 이벤트
// 클릭 이벤트

searchPlanGrid.on("dblclick", (ev) => {
	
	searchPlanGrid.setSelectionRange({
	    start: [ev.rowKey, 0],
	    end: [ev.rowKey, searchPlanGrid.getColumns().length-1]
	});
	
	var spg = searchPlanGrid.getRow(ev.rowKey).planId;
	console.log(spg);
	choosePI(spg);
});


</script>
</body>
</html>