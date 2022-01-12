<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
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
	<div id="rwmatrOrderList" style="width: 80%"></div>

	<!-- 모달창 -->
	<div id="dialogFrm" title="원자재 목록"></div>

<script>
let dialog;
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
				  header: '발주디테일코드',
				  name: 'rwmatrOrderDetaId',
				  hidden:true
				},
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
				  header: '단가(원)',
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
				  name: 'vendId',
				  hidden:true
				},
				{
				  header: '업체명',
				  name: 'vendName',
				  editor: 'text'
				},
				{
				  header: '발주신청일',
				  name: 'orderDt',
				},
				{
				  header: '납기요청일',
				  name: 'dudt',
				  editor: 'datePicker'
				}
		]
});

//최근에 클릭한값으로 발주번호

//자재모달
function callRwmatrModal(){
	dialog = $( "#dialogFrm" ).dialog({
		  modal:true,
		  autoOpen:false,
	      height: 400,
	      width: 600,
	      modal: true
	}); 

    console.log("11111")
    dialog.dialog( "open" );
    console.log("111112222")
    $("#dialogFrm").load("${path}/rwmatr/searchRwmatrDialog.do", function(){console.log("원자재 목록")})
}

//거래처모달
function callVendModal(){
	dialog = $( "#dialogFrm" ).dialog({
		  modal:true,
		  autoOpen:false,
	      height: 400,
	      width: 600,
	      modal: true
	}); 

    console.log("11111")
    dialog.dialog( "open" );
    console.log("111112222")
    $("#dialogFrm").load("${path}/rwmatr/searchVendDialog.do", function(){console.log("거래처 목록")})
}
	
	//모달에서 선택한 rowKey값 세팅
	let rk = '';
	rwmatrOrderList.on('click', (ev) => {
		rk = ev.rowKey;
		console.log(ev)
		console.log(ev.columnName)
		console.log(ev.rowKey)
	    if (ev.columnName === 'nm') {
			console.log("1111")
    		callRwmatrModal();
		} else if(ev.columnName === 'vendName'){
    		console.log("2222")
    		callVendModal();
		}
	});

	function getRwmatrData(rmId, rmnm) {
		console.log("Rwmatr정보 기입")
		console.log(rmId)
		console.log(rmnm)
		rwmatrOrderList.setValue(rk, "rwmatrId", rmId, true)
		rwmatrOrderList.setValue(rk, "nm", rmnm, true)
		dialog.dialog( "close" );
	}
	
	function getVendData(vdId, vdnm) {
		console.log("Vend정보 기입")
		console.log(vdId)
		console.log(vdnm)
		rwmatrOrderList.setValue(rk, "vendId", vdId, true)
		rwmatrOrderList.setValue(rk, "vendName", vdnm, true)
		dialog.dialog( "close" );
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
		rwmatrOrderList.request('modifyData');
	});
	
	btnSave.addEventListener("click", function(){
		rwmatrOrderList.blur();
		rwmatrOrderList.request('modifyData');
	});

</script>
</body>
</html>