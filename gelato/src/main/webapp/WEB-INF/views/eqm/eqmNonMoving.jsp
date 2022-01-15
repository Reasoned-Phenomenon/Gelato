<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설비비가동 페이지(비가동등록/비가동내역 조회)</title>
</head>
<body>
	<div class="container">
		<div class="flex row">
			<div class="col-4">
				<br>
				<h2>설비목록</h2>
				<br> <label>설비구분</label> <select id="gubun"
					onchange="selectGubun()">
					<option value="전체">전체
					<option value="배합">배합
					<option value="운송">운송
					<option value="측정">측정
					<option value="가공">가공
				</select>
				<div id="eqmListGrid" style="width: 100%;"></div>
			</div>
			<div class="col-8" id="eqmNonInsert" style="display: none;">
				<br>
				<h2>비가동 등록</h2>
				<br>
				<form>
					<table>
						<tbody>
							<tr>
								<th>설비코드</th>
								<td><input id="eqmId"></td>
								<th>설비명</th>
								<td><input id="eqmName"></td>
							</tr>
							<tr>
								<th>작업자</th>
								<td><input></td>
							</tr>
							<tr>
								<th>비가동시간</th>
								<td><input id="workSttmH"><font>시</font><input
									id="workSttmM"><font>분</font></td>
								<td><button type="button" id="workStart">시작</button></td>
								<td><input id="workEntmH"><font>시</font><input
									id="workEntmM"><font>분</font></td>
								<td><button type="button" id="workStop" disabled>종료</button></td>
							</tr>
							<tr>
								<th>점검내역</th>
								<td><input type="text"></td>
							</tr>
							<tr>
								<th>판정</th>
								<td><input type="radio" id="congruity" name="judgement"
									value="Y">적합 <input type="radio" id="incongruity"
									name="judgement" value="N">부적합</td>
							</tr>
							<tr>
								<td><button>비가동등록</button></td>
							</tr>
						</tbody>
					</table>
				</form>
				<div>
					<br>
					<h2>비가동 내역 조회</h2>
					<br> <label>설비구분</label> 
					<select>
						<option>공정코드1</option>
						<option>공정코드2</option>
						<option>공정코드3</option>
						<option>공정코드4</option>
					</select>
					<button>조회</button>
					<div id="eqmNonList" style="width: 100%;"></div>
				</div>
			</div>

		</div>
	</div>
	<script>
	
		//설비관리 페이지에서 넘어오는 값이 있을 때 등록 창 띄우기
		if("${datas}"==""){
			
		}else{
			$("#eqmNonInsert").css("display","block");
			$("#eqmId").val("${datas.eqmId}");
			$("#eqmName").val("${datas.eqmName}");
		}
		
		
		
		var Grid = tui.Grid;

		const eqmListGrid = new Grid({
			el : document.getElementById('eqmListGrid'),
			data : {
				api : {
					readData : {
						url : '${path}/eqm/eqmNonMovingList.do',
						method : 'GET'
					}
				},
				contentType : 'application/json'
			},
			bodyHeight : 500,
			columns : [ {
				header : '설비코드',
				name : 'eqmId'
			}, {
				header : '설비명',
				name : 'eqmName',
				width : 'auto'
			}, {
				header : '공정명',
				name : 'nm',
				width : 'auto'
			}, {
				header : '점검주기',
				name : 'chckPerd',
			} ]
		});
		
		//좌측 그리드에서 한 행 선택시 비가동 등록 창 띄우기
		eqmListGrid.on("dblclick", (ev) => {
			$("#eqmNonInsert").css("display","block");
			$("#eqmId").val(eqmListGrid.getValue(ev["rowKey"],"eqmId"));
			$("#eqmName").val(eqmListGrid.getValue(ev["rowKey"],"eqmName"));
		}) 
		
		//드롭다운 선택시 바로 조회
		function selectGubun(){
			let gubun = $('#gubun option:selected').val();
			eqmListGrid.readData(1, {
				'gubun' : gubun
			}, true);
		}

		const eqmNonListGrid = new Grid({
			el : document.getElementById('eqmNonList'),
			data : {
				api : {
					readData : {
						url : '${path}/eqm/eqmNonSelect.do',
						method : 'GET'
					}
				},
				contentType : 'application/json'
			},
			rowHeaders : [ 'rowNum' ],
			selectionUnit : 'row',
			bodyHeight : 200,
			columns : [ {
				header : '설비코드',
				name : 'eqmId'
			}, {
				header : '설비명',
				name : 'eqmName'
			}, {
				header : '비가동명',
				name : 'resnName'
			}, {
				header : '시작시간',
				name : 'nonOprFrTm',
			}, {
				header : '종료시간',
				name : 'nonOprToTm',
			} ]
		});
		
		//비가동시작시간 버튼 이벤트
		$("#workStart").on("click",function(){
			let date = new Date();
			$("#workSttmH").val(date.getHours());
			$("#workSttmM").val(date.getMinutes());
			$("#workStop").removeAttr("disabled");
		})
		
		//비가동종료시간 버튼 이벤트
		$("#workStop").on("click",function(){
			let date = new Date();
			$("#workEntmH").val(date.getHours());
			$("#workEntmM").val(date.getMinutes());
			$("#workStart").attr("disabled",true);
		})
	</script>
</body>
</html>