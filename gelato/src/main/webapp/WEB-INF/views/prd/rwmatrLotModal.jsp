<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자재 Lot 조회</title>
</head>
<body>
	<br>
	<h1>자재 Lot 조회</h1>
	<br>
	<div id="chooseRwmatrLotGrid"></div>

<script>
	var Grid = tui.Grid;

	function chooseRWI(rwi) {
		chooseRwmatrLotGrid.readData(1,{'rwmatrId':rwi}, true);
	}
	//그리드 테마
	Grid.applyTheme('striped', {
		  cell: {
		    header: {
		      background: '#eef'
		    },
		    evenRow: {
		      background: '#fee'
		    },
			selectedHeader : {
		    	background : '#FFFFFF'
		    }
		  }
		});

	//그리드 생성
	var chooseRwmatrLotGrid = new Grid({
		el: document.getElementById('chooseRwmatrLotGrid'),
		data : {
		  api: {
		    readData: { url:'${path}/prd/chooseRwmatrId.do', method: 'GET'}
		  },
		  contentType: 'application/json'
		},
		rowHeaders:['checkbox','rowNum'],
		selectionUnit: 'row',
		columns:[
			  {
			    header: '자재Lot번호',
			    name: 'lotNo'
			  },
			  {
			    header: '현재고',
			    name: 'qy',
			  },
			  {
			    header: '사용수량',
			    name: 'oustQy',
			    editor : 'text'
			  },
			  {
			    header: '유통기한',
			    name: 'expdate',
			    editor: 'datePicker'
			  }
		  ]
	});
</script>
</body>
</html>