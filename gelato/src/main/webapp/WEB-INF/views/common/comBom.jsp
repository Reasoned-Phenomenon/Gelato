<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOM 코드 관리 페이지</title>
</head>
<body>
		<div>
			<br>
			<h3>BOM 코드 관리</h3>
		</div>
		
		
		<form id="" name="" method="">
			
			<div>
			<br>
				<label>제품코드</label>
	      			<input type="text" id="" name="">
	      			<button type="button" id="">검색</button>&ensp;&ensp;&ensp;
	      					
	      		<label>제품명</label>
	      			<input type="text" id="" name=""> &ensp;
	      			
	      		<label>소모량</label>
	      			<input type="text" id="" name=""> &ensp;
	      		
	      		<label>업체명</label>
	      			<input type="text" id="" name=""> &ensp;		
	      		
	      		<label>사용여부</label>
	      			<input type="checkBox" id="" name=""> &ensp;		
			    <br>
	      	 </div>
				<div>
					<button type="button" class="btn cur-p btn-outline-primary" id="btnAdd">추가</button>
					<button type="button" class="btn cur-p btn-outline-primary" id="btnFind">조회</button>
					<button type="button" class="btn cur-p btn-outline-primary" id="btnSave">저장</button>
				
				</div>
		</form>
		

<div id="bomGrid" style="width: 100%"></div>
<div id="bomModal" style="width: 100%"></div>
		
<script>
var Grid = tui.Grid;

//그리드 테마.
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

//그리드 생성.
const bomGrid = new Grid({
	el: document.getElementById('bomGrid'),
	data : {
	  api: {
	    readData: 	{ url: '${path}/com/findBomList.do', method: 'GET'},
	  },
	  contentType: 'application/json'
	},
	rowHeaders: ['checkbox','rowNum'],
	selectionUnit: 'row',
	columns:[
			{
			  header: 'BOM코드',
			  name: 'bomId',
			  editor:'text',
			  align: 'center'
		      
			},
			{
			  header: '제품코드',
			  name: 'prdtId',
			  editor:'text',
			  align: 'center'
	          
			},
			{
			  header: '자재코드',
			  name: 'rwmatrId',
			  editor:'text',
			  align: 'center'
		      
			},
			{
			  header: '소모량',
			  name: 'qy',
			  editor:'text',
			  align: 'center'
			  
			},
			{
			  header: '공정코드',
			  name: 'prcsId',
			  editor:'text',
			  align: 'center'
		     
			},
			
			{
			  header: '단계구분',
			  name: 'fg',
			  editor:'text',
			  align: 'center'
			  
			},
			{
        	  header: '비고',
		      name: 'remk',
		      editor:'text',
		      align: 'center'
		      
			},
			{
              header: '사용여부',
			  name: 'useYn',
			  editor:'text',
			  align: 'center'
			  
			}
		]
});


</script>		
		
		
</body>
</html>