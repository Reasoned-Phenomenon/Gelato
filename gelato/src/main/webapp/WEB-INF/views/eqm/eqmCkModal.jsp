<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설비 점검대상 모달</title>
</head>
<body>
	<div id="eqmCkGrid"></div>
	<script>
		var codeParam;

		var Grid = tui.Grid;

		var eqmCkGrid = new Grid({
			el : document.getElementById('eqmCkGrid'),
			data : {
				api : {
					readData : {
						url : '${path}/eqm/eqmCkDate.do',
						method : 'GET'
					}
				},
				contentType : 'application/json'
			},
			rowHeaders : [ 'rowNum' ],
			selectionUnit : 'row',
			bodyHeight : 300,
			columns : [ {
				header : '설비코드',
				name : 'eqmId'
			}, {
				header : '설비명',
				name : 'eqmName'
			}, {
				header : '점검일자',
				name : 'c'
			}, {
				header : '설비명',
				name : 'eqmName'
			} ]
		});
	</script>
</body>
</html>