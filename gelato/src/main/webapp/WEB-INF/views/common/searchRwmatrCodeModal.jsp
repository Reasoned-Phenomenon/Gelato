<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <br>
	<h3>자재 코드 검색</h3>
	<div id="rwmatrCodeGrid" style="width: 100%"></div>
	
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
	var rwmatrCodeGrid = new Grid({
		el: document.getElementById('rwmatrCodeGrid'),
	  	data : {
		  api: {
		    readData: { url:'${path}/com/rwmatrCodeModal.do', method: 'GET'}
		  },
		  contentType: 'application/json'
		},
	  	rowHeaders:[ 'rowNum'],
	  	selectionUnit: 'row',
	  	columns:[
	  		  {
			    header: '자재 코드',
			    name: 'rwmatrId',
			    align: 'center'
			  },
			  {
			    header: '자재 명',
			    name: 'nm',
			    align: 'center'
			  }
			 
			]
	});
	
	
	</script>
	
</body>
</html>