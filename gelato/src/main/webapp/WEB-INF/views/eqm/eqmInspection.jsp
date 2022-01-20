<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설비 점검 페이지(점검등록/점검내역조회)</title>
</head>
<body>
	<div class="container">
		<div>
			<h2>설비 정기점검 관리</h2>
			<div>
				<button type="reset" class="btn btn-reset" id="resetBtn">초기화</button>
				<button type="button" class="btn btn-search" id="searchBtn">조회</button>
				<button type="button" class="btn btn-exel" id="saveBtn">저장</button>
				<button type="button" class="btn btn-print" id="removeBtn">삭제</button>
			</div>
		</div>
		<br> <label>구분</label> <select id="gubun"
			onchange="selectGubun()">
			<option value="전체">전체
			<option value="배합기">배합기
			<option value="운송기">운송기
			<option value="측정기">측정기
			<option value="가공기">가공기
		</select>
		<div>
			<div id="eqmInsGrid"></div>
		</div>
	</div>
	<script>
		var Grid = tui.Grid;

		const eqmInsGrid = new Grid({
			el : document.getElementById('eqmInsGrid'),
			data : {
				api : {
					readData : {
						url : '${path}/eqm/eqmInspectionList.do',
						method : 'GET'
					}
				},
				contentType : 'application/json'
			},
			rowHeaders : [ 'rowNum' ],
			selectionUnit : 'row',
			bodyHeight : 500,
			columns : [ {
				header : '설비코드',
				name : 'eqmId'
			}, {
				header : '설비명',
				name : 'eqmName'
			}, {
				header : '점검주기',
				name : 'chckPerd'
			}, {
				header : '점검일자',
				name : 'chckDt'
			}, {
				header : '차기점검일',
				name : 'nCkDt'
			}, {
				header : '판정',
				name : 'judt'
			}, {
				header : '점검내역',
				name : 'chckDeta'
			} ]
		});

		//드롭다운 선택시 바로 조회
		function selectGubun() {
			let gubun = $('#gubun option:selected').val();
			eqmListGrid.readData(1, {
				'gubun' : gubun
			}, true);
		}
	</script>
</body>
</html>