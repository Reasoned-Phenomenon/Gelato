<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>주문서 관리 조회</title>
</head>
<body>
	<main>
	  <div>
	  	<br>
		<h3>주문서 관리 조회</h3>
	     <div>
	     	
	     	
	      <form id="" name="" method="">
	      	<div>
	      		<ul>
	      			<li>
	      				<div>
	      					
	      				  		<br>
	      				  	    <label>진행 구분</label>
	      				  		<label for="radio-3">
	      				  			<input type="radio" name="" id="" value="1">
	      				  			<span>진행</span>
	      				  		</label>
	      				  		<label for="radio-4">
	      				  			<input type="radio" name="" id="" value="2">
	      				  			<span>완료</span>
	      				  		</label>
	      				  		<label for="radio-5">
	      				  			<input type="radio" name="" id="" value="3">
	      				  			<span>전체</span>
	      				  		</label>
	      				  	
	      				</div>
	      			</li>
	      			<li>
	      				<div>
	      					<label>해당일자</label>
	      					<input type="date" id="orderDt">
	      				</div>
	      			</li>
	      			<li>
	      				<div>
	      					<label>거래처</label>
	      					<input type="text" id="vendIdText" name="vendIdText">
	      					<button type="button" id="BtnVend">찾아보기</button>&ensp;&ensp;&ensp;
	      					
	      					<label>제품코드</label>
	      					<input type="text" id="prdtId" name="prdtId">
	      					<button type="button" id="BtnPrdt">찾아보기</button> &ensp;
	      					
	      				<button type="button" class="btn cur-p btn-outline-primary" id="btnRst">새자료</button>
	      				<button type="button" class="btn cur-p btn-outline-primary" id="btnFind">조회</button>
						<button type="button" class="btn cur-p btn-outline-primary" id="btnExcel">Excel</button>
						<button type="button" class="btn cur-p btn-outline-primary" id="btnprint">인쇄</button>
						  <br>
	      				</div>
	      			</li>
	      		</ul>
	      	</div>
	      </form>
	     </div>
	  </div> 
 </main>

	<div id="ordGrid" style="width: 100%"></div>
	<div id="modal" style="width: 100%"></div>

   	 
	
<script>
let dialog;


//let prdtParam;

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
const ordGrid = new Grid({
	el: document.getElementById('ordGrid'),
	data : {
	  api: {
	    readData: 	{ url: '${path}/biz/findOrderList.do', method: 'GET'},
	  },
	  contentType: 'application/json'
	},
	rowHeaders: ['rowNum'],
	selectionUnit: 'row',
	columns:[
			{
			  header: '주문코드',
			  name: 'orderId',
		      editor: 'text'
			},
			{
			  header: '업체명',
			  name: 'vendName',
	          editor: 'text'
			},
			{
			  header: '주무일자',
			  name: 'orderDt',
		      editor: 'text'
			},
			{
			  header: '납기일자',
			  name: 'oustDt',
			  editor: 'text'
			},
			{
			  header: '진행상황구분',
			  name: 'stFg',
		      editor: 'text'
			},
			
			{
			  header: '제품코드',
			  name: 'prdtId',
			  editor: 'text'
			},
			{
        	  header: '수량',
		      name: 'qy',
		      editor: 'text'
			},
			{
              header: '비고',
			  name: 'remk',
			  editor: 'text'
			}
		]
});
	
	// 조회 버튼.
	/* btnFind.addEventListener("click", function() {
	let vendId = document.getElementById("vendId").value;
	ordGrid.readData(1, {vendName:targetName}, true);
	}); */
	
		
	// 모달창 생성 함수.
	$(function () {
		dialog = $( "#modal" ).dialog({
			autoOpen: false,
			height: 500,
			width: 700,
			modal: true,
			buttons: {
			// 선택하는 버튼 넣어두기!. 옵션? 어떤거 잇는 지 찾아보기.
			Cancel: function() {
			
			}
			}
		})
	});
	
	// 거래처 찾아보기 버튼 
	BtnVend.addEventListener("click", function() {
		console.log("444444");
		console.log("모달클릭")
		dialog.dialog( "open" );
		
		 // 컨트롤러에 보내주고 따로 모달은 jsp 만들 필요가 없으니깐  
		 $('#modal').load("${path}/biz/vendModal.do",function () {
			console.log('로드됨')
			vendListGrid.readData(1,{}, true);
		})
		
	})
	
	// 제품코드 찾아보기 버튼
	BtnPrdt.addEventListener("click", function() {
		console.log("55555");
		console.log("버튼클릭");
		dialog.dialog("open");
	
		$("#modal").load("${path}/biz/prdtModal.do",function () {
			console.log("모달로드");
			prdtListGrid.readData(1,{}, true);
		})
	})
	
	
	
	
	
	 function  getModalData(vendParam) {
		
		console.log(vendParam);
		dialog.dialog("close");
	} 
	
	
		

</script>	
	
</body>
</html>