<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원자재 입고검사관리</title> 
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
</head>
<body>
<h3>원자재 입고검사관리</h3>
<div style="margin: 20px;">
	<form action="">
		자재명 : <input type="text" id="rwmName"><br>
		기간 :   <input type="date" id="startDate"> ~ <input type="date" id="endDate">
		<button type="button" class="btn cur-p btn-outline-primary" id="btnFind">조회</button>
		<button type="reset" class="btn cur-p btn-outline-primary">초기화</button>
	</form>
</div>
<div style="float: right;">
	<button type="button" class="btn cur-p btn-outline-primary" id="btnAdd">추가</button>
	<button type="button" class="btn cur-p btn-outline-primary" id="btnDel">삭제</button>
	<button type="button" class="btn cur-p btn-outline-primary" id="btnSave">저장</button>
</div>
<hr>
<br>


	<!-- 발주목록 조회 -->
	<div id="rwmatrIstInspList" style="width: 80%"></div>

	<!-- 모달창 -->
	<div id="dialogFrm" title=""></div>

<script>
let dialog;
var Grid = tui.Grid;

//모달에서 선택한 rowKey값 세팅
let rk = '';

//검색 조건
var rwmName;
var startDate;
var endDate;



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
var rwmatrIstInspList = new Grid({
	el: document.getElementById('rwmatrIstInspList'),
	data : {
	  api: {
	    readData: 	{ url: '${path}/rwmatr/rwmatrIstInspList.do', method: 'POST'},
	    modifyData : { url: '${path}/rwmatr/rwmatrIstInspModifyData.do', method: 'PUT'} 
	  },
	  contentType: 'application/json'
	},
	rowHeaders: ['checkbox'],
	selectionUnit: 'row',
	bodyHeight: 600,
	columns:[
				{
				  header: '발주디테일코드',
				  name: 'rwmatrOrderDetaId',
				},
				{
				  header: '발주코드',
				  name: 'orderId',
				  hidden:true,
				  sortable: true
				},
				{
				  header: '자재명',
				  name: 'nm',
				  editor: 'text',
				  sortable: true
				},
				{
				  header: '자재코드',
				  name: 'rwmatrId',
				  sortable: true
				},
				{
				  header: '발주총량',
				  name: 'qy',
				  editor: 'text',
				  sortable: true
				},
				{
				  header: '합격량',
				  name: 'passQy',
				  editor: 'text',
				  sortable: true
				},
				{
				  header: '불량량',
				  name: 'inferQy',
				  sortable: true
				},
				{
				  header: '담당자',
				  name: 'mngr',
				  editor: 'text',
				  sortable: true
				},
				{
				  header: '검사일자',
				  name: 'dt',
				  editor: 'datePicker',
				  sortable: true
				},
		]
});


//자재모달
function callModal(){
	dialog = $( "#dialogFrm" ).dialog({
		  modal:true,
		  autoOpen:false,
	      height: 400,
	      width: 600,
	      modal: true
	}); 

    dialog.dialog( "open" );
    console.log("111112222")
    $("#dialogFrm").load("${path}/rwmatr/searchOrderDialog.do", function(){console.log("발주 목록")})
}
	
	
	//자재명 클릭시 모달
	rwmatrIstInspList.on('click', (ev) => {
		rk = ev.rowKey;
		console.log(ev)
		console.log(ev.columnName)
		console.log(ev.rowKey)
	    if (ev.columnName === 'rwmatrOrderDetaId') {
			console.log("발주디테일리스트")
    		callModal();
		}
	});

	function getOrderData(orderCd, orderdCd, rwnm, rwid, q) {
		console.log("발주정보 기입")
		rwmatrIstInspList.setValue(rk, "rwmatrOrderDetaId", orderdCd, true)
		rwmatrIstInspList.setValue(rk, "orderId", orderCd, true)
		rwmatrIstInspList.setValue(rk, "nm", rwnm, true)
		rwmatrIstInspList.setValue(rk, "rwmatrId", rwid, true)
		rwmatrIstInspList.setValue(rk, "qy", q, true)
		dialog.dialog( "close" );
	}
	
	//불량량 자동계산... 구현중..
	if(rwmatrIstInspList.getValue(rk, "passQy") != '') {
		console.log("sdfjklsdfjsdfljsdlf")
		let totalq = parseInt(rwmatrIstInspList.getValue(rk, "qy"));
		let passq = parseInt(rwmatrIstInspList.getValue(rk, "passQy"));
		let inferq = totalq - passq;
		rwmatrIstInspList.setValue(rk, "inferQy", inferq, true);
	}

	
	rwmatrIstInspList.on('response', function (ev) {
		console.log("1111");
	});

	//조회
	btnFind.addEventListener("click", function(){
		
	});
	
	//추가
	btnAdd.addEventListener("click", function(){
		rwmatrIstInspList.prependRow();
	});
	
	//삭제
	btnDel.addEventListener("click", function(){
		if(rwmatrIstInspList.removeCheckedRows(true)){
			rwmatrIstInspList.request('modifyData');
		}
	});
	
	//저장
	btnSave.addEventListener("click", function(){
		rwmatrIstInspList.blur();
		rwmatrIstInspList.request('modifyData');
		rwmatrIstInspList.clearModifiedData();
	});

</script>
</body>
</html>