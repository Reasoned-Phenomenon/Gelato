<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="modalGrid"></div>

<script>
let modalData = [{
	  api: {
	    readData: 	{ 	
	    				url: '${path}/com/findComCodeDeta.do', 
				    	method: 'GET'
	    			},
	    modifyData : { 	
						url: '${path}/com/comCodeDetaModifyData.do', 
				    	method: 'PUT'
					} 
	  },
	  contentType: 'application/json'
}];

const modalGrid = new tui.Grid({
	el: document.getElementById('modalGrid'),
	data: modalData,
	width: 450,
	bodyHeight:300,
	columns: [
	  {
	    header: 'CODE_ID',
	    name: 'CODE_ID'
	  },
	  {
	    header: 'CODE',
	    name: 'CODE'
	  },
	  {
	    header: 'CODE_NM',
	    name: 'CODE_NM'
	  },
	  {
	    header: 'CODE_DC',
	    name: 'CODE_DC'
	  },
	  {
	    header: 'USE_AT',
	    name: 'USE_AT',
	    align: 'center'
	  }
	]
});

	btnFind.addEventListener('click',function (ev) {
	
	})
	
</script>

</body>
</html>