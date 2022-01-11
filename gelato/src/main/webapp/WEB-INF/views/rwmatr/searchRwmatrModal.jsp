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
	
	<!-- 모달창에서 버튼구현 -->
	<button type="button" id="rwmatrSel">선택</button>
	<button type="button" id="closeModal">취소</button>
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
	
/*function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("animal");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
} */
// 그리드 생성
const rwmatrListGrid = new Grid({
	el: document.getElementById('rwmatrListGrid'),
  	data : {
	  api: {
	    readData: { url:'${path}/rwmatr/searchRwmatrList.do', method: 'GET'}
	  },
	  contentType: 'application/json'
	},
  	rowHeaders:[ 'checkbox', 'rowNum'],
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

rwmatrListGrid.on("click", (ev) => {
	console.log(ev);
	console.log(ev.nativeEvent.srcElement.innerHTML);
	console.log(ev.nativeEvent.srcElement.innerText);
	console.log("checked!!!!");
});

$("#closeModal").on("click", function(){
});
</script>
</body>
</html>