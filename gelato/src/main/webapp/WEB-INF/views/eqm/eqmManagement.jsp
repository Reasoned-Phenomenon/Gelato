<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설비관리(조회, 수정/삭제)</title>
</head>
<body>
	<br>
	<h2>설비관리</h2>
	<br>
	<div>
		<label>구분</label> 
		<select>
			<option>전체</option>
			<option>생산설비</option>
			<option>배합기</option>
			<option>측정기</option>
			<option>가공기</option>
		</select>
		<button>조회</button>
	</div>
	<div id="grid" style="width: 500px;"></div>
<script>
	let arr=[];
		fetch("${pageContext.request.contextPath}/testAjax/info")
		.then(response=> response.json())
		.then(result => {
						
			for (item of result) {
				arr.push(item)
			}
			
			console.log(arr)
			
			grid.resetData(arr);
		})
			
	const grid = new tui.Grid({
	      el: document.getElementById('grid'),
		  data: arr,
	      scrollX: false,
	      scrollY: false,
	      columns: [
	        {
	          header: '설비코드',
	          name: 'employeeId'
	        },
	        {
	          header: '설비명',
	          name: 'lastName'
	        },
	        {
	          header: '공정코드',
	          name: 'salary'
	        },
	        {
	          header: '공정명',
	          name: 'salary'
	        },
	        {
	          header: '사용여부',
	          name: 'salary'
	        }
	      ]
	    });
</script>
</body>
</html>