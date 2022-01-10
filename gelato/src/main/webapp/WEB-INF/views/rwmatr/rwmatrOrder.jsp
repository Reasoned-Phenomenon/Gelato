<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>원자재 발주관리</h3>
<form>
<table border="1">
	<thead>
		<tr>
			<th>코드ID</th>
			<th>코드</th>
		</tr>
	</thead>
		
	<tbody>
		<tr>
			<td>코드ID</td>
			<td>코드 : <input type="text" id="" name=""></td>
		</tr>
	</tbody>
</table>
</form>
<br>

<button type="button" class="btn cur-p btn-outline-primary" id="btnSave">저장</button>
<button type="button" class="btn cur-p btn-outline-primary" id="btnAdd">추가</button>
<button type="button" class="btn cur-p btn-outline-primary" id="btnDel">삭제</button>

<button type="button" class="model_bt btn btn-primary" data-toggle="modal" data-target="#myModal" id="">Modal</button>

<hr>
<br>
<div class="row">
	<div id="codeGrid" class="col-sm-8"></div>
</div>


<script>
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
const codeIdGrid = new Grid({
	el: document.getElementById('codeGrid'),
	data : {
	  api: {
	    readData: 	{ url: '${path}/com/findComCode.do', method: 'GET'},
	    modifyData : { url: '${path}/com/comCodeModifyData.do', method: 'PUT'} 
	  },
	  contentType: 'application/json'
	},
	rowHeaders:['rowNum'],
	selectionUnit: 'row',
	columns:[
			{
			  header: '코드ID',
			  name: 'codeId',
			  sortingType: 'desc',
	          sortable: true
			},
			{
			  header: '코드ID이름',
			  name: 'codeIdNm'
			},
			{
			  header: '코드ID이름',
			  name: 'codeIdDc',
			  hidden:true
			}
		]
});
</script>
</body>
</html>