<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산 계획 관리</title>
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />

<script
	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
</head>
<style>
th, td {
	padding: 5px;
}
#btnAdd{
	margin-top: 25px;
}
#btnDel{
	margin-top: 25px;
}
#btnOrderSht{
	margin-top: 25px;
}
</style>
<body>

		<div>
			<br>
			<h2 id="title">생산계획관리</h2>
			<br>
		</div>
		<div>
			<div style="float: left; width: 80%; padding: 10px;">
				<table>
					<tbody>
						<tr>
							<th>생산 계획명</th>
							<td><input type="text" id="planName" required></td>
							<td rowspan="2">
								<button type="button" class="btn btn-secondary" id="btnPlanIns">계획등록</button>
							</td>
							<td rowspan="2">
								<button type="button" class="btn btn-secondary" id="btnClear">초기화</button>
							</td>
						</tr>
						<tr>
							<th>생산 계획 일자</th>
							<td><input type="date" id="planDt" required></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div style="float: left; width: 20%; padding: 10px;">
				<button type="button" class="btn btn-secondary" id="btnSearchPlan">계획조회</button>
				<button type="button" class="btn btn-secondary" id="btnPlanDel">계획삭제</button>	
			</div>
			<br><br>
		</div>
		
		<!-- 기존--------------------------------------------------------- -->
		<!-- <div>
		
			<div style="float: left; width: 80%; padding: 10px;">
				<hr>
				<h4>상세생산계획</h4>
			</div>	
			<div style="float: left; width: 20%; padding: 10px;">
				<button type="button" class="btn btn-secondary" id="btnOrderSht">주문서조회</button>
				<button type="button" class="btn btn-secondary" id="btnAdd">행 추가</button>
				<button type="button" class="btn btn-secondary" id="btnDel">행 삭제</button>
			</div>	
		</div> -->
		<!-- ------------------------------------------------------------ -->
		
		<div>
			<div style="float: left; width: 100%; padding: 10px;">
				<hr>
				<h4>상세생산계획</h4>
				<div id="tabs">
					<ul>
						<li><a href="#orderShtTab">주문서</a></li>
						<li><a href="#InventoryTab">추가계획</a></li>
					</ul>
					
					<div id="orderShtTab">
							<div id="PlanDetaOsGrid" ></div> <br>
							<button type="button" class="btn btn-secondary" id="btnOrderSht">주문서조회</button>
					</div>
					<div id="InventoryTab">
							<div id="PlanDetaIvGrid"></div> <br>
							<button type="button" class="btn btn-secondary" id="btnAdd">행 추가</button>
							<button type="button" class="btn btn-secondary" id="btnDel">행 삭제</button>
					</div>
				</div>
			</div>	
		</div>
		
		<!-- 주문서 모달창 -->
		<div id="OrderShtDialog" title="주문서 목록"></div>

		<!-- 계획조회 모달창 -->
		<div id="SearchPlanDialog" title="계획조회 결과"></div>
		
		<!-- 제품 목록 모달창 -->
		<div id="PrdtDialog" title="제품 목록"></div>
		
		<!-- 계획 상세 그리드 - 주문서 -->
		<div id="PlanDetaOsGrid"></div>
		
		<!-- 계획 상세 그리드 - 추가-->
		<div id="PlanDetaIvGrid"></div>
	
	<script>
	let rk = '';
	//생산계획일자 현재날짜 기본 설정
	document.getElementById('planDt').value = new Date().toISOString()
			.substring(0, 10);

	//탭 생성
	$( "#tabs" ).tabs();
	
	//초기화버튼
	$("#btnClear").on(
				"click",
				function() {
					$("#planName").val('');
					document.getElementById('planDt').value = new Date().toISOString().substring(0, 10);
					PlanDetaOsGrid.readData(1,{planId:null}, true);
					PlanDetaIvGrid.readData(1,{planId:null}, true);
				});
		
	//계획상세 그리드 생성
		var Grid = tui.Grid;

		//그리드 테마
		Grid.applyTheme('striped', {
			cell : {
				header : {
					background : '#eef'
				},
				evenRow : {
					background : '#fee'
				}
			}
		});

		// 그리드 생성 : 주문서
		const PlanDetaOsGrid = new Grid({
			el : document.getElementById('PlanDetaOsGrid'),
			data : {
				api : {
					readData : {
						url : '${path}/prd/chooseOrder.do',
						method : 'GET'
					}
				},
				contentType : 'application/json',
				initialRequest: false
			},
			rowHeaders : [ 'checkbox', 'rowNum' ],
			selectionUnit : 'row',
			columns : [ {
				header : '생산계획코드',
				name : 'planDetaId'
			}, {
				header : '제품명',
				name : 'prdtNm',
			}, {
				header : '제품코드',
				name : 'prdtId',
			}, {
				header : '주문코드',
				name : 'orderId',
			}, {
				header : '계획량',
				name : 'qy',
				editor : 'text',
				editable({ value }) {
		        	return value === '1';
				}
			}, {
				header : '생산일수',
				name : 'prodDcnt',
				editor : 'text',
				editable({ value }) {
		        	return value === '1';
				}
			}, {
				header : '작업우선순위',
				name : 'priort',
				editor : 'text',
				editable({ value }) {
		        	return value === '1';
				}
			}, {
				header : '작업구분',
				name : 'fg',
				editor: {
					type: 'select',
				    options: {
				      listItems: [
				        { text: '접수완료', value: 'ACCEPT' },
				        { text: '출고완료', value: 'OUTSTC' },
				      ]
				    }
				}
			}]
		});
		
		// 그리드 생성 : 안전재고용
		const PlanDetaIvGrid = new Grid({
			el : document.getElementById('PlanDetaIvGrid'),
			data : {
				api : {
					readData : {
						url : '${path}/prd/chooseOrder.do',
						method : 'GET'
					}
				},
				contentType : 'application/json',
				initialRequest: false
			},
			rowHeaders : [ 'checkbox', 'rowNum' ],
			selectionUnit : 'row',
			columns : [ {
				header : '생산계획코드',
				name : 'planDetaId'
			}, {
				header : '제품명',
				name : 'prdtNmIv',
			}, {
				header : '제품코드',
				name : 'prdtId',
			}, {
				header : '주문코드',
				name : 'orderId',
			}, {
				header : '계획량',
				name : 'qy',
				editor : 'text',
				editable({ value }) {
		        	return value === '1';
				}
			}, {
				header : '생산일수',
				name : 'prodDcnt',
				editor : 'text',
				editable({ value }) {
		        	return value === '1';
				}
			}, {
				header : '작업우선순위',
				name : 'priort',
				editor : 'text',
				editable({ value }) {
		        	return value === '1';
				}
			}, {
				header : '작업구분',
				name : 'fg',
				editor: {
					type: 'select',
				    options: {
				      listItems: [
				        { text: '접수완료', value: 'ACCEPT' },
				        { text: '출고완료', value: 'OUTSTC' },
				      ]
				    }
				}
			}]
		});
		
	// 종료
	
	//주문서 조회 클릭하면 모달창 생성하기

		// 주문코드 받아서 readData에 파라미터값으로 넘겨주기
		function chooseOI(osg){
			console.log(osg);
			PlanDetaOsGrid.readData(1,{orderId:osg}, true);
			OrderShtDialog.dialog("close");
		}
		
		// 모달창 생성
		var OrderShtDialog = $("#OrderShtDialog").dialog({
			modal : true,
			autoOpen : false,
			height: 600,
			width: 1000
		});

		$("#btnOrderSht").on(
				"click",
				function() {
					console.log("11111")
					$("#planName").val('');
					document.getElementById('planDt').value = new Date().toISOString().substring(0, 10);
					OrderShtDialog.dialog("open");
					console.log("111112222")
					$("#OrderShtDialog").load("${path}/prd/orderShtDialog.do",
							function() {
								console.log("주문창 로드")
							})
				});
	//종료

	//계획조회 클릭하면 모달창 생성하기
		// 주문코드 받아서 검색창에 띄우기
		function selectPnm(pnm){
			console.log(pnm);
			$("#planName").val(pnm);
		}
		function selectPdt(pdt){
			console.log(pdt);
			$("#planDt").val(pdt);
		}
	
		// 주문코드 받아서 readData에 파라미터값으로 넘겨주기
		function choosePI(spg){
			console.log(spg);
			PlanDetaOsGrid.readData(1,{planId:spg}, true);
			SearchPlanDialog.dialog("close");
		}
	
		//모달창 생성
		var SearchPlanDialog = $("#SearchPlanDialog").dialog({
			modal : true,
			autoOpen : false,
			height: 600,
			width: 1000
		});
		
		$("#btnSearchPlan").on(
				"click",
				function() {
					/* if(!$("#planName").val()) { */
						console.log("33333")
						$("#planName").val('');
						document.getElementById('planDt').value = new Date().toISOString().substring(0, 10);
						SearchPlanDialog.dialog("open");
						console.log("44444")
						$("#SearchPlanDialog").load(
								"${path}/prd/searchPlanDialog.do", function() {
									console.log("계획조회창 로드")
								})
					//}
				});
	//종료
	
	//제품목록 클릭하면 모달창 생성하기
		function selectPr(prid,prnm){
			console.log(prnm);
			console.log(prid);
			PlanDetaIvGrid.setValue(rk, "prdtNm", prdtNmIv, true);
			PlanDetaIvGrid.setValue(rk, "prdtId", prid, true);
			PrdtDialog.dialog( "close" );
		}
	
		function callPrdtModal(){
			// 모달창 생성
			PrdtDialog = $("#PrdtDialog").dialog({
				modal : true,
				autoOpen : false,
				height: 600,
				width: 400
			});
			
		    console.log("11111")
		    PrdtDialog.dialog( "open" );
		    $("#PrdtDialog").load(
								"${path}/prd/prdtDialog.do", function() {
									console.log("계획조회창 로드")
								})
		}
			
			//그리드 선택한 값 세팅
			PlanDetaIvGrid.on('dblclick', (ev) => {
				rk = ev.rowKey;
				console.log(ev)
			    if (ev.columnName === 'prdtNmIv') {
			    	console.log(PlanDetaIvGrid.getRow(ev.rowKey).prdtNm);
					if(!PlanDetaIvGrid.getRow(ev.rowKey).prdtNm){
						console.log("1111")
			    		callPrdtModal();
						
			    	}
			    	
				}
				console.log("1111111")
			});
	//종료
	
	// 행추가
	btnAdd.addEventListener("click", function() {
		console.log('등록');
		PlanDetaIvGrid.appendRow({});
	});
	
	// 행삭제
	btnDel.addEventListener("click", function() {
		console.log('삭제')
		PlanDetaIvGrid.removeCheckedRows(true);
	});
	
	// 생산계획코드 유무
	</script>
</body>
</html>