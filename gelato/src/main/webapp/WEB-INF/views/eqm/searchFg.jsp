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
<div id="codeGrid"></div>

<script>
let codeParam;

var Grid = tui.Grid;

/* var modalDataSource = {
		api: {
		    readData: 	{url: '${path}/com/findComCodeDeta.do', method: 'GET' }
	  	},
		contentType: 'application/json'
	};
	
var columns = 	[
	  {
		    header: 'CODE',
		    name: 'code'
		  },
		  {
		    header: 'CODE_NM',
		    name: 'codeNm'
		  },
		  {
		    header: 'CODE_DC',
		    name: 'codeDc'
		  },
		  {
		    header: 'USE_AT',
		    name: 'useAt',
		    align: 'center'
		  }
		];
		
var modalGrid = new tui.Grid({
	el: document.getElementById('modalGrid'),
	data: modalDataSource,
	width: 450,
	bodyHeight:300,
	selectionUnit: 'row',
	columns 
}); */

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


const codeGrid = new Grid({
	el: document.getElementById('codeGrid'),
  	data : {
	  api: {
	    readData: 	{ url: '${path}/com/findComCode.do', method: 'GET'}
	  },
	  contentType: 'application/json'
	},
  	rowHeaders:['rowNum'],
  	selectionUnit: 'row',
  	columns:[
			{
			  header: '구분코드',
			  name: 'code',
			  sortingType: 'desc',
	          sortable: true
			},
			{
			  header: '구분명',
			  name: 'codeNm'
			}
		]
});
</script>
</body>
</html>