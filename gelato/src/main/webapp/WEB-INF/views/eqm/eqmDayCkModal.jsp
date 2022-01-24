<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일 점검자료 조회 모달</title>
</head>
<body>
	<div>
		<h2>일 점검자료 관리</h2>
	</div>
	<div>
		<div>
			<form id="searchForm" name="searchForm" method="get">
				<div>
					<label>점검일자</label> <input id="fromDayCkDate" name="fromDayCkDate"
						type="date"><label>~</label><input id="toDayCkDate"
						name="toDayCkDate" type="date">
					<button class="btn btn-print float-right" id="eqmChck"
						type="button">설비조회</button>
				</div>
			</form>
			<div id="eqmDayCkGrid"></div>
		</div>
	</div>
	<div>
		<button id="btnOk" class="btn btn-print">확인</button>
		<button id="btnCn" class="btn btn-print">취소</button>
	</div>

	<script>

		var fromDayCkDate = $("#fromDayCkDate").val();
		var toDayCkDate = $("#toDayCkDate").val();
		
		
		var params = {
		'fromDayCkDate' : fromDayCkDate,
		'toDayCkDate' : toDayCkDate
		}
		
		console.log(params)
		var Grid = tui.Grid;
		
		var eqmDayCkGrid = new Grid({
			el : document.getElementById('eqmDayCkGrid'),
			data : {
				api : {
					readData : {
						url : '${path}/eqm/eqmDayCkGrid.do',
						method : 'GET',
						initParams : params
					},
				},
				contentType : 'application/json'
			},
			rowHeaders : [ 'checkbox', 'rowNum' ],
			selectionUnit : 'row',
			bodyHeight : 300,
			columns : [ {
				header : '점검일자',
				name : 'chckDt'
			}, {
				header : '건수', 
				name : 'count'
			}]
		});
		
		//모달창에서 확인 클릭시 그리드에 선택한 것만 띄우기
		$("#btnOk").on("click", function(){
			checked = eqmCkGrid.getCheckedRows();
			for(let vo of checked){
				
				eqmInsGrid.appendRow({});
				
				eqmInsGrid.setValue(eqmInsGrid.getRowCount()-1, 'eqmId', vo.eqmId);
				eqmInsGrid.setValue(eqmInsGrid.getRowCount()-1, 'eqmName', vo.eqmName);
				eqmInsGrid.setValue(eqmInsGrid.getRowCount()-1, 'chckPerd', vo.chckPerd);
				eqmInsGrid.setValue(eqmInsGrid.getRowCount()-1, 'chckDt', vo.chckDt);
				eqmInsGrid.setValue(eqmInsGrid.getRowCount()-1, 'nmCkDt', vo.nmCkDt);
				eqmInsGrid.setValue(eqmInsGrid.getRowCount()-1, 'judt', vo.judt);
				eqmInsGrid.setValue(eqmInsGrid.getRowCount()-1, 'chckDeta', vo.chckDeta);
				eqmInsGrid.setValue(eqmInsGrid.getRowCount()-1, 'inspr', vo.inspr);
			}
			
			dialog.dialog("close");
		})

		//모달창 취소버튼
		$("#btnCn").on("click", function(){
			dialog.dialog("close");
		})
		
	</script>
</body>
</html>