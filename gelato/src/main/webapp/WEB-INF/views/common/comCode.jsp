<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>공통 코드 관리</h3>
<form>
<table border="1">
	<thead>
		<tr>
			<th>코드ID</th>
			<th>코드</th>
		</tr>
	</thead>
		
	<tbody>
		<tr>
			<td>코드ID</td>
			<td>코드 : <input type="text" id="" name=""></td>
		</tr>
	</tbody>
</table>
</form>
<br>

<button type="button" class="btn cur-p btn-outline-primary" id="btnSave">저장</button>
<button type="button" class="btn cur-p btn-outline-primary" id="btnAdd">추가</button>
<button type="button" class="btn cur-p btn-outline-primary" id="btnDel">삭제</button>

<button type="button" class="model_bt btn btn-primary" data-toggle="modal" data-target="#myModal" id="">Modal</button>

<hr>
<br>
<div class="row">
	<div id="codeIdGrid" class="col-sm-4"></div>
	<div id="codeGrid" class="col-sm-8"></div>
</div>


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

//그리드 생성
const codeIdGrid = new Grid({
	el: document.getElementById('codeIdGrid'),
  	data : {
	  api: {
	    readData: 	{ url: '${path}/com/findComCode.do', method: 'GET'},
	    modifyData : { url: '${path}/com/comCodeModifyData.do', method: 'PUT'} 
	  },
	  contentType: 'application/json'
	},
  	rowHeaders:['rowNum'],
  	selectionUnit: 'row',
  	columns:[
			{
			  header: '코드ID',
			  name: 'codeId',
			  sortingType: 'desc',
	          sortable: true
			},
			{
			  header: '코드ID이름',
			  name: 'codeIdNm'
			},
			{
			  header: '코드ID이름',
			  name: 'codeIdDc',
			  hidden:true
			}
		]
});
/* codeIdGrid.on('click', function (ev) {
	  var record = {
	    start: [ev.rowKey, 0],
	    end: [ev.rowKey, codeIdGrid.getColumns().length]
	  }
	  codeIdGrid.setSelectionRange(record);
}); */
//그리드 이벤트	
codeIdGrid.on('click', (ev) => {
	if(ev.rowKey !=''){
		codeParam = codeIdGrid.getRow(ev.rowKey).codeId;
		
		codeGrid.readData(1, {codeId:codeIdGrid.getRow(ev.rowKey).codeId}, true);
	}

	/* console.log(ev.rowKey)
	console.log(ev.columnName)
	console.log(codeIdGrid.getValue(ev.rowKey,ev.columnName)) */
	
  	/* if(ev.targetType == 'cell'){
  		if(ev.columnName == 'codeId') {
  			codeParam = {codeId:codeIdGrid.getValue(ev.rowKey,ev.columnName)}
  			codeGrid.request('modifyData');
  		}
  	} */
	
});

codeIdGrid.on('response', function(ev) {
	console.log('response')
	console.log(ev)
})
	
	
const codeGrid = new tui.Grid({
	el: document.getElementById('codeGrid'),
	data: {
			api: {
			    readData: 	{url: '${path}/com/findComCodeDeta.do', method: 'GET' },
			    modifyData : { url: '${path}/com/comCodeDetaModifyData.do', method: 'PUT'} 
		  	},
			contentType: 'application/json',
			initialRequest: false
	},
    columns: [
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

	//버튼 이벤트
	btnSave.addEventListener("click",function(){
		//grid.request('modifyData');
	})	

	btnAdd.addEventListener("click",function(){
		//grid.appendRow({focus:true})
	})
	
	btnDel.addEventListener("click",function(){
		//removeRow(rowKey, options)
		//grid.removeCheckedRows(true); //true -> 확인 받고 삭제 / false는 바로 삭제
		//grid.request('modifyData');
	})
	 
	/* btnFind.addEventListener('click',function (ev) {
		console.log(ev)
		fetch("${path}/com/comCodeDetaCodeId.do", {
		  method: 'POST',
		  body: JSON.stringify({codeId:"INF001"}),
		  headers:{
		    'Content-Type': 'application/json'
		  }})
		.then(res=>res.json())
		.then(result=> {
			console.log(result)
			testData = result
			modalGrid.resetData(testData);
		})
	}) */

	
</script>
</body>
</html>