<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자재 코드 관리 페이지</title>
</head>
<body>
	<div>
	  <br>
		<h3>자재 코드 관리</h3>
	</div>
	<div align="right">
		<button type="button" class="btn cur-p btn-outline-primary" id="SaveBtn">저장</button>
		<button type="button" class="btn cur-p btn-outline-primary" id="DelBtn">삭제</button>
		<button type="reset" class="btn cur-p btn-outline-primary">초기화</button>
	</div>
	
	<div class="col-8" >
			<br>
				<table>
					<tbody>
						<tr>
							<th>자재코드* </th>
							<td><input></td>
							<th>자재명* </th>
							<td><input></td>
						</tr>
						<tr>
							<th>규격</th>
							<td><input></td>
							<th>관리단위</th>
							<td><input></td>
						</tr>
						<tr>
							<th>입고 업체</th>
							<td><input>
							<button>검색</button></td>
							<th>업체명</th>
							<td><input></td>
						</tr>
						<tr>
							<th>자재 계정</th>
							<td><input>
							<button>검색</button>
							<input></td>
							<th>자재 구분</th>
							<td><input>
							<button>검색</button>
							<input></td>
						</tr>
						<tr>
							<th>재질 구분</th>
							<td><input>
							<button>검색</button>
							<input></td>
						</tr>
						<tr>
							<th>사용유무</th>
							<td><input type="checkbox"></td>
							<th>검사유무</th>
							<td><input type="checkbox"></td>
							<th>원통자재</th>
							<td><input type="checkbox"></td>
						</tr>
						<tr>
							<th>LOT관리</th>
							<td><input type="checkbox"></td>
							<th>안전재고 관리</th>
							<td><input type="checkbox"></td>
						</tr>
						
					</tbody>
				</table>
			</div>
	
<div id="rwmatrGrid"></div>

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
var rwmatrGrid = new Grid({
	el: document.getElementById('rwmatrGrid'),
	data : {
	  api: {
	    readData: 	{ url: '${path}/com/findRwmatrList.do', method: 'GET'},
	    
	  },
	  contentType: 'application/json',
	 
	},
	rowHeaders: ['rowNum'],
	selectionUnit: 'row',
	columns:[
			{
			  header: '자재 코드',
			  name: 'rwmatrId',
			  align: 'center'
		      
			},
			{
			  header: '자재 명',
			  name: 'nm',
			  align: 'center'
	          
			},
			{
			  header: '규 격',
			  name: 'spec',
			  align: 'center'
		      
			},
			{
			  header: '업체 코드',
			  name: 'vendId',
			  align: 'center',
			  hidden: true
			      
		   },
		   {
			  header: '작업 단위',
			  name: 'wkUnit',
			  align: 'center',
			  hidden: true
				      
	       },
	       {
			  header: '안전 재고',
			  name: 'safStc',
		      align: 'center',
		      hidden: true
					      
		   },
		]
});

	
	</script>
	
	
	
</body>
</html>