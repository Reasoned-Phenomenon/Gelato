<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
</head>
<body>
<h3>원자재 발주관리</h3>
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
<button type="button" class="btn cur-p btn-outline-primary" id="btnFind">조회</button>
<button type="button" class="btn cur-p btn-outline-primary" id="btnRst">초기화</button>
<button type="button" class="btn cur-p btn-outline-primary" id="btnAdd">추가</button>
<button type="button" class="btn cur-p btn-outline-primary" id="btnDel">삭제</button>
<button type="button" class="btn cur-p btn-outline-primary" id="btnSave">저장</button>

<button type="button" class="btn btn-secondary" id="rwmatrList">자재 목록</button>

<hr>
<br>

	<!-- 발주목록 조회 -->
	<div id="rwmatrOrderList" style="width: 100%"></div>

	<!-- 자재목록 모달창 -->
	<div id="rwmatrDialog" title="원자재 목록"></div>

<script>
let rwmatrDialog;
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
var rwmatrOrderList = new Grid({
	el: document.getElementById('rwmatrOrderList'),
	data : {
	  api: {
	    readData: 	{ url: '${path}/rwmatr/rwmatrOrderList.do', method: 'GET'},
	    modifyData : { url: '${path}/rwmatr/rwmatroModifyData.do', method: 'PUT'} 
	  },
	  contentType: 'application/json'
	},
	rowHeaders: ['checkbox'],
	selectionUnit: 'row',
	bodyHeight: 600,
	pageOptions: {
	    type: 'scroll'
    },
	columns:[
			{
			  header: '발주코드',
			  name: 'orderId',
			  editor: 'text'
			},
			{
			  header: '자재명',
			  name: 'nm',
			  editor: 'text'
			},
			{
			  header: '자재코드',
			  name: 'rwmatrId',
			  editor: 'text'
			},
			{
			  header: '단가',
			  name: 'untprc',
			  editor: 'text'
			},
			{
			  header: '발주량',
			  name: 'qy',
			  editor: 'text'
			},
			{
			  header: '업체명',
			  name: 'vendName',
			  editor: 'text'
			},
			{
			  header: '발주신청일',
			  name: 'orderDt',
			  editor: 'text'
			},
			{
			  header: '납기요청일',
			  name: 'dudt',
			  editor: 'text'
			}
		]
});

function callRwmatrModal(){
	//자재 목록 모달띄움
	rwmatrDialog = $( "#rwmatrDialog" ).dialog({
		  modal:true,
		  autoOpen:false,
	      height: 400,
	      width: 600,
	      modal: true
	}); 

    console.log("11111")
    rwmatrDialog.dialog( "open" );
    console.log("111112222")
    $("#rwmatrDialog").load("${path}/rwmatr/searchRwmatrDialog.do", function(){console.log("원자재 목록")})
}
	
	//모달에서 선택한 값 세팅
	let rk = '';
	rwmatrOrderList.on('click', (ev) => {
		rk = ev.rowKey;
		console.log(ev)
		console.log(ev.columnName)
		console.log(ev.rowKey)
	    if (ev.columnName === 'nm') {
	    	console.log(rwmatrOrderList.getRow(ev.rowKey).nm);
			if(!rwmatrOrderList.getRow(ev.rowKey).nm){
				console.log("1111")
	    		callRwmatrModal();
				
	    	}
	    	
		}
	});

	function getData(rmId, rmnm) {
		console.log(11111111111111111111111111111)
		console.log(rmId)
		console.log(rmnm)
		rwmatrOrderList.setValue(rk, "rwmatrId", rmId, true)
		rwmatrOrderList.setValue(rk, "nm", rmnm, true)
		rwmatrDialog.dialog( "close" );
	}
	
	
	rwmatrOrderList.on('response', function (ev) {
		// 성공/실패와 관계 없이 응답을 받았을 경우
		console.log("1111");
		//console.log(ev);
		/* grid.resetOriginData(); */
	});

	btnFind.addEventListener("click", function(){
		
	});
	btnAdd.addEventListener("click", function(){
		rwmatrOrderList.appendRow();
	});
	btnDel.addEventListener("click", function(){
		rwmatrOrderList.removeCheckedRows(true);
	});
	btnSave.addEventListener("click", function(){
		rwmatrOrderList.request('modifyData');
	});

</script>
</body>
</html>