<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원자재 목록</title>
</head>
<style>
h1 {
	text-align: center
}
</style>
<body>
	<br>
	<h1>원자재</h1>
	<br>
	<div id="rwmatrListGrid" style="width: 100%"></div>
	
<script>
var Grid = tui.Grid;
//checkOnlyOne(element);
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
var rwmatrListGrid = new Grid({
	el: document.getElementById('rwmatrListGrid'),
  	data : {
	  api: {
	    readData: { url:'${path}/rwmatr/searchRwmatrList.do', method: 'GET'}
	  },
	  contentType: 'application/json'
	},
  	rowHeaders:['rowNum'],
  	selectionUnit: 'row',
  	columns:[
  		  {
		    header: '자재코드',
		    name: 'rwmatrId'
		  },
		  {
		    header: '자재명',
		    name: 'nm',
		  },
		  {
		    header: '업체명',
		    name: 'vendName',
		  },
		  {
		    header: '규격',
		    name: 'spec'
		  },
		  {
		    header: '작업단위',
		    name: 'wkUnit'
		  }
		]
});


//커스텀 이벤트
rwmatrListGrid.on('dblclick', (ev) => {	
	
	//cell 선택시 row 선택됨.
	rwmatrListGrid.setSelectionRange({
	      start: [ev.rowKey, 0],
	      end: [ev.rowKey, rwmatrListGrid.getColumns().length-1]
	  });
	
	//해당 행의 모든값 객체형태로 매개값으로 담음	
	getRwmatrData(rwmatrListGrid.getRow(ev.rowKey))
	
});

</script>
</body>
</html>