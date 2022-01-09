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
			<th>대분류</th>
			<th>중분류</th>
			<th>소분류</th>
		</tr>
	</thead>
		
	<tbody>
		<tr>
			<td>대분류 : <input type="text" id="" name="" value="GEL" disabled></td>
			<td>중분류 : <select>
							<option>
						</select>
			</td>
			<td>소분류 : <input type="text" id="" name=""></td>
		</tr>
	</tbody>
</table>
</form>
<br>

<button type="button" class="btn cur-p btn-outline-primary" id="btnSave">저장</button>
<button type="button" class="btn cur-p btn-outline-primary" id="btnAdd">추가</button>
<button type="button" class="btn cur-p btn-outline-primary" id="btnDel">삭제</button>

<button type="button" class="model_bt btn btn-primary" data-toggle="modal" data-target="#myModal" id="">Click Here to Open Model</button>

<hr>
<br>
<div id="grid"></div>

<!-- model popup -->
<!-- The Modal -->
<div class="modal fade" id="myModal">
   <div class="modal-dialog">
      <div class="modal-content">
         <!-- Modal Header -->
         <div class="modal-header">
            <h4 class="modal-title">공통 코드 조회</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
         <!-- Modal body -->
         <div class="modal-body">
         <button type="button" class="btn cur-p btn-outline-primary" id="btnFind">조회</button>
            <div id="modalGrid"></div>
         </div>
         <!-- Modal footer -->
         <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
         </div>
      </div>
   </div>
</div>
<!-- end model popup -->
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

//그리드 컬럼	
const columns = [
			{
			  header: '대분류',
			  name: 'clCode'
			},
			{
			  header: '중분류',
			  name: 'codeId',
			  sortingType: 'desc',
	          sortable: true,
	          validation: {
	              regExp: /^[a-zA-Z0-9]{1,6}$/
	           },
			  editor: 'text'
			},
			{
			  header: '코드이름',
			  name: 'codeIdNm',
			  editor: 'text'
			},
			{
			  header: '코드상세설명',
			  name: 'codeIdDc',
			  editor: 'text'
			},
			{
			    header: '사용여부',
			    name: 'useAt',
			    editor: 'checkbox'
			 }
		];
		
	//그리드 데이터
	const dataSource = {
			
		  api: {
		    readData: 	{ 	
		    				url: '${path}/com/findComCode.do', 
					    	method: 'GET'
		    			},
		    modifyData : { 	
							url: '${path}/com/comCodeModifyData.do', 
					    	method: 'PUT'
						} 
		  },
		  
		  contentType: 'application/json'
		  
	};
		
	//그리드 생성
	const grid = new Grid({
	  el: document.getElementById('grid'),
	  data : dataSource,
	  rowHeaders:['rowNum','checkbox'],
	  columns
	  /* ,draggable: true */
	});
	

//그리드 이벤트	
	grid.on('click', (ev) => {
	  	console.log('clicked!!');
		console.log(ev)
	});
	
	btnSave.addEventListener("click",function(){
		grid.request('modifyData');
	})	

	grid.on('response', function(ev) {
		console.log('response')
		console.log(ev)
	})
	
	btnAdd.addEventListener("click",function(){
		grid.appendRow({
			"clCode": "GEL",
			"useAt":"Y"
		},{focus:true})
	})
	
	btnDel.addEventListener("click",function(){
		//removeRow(rowKey, options)
		grid.removeCheckedRows(true); //true -> 확인 받고 삭제 / false는 바로 삭제
	})
	
	let testData = [{
			
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
	      data: testData,
	      columns: [
	        {
	          header: 'codeId',
	          name: 'codeId'
	        },
	        {
	          header: 'code',
	          name: 'code'
	        },
	        {
	          header: 'codeNm',
	          name: 'codeNm'
	        },
	        {
	          header: 'codeDc',
	          name: 'codeDc'
		    }
	      ]
	    });
	 
	btnFind.addEventListener('click',function (ev) {
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
	})
	
	/* fetch("${path}/com/comCodeDetaCodeId.do",{codeId:"INF001"})
	.then(res=>res.json())
	.then(result=> {
		console.log("여기~~")
		console.log(result)
	}) */
	
	
</script>
</body>
</html>