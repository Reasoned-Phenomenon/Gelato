<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산관리</title>
</head>
<style>
th, td {
	padding: 5px;
}
</style>
<body>
	<div>
		<br>
		<h2>생산관리</h2>
		<br>
	</div>
	<div>
		<button type="button" class="btn btn-secondary" id="btnSearchPlan">생산지시조회</button>
	</div>
	<hr>
	<div>
		<h3>진행생산지시</h3>
		<div id="IndicaGrid"></div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-6">
			<h3>공정목록</h3>
			<hr>
			<div id="prcsListGrid"></div>
		</div>
		<div class="col-sm-6">
			<h3>공정상세사항</h3>
			<hr>
			<table>
				<tbody>
					<tr>
						<th>공정명</th>
						<td><input type="text" id="mngr" readonly></td>
					</tr>
					<tr>
						<th>담당자명*</th>
						<td><input type="text" id="mngr" required></td>
					</tr>
					<tr>
						<th>작업량*</th>
						<td><input type="text" id="inptQy" required></td>
					</tr>
					</tr>
					<tr>
						<th>시작시간</th>
						<td><input type="text" id="startT"></td>
					</tr>
					<tr>
						<th>종료시간</th>
						<td><input type="text" id="endT"></td>
					</tr>
					<tr>
						<th>불량량</th>
						<td><input type="text" id="inferQy"></td>
					</tr>
					<tr>
						<th>불량사유</th>
						<td>
							<select name="infer">
							  <option value="PDB-00101" selected>불순물 검출</option>
							  <option value="PDB-00100">포장지 훼손</option>
							  <option value="PDB-00102">아이스크림 제형 파손</option>
							  <option value="PDB-00103">용기 파손</option>
							  <option value="PDB-00104">용량 미달</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
			<br><br>
			<button type="button" class="btn btn-secondary" id="btnPrcs"></button>
		</div>
	</div>	
	
	<!-- 생산지시 조회 모달-->
	<div id="nonPrcsDialog" title="생산 지시 목록"></div>
	
	
<script>
	// 생산 시작 버튼 
	document.getElementById('btnPrcs').innerText = '생산 시작';
	
	// 그리드 생성
		var Grid = tui.Grid;

		//그리드 테마
		Grid.applyTheme('striped', {
			cell : {
				header : {
					background : '#eef'
				},
				evenRow : {
					background : '#fee'
				},
				selectedHeader : {
			    	background : '#FFFFFF'
			    }
			}
		});
		
		// 그리드1
		const PlanDetaGrid = new Grid({
			el : document.getElementById('PlanDetaGrid'),
			data : {
				api : {
					readData : {url : '${path}/prd/chooseOrder.do',method : 'GET'},
					modifyData : { url: '${path}/prd/modifyCanPrdPlan.do', method: 'PUT'} 
				},
				contentType : 'application/json',
				initialRequest: false
			},
			rowHeaders : ['rowNum' ],
			selectionUnit : 'row',
			columns : [ {
				header : '생산지시코드',
				name : 'IndicaDetaId'
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
			}, {
				header : '생산일수',
				name : 'prodDcnt',
			}]
		});
	
	
</script>
</body>
</html>