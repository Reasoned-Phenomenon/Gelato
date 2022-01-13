<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원자재 발주관리</title> 
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
</head>
<body>
<h3>원자재 발주관리</h3>
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
	<div id="rwmatrOrderList" style="width: 80%"></div>

	<!-- 모달창 -->
	<div id="dialogFrm" title="원자재 목록"></div>

<script>
let dialog;
var Grid = tui.Grid;

//모달에서 선택한 rowKey값 세팅
let rk = '';

//검색 조건
var rwmName;
var startDate;
var endDate;

document.getElementById("rwmName").addEventListener("click", function() {
  callRwmatrModal();
});

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
	    readData: 	{ url: '${path}/rwmatr/rwmatrOrderList.do', method: 'POST'},
	    modifyData : { url: '${path}/rwmatr/rwmatroModifyData.do', method: 'PUT'} 
	  },
	  contentType: 'application/json',
	  initialRequest: false
	},
	rowHeaders: ['checkbox'],
	selectionUnit: 'row',
	bodyHeight: 600,
	columns:[
				{
				  header: '발주디테일코드',
				  name: 'rwmatrOrderDetaId',
				  hidden:true
				},
				{
				  header: '발주코드',
				  name: 'orderId',
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
				  header: '단가(원)',
				  name: 'untprc',
				  editor: 'text',
				  sortable: true
				},
				{
				  header: '발주량',
				  name: 'qy',
				  editor: 'text',
				  sortable: true
				},
				{
				  header: '업체명',
				  name: 'vendId',
				  hidden:true
				},
				{
				  header: '업체명',
				  name: 'vendName',
				  sortable: true
				},
				{
				  header: '발주신청일',
				  name: 'orderDt',
				  sortable: true
				},
				{
				  header: '납기요청일',
				  name: 'dudt',
				  editor: 'datePicker',
				  sortable: true
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
	
	
	//자재명 클릭시 모달
	rwmatrOrderList.on('click', (ev) => {
		rk = ev.rowKey;
		console.log(ev)
		console.log(ev.columnName)
		console.log(ev.rowKey)
	    if (ev.columnName === 'nm') {
			console.log("자재리스트")
    		callRwmatrModal();
		} /* else if(ev.columnName === 'vendName'){
    		console.log("2222")
    		callVendModal();
		} */
	});

	//자재리스트 모달에서 받아온 데이터를 새로운 행에 넣어줌
	function getRwmatrData(rwmatrData) {
		console.log("Rwmatr정보 기입")
		
		rwmatrOrderList.setValue(rk, "rwmatrId", rwmatrData.rwmatrId, true)
		rwmatrOrderList.setValue(rk, "nm", rwmatrData.nm, true)
		rwmatrOrderList.setValue(rk, "vendName", rwmatrData.vendName, true)
		
		dialog.dialog( "close" );
	}
	
	/* function getVendData(vdId, vdnm) {
		console.log("Vend정보 기입")
		console.log(vdId)
		console.log(vdnm)
		rwmatrOrderList.setValue(rk, "vendId", vdId, true)
		rwmatrOrderList.setValue(rk, "vendName", vdnm, true)
		dialog.dialog( "close" );
	} */
	
	
	    
	
	rwmatrOrderList.on('response', function (ev) {
		// 성공/실패와 관계 없이 응답을 받았을 경우
		console.log("1111");
		//console.log(ev);
		rwmatrOrderList.resetOriginData();
	});

	//조회
	btnFind.addEventListener("click", function(){
		startDate = document.getElementById("startDate").value;
		endDate = document.getElementById("endDate").value;
		rwmName = document.getElementById("rwmName").value;
		console.log(startDate);
		console.log(endDate);
		
		rwmatrOrderList.readData(1,{'startDate':startDate, 'endDate':endDate, 'rwmName':rwmName}, true);
	});
	
	//추가
	btnAdd.addEventListener("click", function(){
		rwmatrOrderList.prependRow();
	});
	
	//삭제
	btnDel.addEventListener("click", function(){
		
		if(rwmatrOrderList.removeCheckedRows(true)){
			rwmatrOrderList.request('modifyData');
		}
	});
	
	//저장
	btnSave.addEventListener("click", function(){
		rwmatrOrderList.blur();
		rwmatrOrderList.request('modifyData');
		rwmatrOrderList.clearModifiedData();
	});

</script>
</body>
</html>