<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 목록</title>
</head>
<style>
h1 {
	text-align: center
}
</style>
<body>
	<br>
	<h1>거래처</h1>
	<br>
	<div id="vendListGrid" style="width: 100%"></div>
	
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
var vendListGrid = new Grid({
	el: document.getElementById('vendListGrid'),
  	data : {
	  api: {
	    readData: { url:'${path}/rwmatr/searchVendList.do', method: 'GET'}
	  },
	  contentType: 'application/json'
	},
  	rowHeaders:['rowNum'],
  	selectionUnit: 'row',
  	columns:[
  		  {
		    header: '업체코드',
		    name: 'vendId'
		  },
		  {
		    header: '업체명',
		    name: 'vendName',
		  },
		  {
		    header: '비고',
		    name: 'remk',
		  }
		]
});

/* rwmatrListGrid.on("click", (ev) => {
	console.log(rwmatrListGrid.getRow(ev.rowKey).rwmatrId);
	console.log(rwmatrListGrid.getRow(ev.rowKey).nm);
	let rmId = rwmatrListGrid.getRow(ev.rowKey).rwmatrId;
	let rmnm = rwmatrListGrid.getRow(ev.rowKey).nm;
	
	
}); */

//이벤트
vendListGrid.on('dblclick', (ev) => {	
	
	//cell 선택시 row 선택됨.
	vendListGrid.setSelectionRange({
	      start: [ev.rowKey, 0],
	      end: [ev.rowKey, vendListGrid.getColumns().length-1]
	  });
	
	//클릭한 row의 codeId에 해당하는 code를 읽어옴
	//console.log(modalGrid.getRow(ev.rowKey))
	let rmId = vendListGrid.getRow(ev.rowKey).rwmatrId;
	let rmnm = vendListGrid.getRow(ev.rowKey).nm;
	console.log(rmId)
	console.log(rmnm)
	getData(rmId, rmnm)
});

</script>
</body>
</html>