<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>주문서 관리 조회</title>
</head>
<body>
	<main>
	  <div>
	  	<br>
		<h3>주문서 관리 조회</h3>
	     <div>
	     	
	     	
	      <form id="" name="" method="">
	      	<div>
	      		<ul>
	      			<li>
	      				<div>
	      					
	      				  		<br>
	      				  	    <label>진행 구분</label>
	      				  		<label for="radio-3">
	      				  			<input type="radio" name="" id="" value="1">
	      				  			<span>진행</span>
	      				  		</label>
	      				  		<label for="radio-4">
	      				  			<input type="radio" name="" id="" value="2">
	      				  			<span>완료</span>
	      				  		</label>
	      				  		<label for="radio-5">
	      				  			<input type="radio" name="" id="" value="3">
	      				  			<span>전체</span>
	      				  		</label>
	      				  	
	      				</div>
	      			</li>
	      			<li>
	      				<div>
	      					<label>해당일자</label>
	      				</div>
	      			</li>
	      			<li>
	      				<div>
	      					<label>거래처</label>
	      					<input type="text" id="" name="">
	      					<button type="button" id="">찾아보기</button>&ensp;&ensp;&ensp;
	      					
	      					<label>제품코드</label>
	      					<input type="text" id="" name="">
	      					<button type="button" id="">찾아보기</button> &ensp;
	      					
	      				<button type="button" class="btn cur-p btn-outline-primary" id="btnRst">새자료</button>
	      				<button type="button" class="btn cur-p btn-outline-primary" id="btnFind">조회</button>
						<button type="button" class="btn cur-p btn-outline-primary" id="btnAdd">Excel</button>
						<button type="button" class="btn cur-p btn-outline-primary" id="btnDel">인쇄</button>
					
	      				</div>
	      			</li>
	      		</ul>
	      	</div>
	      </form>
	     </div>
	  </div> 
 </main>
<div class="row">
	<div id="codeGrid" style="width: 100%"></div>
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
const codeGrid = new Grid({
	el: document.getElementById('codeGrid'),
	data : {
	  api: {
	    readData: 	{ url: '${path}/biz/findOrderList.do', method: 'GET'},
	  },
	  contentType: 'application/json'
	},
	rowHeaders: ['checkbox'],
	selectionUnit: 'row',
	columns:[
			{
			  header: '주문코드',
			  name: 'orderId',
		      editor: 'text'
			},
			{
			  header: '업체명',
			  name: 'vendName',
	          editor: 'text'
			},
			{
			  header: '주무일자',
			  name: 'orderDt',
		      editor: 'text'
			},
			{
			  header: '납기일자',
			  name: 'oustDt',
			  editor: 'text'
			},
			{
			  header: '진행상황구분',
			  name: 'stFg',
		      editor: 'text'
			},
			
			{
			  header: '제품코드',
			  name: 'prdtId',
			  editor: 'text'
			},
			{
        	  header: '수량',
		      name: 'qy',
		      editor: 'text'
			},
			{
              header: '비고',
			  name: 'remk',
			  editor: 'text'
			},
		]
});

	// 버튼 이벤트 만들기.
	
	

</script>	
	
</body>
</html>