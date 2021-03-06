<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고예정 목록</title>
</head>
<style>
h1 {
	text-align: center
}
</style>
<body>
	<br>
	<h1>입고예정 목록</h1>
	<br>
	<div id="rwmatrPassListGrid" style="width: 100%"></div>
	
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
var rwmatrPassListGrid = new Grid({
	el: document.getElementById('rwmatrPassListGrid'),
  	data : {
	  api: {
	    readData: { url:'${path}/rwmatr/rwmatrPassList.do', method: 'GET'}
	  },
	  contentType: 'application/json'
	},
  	rowHeaders:['rowNum'],
  	bodyHeight: 235,
  	selectionUnit: 'row',
  	columns:[
 		  {
		    header: '발주코드',
		    name: 'orderId',
		    sortable: true
		  },
		  {
		    header: '발주디테일코드',
		    name: 'rwmatrOrderDetaId',
			hidden:true
		  },
  		  {
		    header: '자재코드',
		    name: 'rwmatrId',
		    sortable: true
		  },
		  {
		    header: '자재명',
		    name: 'nm',
		    sortable: true
		  },
		  {
		    header: '업체명',
		    name: 'vendName',
		    sortable: true
		  },
		  {
		    header: '입고량',
		    align: 'right',
		    name: 'passQy',
		    sortable: true
		  },
		  {
		    header: '검사일자',
		    name: 'dt',
		    editor: 'datePicker'
		  }
		]
});


//커스텀 이벤트
rwmatrPassListGrid.on('dblclick', (ev) => {	
	
	//cell 선택시 row 선택됨.
	rwmatrPassListGrid.setSelectionRange({
	      start: [ev.rowKey, 0],
	      end: [ev.rowKey, rwmatrPassListGrid.getColumns().length-1]
	  });
	
	//입고할 자재주문 중복선택 방지
	//검사할 자재주문 중복선택 방지
	let rowLength = rwmatrIstList.findRows({
		rwmatrOrderDetaId: rwmatrPassListGrid.getRow(ev.rowKey).rwmatrOrderDetaId
	}).length;
	
	if(rowLength > 0) {
		console.log("중복체크1111")
		//toastr
		toastr.clear()
		toastr.success( ('이미 선택한 자재입니다.'),'Gelato',{timeOut:'1800'} );
		return;
		
	} 
	
	
	getRwmatrData(rwmatrPassListGrid.getRow(ev.rowKey));
});

</script>
</body>
</html>