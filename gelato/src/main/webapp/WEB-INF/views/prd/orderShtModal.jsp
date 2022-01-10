<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서 조회 modal</title>
</head>
<style>
h1 {
	text-align: center
}
</style>
<body>
	<br>
	<h1>주문서</h1>
	<br>
	<div id="ordershtGrid"></div>
	
	// rmf

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
const ordershtGrid = new Grid({
	el: document.getElementById('ordershtGrid'),
  	data : {
	  api: {
	    readData: 	{ url: '', method: 'GET'},
	    modifyData : { url: '', method: 'PUT'} 
	  },
	  contentType: 'application/json'
	},
  	rowHeaders:[ 'checkbox', 'rowNum'],
  	selectionUnit: 'row',
  	columns:[
  		  {
		    header: '주문서코드',
		    name: 'orderCd'
		  },
		  {
		    header: '주문날짜',
		    name: 'orderDt',
		  },
		  {
		    header: '제품코드',
		    name: 'prdt_id'
		  },
		  {
			header: '제품명',
			name:'prdt_nm',
		  },
		  {
			header: '수량',
			name:'qy',
		  },
		  {
			header: '납기일자',
			name:'oust_dt',
		  }
 		  
		]
});

</script>
</body>
</html>