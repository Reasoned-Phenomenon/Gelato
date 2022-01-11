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