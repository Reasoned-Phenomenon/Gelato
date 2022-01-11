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
</style>
<body>

	<form action="" method="post" name="frm">
		<div>
			<br>
			<h1 id="title">생산계획관리</h1>
			<br>
			<br>
		</div>
		<div style="float: left; width: 70%; padding: 10px;">
			<table>
				<tbody>
					<tr>
						<th>생산 계획명</th>
						<td><input type="text" id="planName" required></td>
						<td rowspan="2">
							<button type="button" class="btn btn-secondary"
								id="btnSearchPlan">검색</button>
						</td>
					</tr>
					<tr>
						<th>생산 계획 일자</th>
						<td><input type="date" id="plandt" required></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div style="float: left; width: 30%; padding: 10px;">
			<button type="button" class="btn btn-secondary" id="btnOrderSht">주문서
				조회</button>
			<button type="button" class="btn btn-secondary" id="btnPlanIns">등록</button>
			<button type="button" class="btn btn-secondary" id="btnPlanDel">삭제</button>
		</div>

		
		<!-- 계획 상세 그리드 -->
		<div id="PlanDetaGrid"></div>

		<!-- 주문서 모달창 -->
		<div id="OrderShtDialog" title="주문서 목록"></div>

		<!-- 검색 모달창 -->
		<div id="SearchPlanDialog" title="검색 결과"></div>

	</form>

	<script>
		//생산계획일자 현재날짜 기본 설정
		document.getElementById('plandt').value = new Date().toISOString()
				.substring(0, 10);

		
		//주문서 조회 클릭하면 모달창 생성하기
		// 주문코드 받아오기
		function chooseOI(osg){
			OrderShtDialog.dialog("close");
		}
		
		let OrderShtDialog = $("#OrderShtDialog").dialog({
			modal : true,
			autoOpen : false,
			height: 600,
			width: 1000
		});

		$("#btnOrderSht").on(
				"click",
				function() {
					console.log("11111")
					OrderShtDialog.dialog("open");
					console.log("111112222")
					$("#OrderShtDialog").load("${path}/prd/orderShtDialog.do",
							function() {
								console.log("주문창 로드")
							})
				});
		//종료

		//검색 클릭하면 모달창 생성하기
		let SearchPlanDialog = $("#SearchPlanDialog").dialog({
			modal : true,
			autoOpen : false,
			height: 600,
			width: 1000
		});

		$("#btnSearchPlan").on(
				"click",
				function() {
					console.log("33333")
					SearchPlanDialog.dialog("open");
					console.log("44444")
					$("#SearchPlanDialog").load(
							"${path}/prd/searchPlanDialog.do", function() {
								console.log("검색창 로드")
							})
				});
		//종료

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

		// 그리드 생성
		const PlanDetaGrid = new Grid({
			el : document.getElementById('PlanDetaGrid'),
			data : {
				api : {
					readData : {
						url : '${path}',
						method : 'GET'
					}
				},
				contentType : 'application/json'
			},
			rowHeaders : [ 'checkbox', 'rowNum' ],
			selectionUnit : 'row',
			columns : [ {
				header : '생산계획코드',
				name : 'planDetaId'
			}, {
				header : '제품코드',
				name : 'prdtId',
			}, {
				header : '제품명',
				name : 'prdtNm'
			}, {
				header : '주문코드',
				name : 'orderId',
			}, {
				header : '계획량',
				name : 'qy',
			}, {
				header : '생산일수',
				name : 'prod_dcnt',
			}, {
				header : '작업우선순위',
				name : 'priort',
			}, {
				header : '작업구분',
				name : 'fg',
			}]
		});
	</script>
</body>
</html>