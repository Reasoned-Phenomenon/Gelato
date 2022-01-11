<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 조회 modal</title>
</head>
<body>
	
	<br>
	<h3>업체 검색</h3>
	<div id="vendListGrid" style="width: 100%"></div>
	
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
const vendListGrid = new Grid({
	el: document.getElementById('vendListGrid'),
  	data : {
	  api: {
	    readData: { url:'${path}/biz/vendList.do', method: 'GET'}
	  },
	  contentType: 'application/json'
	},
  	rowHeaders:[ 'rowNum'],
  	selectionUnit: 'row',
  	columns:[
  		  {
		    header: '업체 코드',
		    name: 'vendId'
		  },
		  {
		    header: '업체 명',
		    name: 'vendName',
		  },
		  {
		    header: '사업자 등록번호',
		    name: 'bizno'
		  },
		  {
			header: '전화 번호',
			name:'telno',
		  }
		]
});
	
</script>
</body>
</html>