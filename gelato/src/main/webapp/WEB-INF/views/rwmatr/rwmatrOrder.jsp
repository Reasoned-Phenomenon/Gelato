<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
<button type="button" class="btn cur-p btn-outline-primary" id="btnFind">조회</button>
<button type="button" class="btn cur-p btn-outline-primary" id="btnRst">초기화</button>
<button type="button" class="btn cur-p btn-outline-primary" id="btnAdd">추가</button>
<button type="button" class="btn cur-p btn-outline-primary" id="btnDel">삭제</button>
<button type="button" class="btn cur-p btn-outline-primary" id="btnSave">저장</button>

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  MODAL
</button>

<hr>
<br>
<div class="row">
	<div id="codeGrid" style="width: 100%"></div>
</div>

<div class="modal" tabindex="-1" id="exampleModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<script>
$(function(){
	var myModalEl = document.getElementById('exampleModal')
	myModalEl.addEventListener('show.bs.modal', function (event) {
		console.log(event)
		$("#exampleModal .modal-body").load("searchCo.jsp");
	})
})

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
	    readData: 	{ url: '${path}/rwmatr/rwmatrOrderList.do', method: 'GET'},
	    modifyData : { url: '${path}/rwmatr/rwmatroModifyData.do', method: 'PUT'} 
	  },
	  contentType: 'application/json'
	},
	rowHeaders: ['checkbox'],
	selectionUnit: 'row',
	bodyHeight: 600,
	pageOptions: {
	    type: 'scroll'
    },
	columns:[
			{
			  header: '발주코드',
			  name: 'orderId',
			  editor: 'text'
			},
			{
			  header: '자재명',
			  name: 'nm',
			  editor: 'text'
			},
			{
			  header: '자재코드',
			  name: 'rwmatrId',
			  editor: 'text'
			},
			{
			  header: '단가',
			  name: 'untprc',
			  editor: 'text'
			},
			{
			  header: '발주량',
			  name: 'qy',
			  editor: 'text'
			},
			{
			  header: '업체명',
			  name: 'vendName',
			  editor: 'text'
			},
			{
			  header: '발주신청일',
			  name: 'orderDt',
			  editor: 'text'
			},
			{
			  header: '납기요청일',
			  name: 'dudt',
			  editor: 'text'
			}
		]
});

	codeIdGrid.on("click", (ev) => {
		console.log(ev);
		console.log(ev.nativeEvent.srcElement.innerHTML);
		console.log(ev.nativeEvent.srcElement.innerText);
		console.log(codeIdGrid)
		console.log("checked!!!!");
	});
	
	codeIdGrid.on('response', function (ev) {
		// 성공/실패와 관계 없이 응답을 받았을 경우
		console.log("1111");
		//console.log(ev);
		/* grid.resetOriginData(); */
	});

	btnFind.addEventListener("click", function(){
		
	});
	btnAdd.addEventListener("click", function(){
		codeIdGrid.appendRow();
	});
	btnDel.addEventListener("click", function(){
		codeIdGrid.removeCheckedRows(true);
	});
	btnSave.addEventListener("click", function(){
		codeIdGrid.request('modifyData');
	});

</script>
</body>
</html>