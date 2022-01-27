<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공정 실적</title>
</head>
<body>
	<div>
		<br>
		<h2>공정실적</h2>
		<br>
	</div>
	<div>
		<button type="button" class="btn btn-secondary" id="btnSearchPlan">생산지시조회</button>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-6">
			<h3>공정목록</h3>
			<hr>
			<div id="prcsListGrid"></div>
		</div>
		<div class="col-sm-6">
			<h3>공정실적</h3>
			<hr>
			<div id="prcsDetaGrid"></div>
		</div>
	</div>
	
	<!-- 생산지시 조회 모달-->
	<div id="nonPrcsDialog" title="생산 지시 목록"></div>
<script>

	//그리드 생성
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
	
		//그리드1
		const prcsListGrid = new Grid({
			el : document.getElementById('prcsListGrid'),
			data : {
				api : {
					readData : {url : '${path}/prd/prcsList.do',method : 'GET'},
				},
				contentType : 'application/json',
				initialRequest: false
			},
			rowHeaders : ['rowNum' ],
			selectionUnit : 'row',
			columns : [ {
				header : '진행공정코드',
				name : 'prcsNowId'
			}, {
				header : '공정코드',
				name : 'prcsId'
			}, {
				header : '공정명',
				name : 'nm',
			}, {
				header : '설비코드',
				name : 'eqmId',
			}, {
				header : '설비명',
				name : 'eqmName',
			}]
		});
		
		//그리드2
		const prcsDetaGrid = new Grid({
			el : document.getElementById('prcsDetaGrid'),
			data : {
				api : {
					readData : {url : '${path}',method : 'GET'},
				},
				contentType : 'application/json',
				initialRequest: false
			},
			rowHeaders : ['rowNum' ],
			selectionUnit : 'row',
			columns : [ {
				header : '진행공정코드',
				name : 'prcsNowId'
			}, {
				header : '공정명',
				name : 'nm',
			}, {
				header : '지시량',
				name : 'inptQy',
			}, {
				header : '생산량',
				name : 'qy',
			}, {
				header : '불량코드',
				name : 'inferId',
			}, {
				header : '불량량',
				name : 'inferQy',
			}]
		});
		
	// 생산지시조회 모달창
	var nonPrcsDialog = $("#nonPrcsDialog").dialog({
			modal : true,
			autoOpen : false,
			height: 600,
			width: 1000
		});
	
	$("#btnSearchPlan").on(
			"click",
			function() {
				nonPrcsDialog.dialog("open");
				$("#nonPrcsDialog").load("${path}/prd/nonPrcsDialog.do",
						function() {
							console.log("주문창 로드")
						})
			});
	
	function choosePi(cid,cpn){
		nonPrcsDialog.dialog("close");
	}
</script>
</body>
</html>