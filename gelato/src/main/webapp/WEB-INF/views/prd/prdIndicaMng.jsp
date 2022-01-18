<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산 지시 조회</title>
</head>
<body>
	<div>
		<br>
		<h2>생산지시관리</h2>
		<br>
	</div>
	<br>
	<div class="row">
		<div class="col-sm-8">
			 <button type="button" class="btn btn-secondary" id="btnSearch">미지시 계획 조회</button>
		</div>
		<div class="col-sm-4">
			 <button type="button" class="btn btn-secondary" id="btnIns">지시 등록</button>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-5">
			<h3>상세생산계획</h3>
			<hr>
			<div id="planDetaGrid"></div>
		</div>
		<div class="col-sm-7">
			<h3>생산지시</h3>
			<hr>
			<div id="planIndicaGrid"></div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-5">
			<hr>
			<div id="RwmatrGrid">그리드3</div>
		</div>
		<div class="col-sm-7">
			<hr>
			<div id="RwmatrLotGrid">그리드4</div>
		</div>
	</div>
	
	<!-- 미지시 생산계획조회 모달창 -->
	<div id=nonIndicaDialog title="미지시 생산계획 목록"></div>
</body>

<script>
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
		
		// 그리드 : 계획
		const planDetaGrid = new Grid({
			el : document.getElementById('planDetaGrid'),
			data : {
				api : {
					readData : {url : '${path}/prd/choosePlan.do',method : 'GET'},
				},
				contentType : 'application/json',
				initialRequest: false
			},
			rowHeaders : ['rowNum' ],
			selectionUnit : 'row',
			columns : [ {
				header : '생산계획코드',
				name : 'planDetaId'
			}, {
				header : '제품명',
				name : 'prdtNm',
			}, {
				header : '수량',
				name : 'qy',
			}, {
				header : '생산일수',
				name : 'prodDcnt',
			}]
		});
		
		//생산지시 그리드
		const planIndicaGrid = new Grid({
			el : document.getElementById('planIndicaGrid'),
			data : {
				api : {
					readData : {url : '${path}/prd/choosePlanDetaId.do' , method : 'GET'},
				},
				contentType : 'application/json',
				initialRequest: false
			},
			rowHeaders : ['rowNum' ],
			selectionUnit : 'row',
			columns : [ {
				header : '착수일자',
				name : 'indicaDt',
			}, {
				header : '작업수량',
				name : 'qy',
			}, {
				header : '라인코드',
				name : 'lineId',
			},  {
				header : '일자별 우선순위',
				name : 'ord',
			}]
		});
		
	// 미지시 생산계획
		//모달창 생성
		var NonIndicaDialog = $("#nonIndicaDialog").dialog({
				modal : true,
				autoOpen : false,
				height: 600,
				width: 1000
			});
		
		$("#btnSearch").on(
				"click", function() {
					console.log(121212);
					NonIndicaDialog.dialog("open");
					console.log(232323);
					   $("#nonIndicaDialog").load("${path}/prd/nonIndicaDialog.do",
							function() {
								console.log("주문창 로드") 
							})
				});
		// 계획코드 받아서 readData에 넘기기
		function choosePI(nip){
			console.log(nip);
			planDetaGrid.readData(1,{planId:nip}, true);
			NonIndicaDialog.dialog("close");
		}
	//종료

	// 생산계획 그리드 클릭
	planDetaGrid.on("dblclick", (ev) => {
		planDetaGrid.setSelectionRange({
		    start: [ev.rowKey, 0],
		    end: [ev.rowKey, planDetaGrid.getColumns().length-1]
		});
		
		//planDetaId 가지고 와서 생산지시 작성
		var pdi = planDetaGrid.getRow(ev.rowKey).planDetaId;
		console.log(pdi);
		var pdc = planDetaGrid.getRow(ev.rowKey).prodDcnt;
		console.log(pdc);
		
		//ajax -> 라인코드 가져오기
		$.ajax({
			url:"${path}/prd/choosePlanDetaId.do?planDetaId=" + pdi,
			async: false,
			error : function(result) {
				console.log('에러', result)
			}
		}).done(function (result) {
			console.log(result)
			lineId = result.lineId;
			console.log(lineId)
		})
		
		for( let i=0 ; i<pdc ; i++ ) {
			planIndicaGrid.appendRow({'lineId':lineId})
		}
		
		
		
	});
	
	
	
	



















</script>
</html>