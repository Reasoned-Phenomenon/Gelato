<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설비관리(조회, 수정/삭제)</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
</head>
<body>
	<div class="container">
		<div class="flex row">
			<div class="col-7">
				<h2>설비관리</h2>
				<label>구분</label> <select id="gubun" onchange="selectGubun()">
					<option value="전체">전체
					<option value="배합">배합
					<option value="운송">운송
					<option value="측정">측정
					<option value="가공">가공
				</select>
				<div id="eqmListGrid"></div>
			</div>
			<div class="col-5">
				<h2 class="detailTitle">상세조회</h2>
				<div>설비 이미지</div>
				<div id="imageView">
					<img style="width: 200px;" id="preview-image"
						src="../resources/images/img/이미지프리뷰.jpg"> <input
						style="display: block;" type="file" id="eqmImg">
				</div>
				<div>
					<button type="button" id="btnImgUpd"
						class="btn cur-p btn-outline-dark">이미지업로드</button>
					<button type="button" id="btnImgDel"
						class="btn cur-p btn-outline-dark">지우기</button>
				</div>
				<table>
					<tbody>
						<tr>
							<th>설비코드</th>
							<td><input id="eqmId" disabled></td>
							<th>설비명</th>
							<td><input id="eqmName" disabled></td>
						</tr>
						<tr>
							<th>공정코드</th>
							<td><input id="prcsId" disabled></td>
							<th>공정명</th>
							<td><input id="nm" disabled></td>
						</tr>
						<tr>
							<th>최고온도</th>
							<td><input id="tempMax" disabled></td>
							<th>최저온도</th>
							<td><input id="tempMin" disabled></td>
						</tr>
						<tr>
							<th>점검주기</th>
							<td><input id="chckPerd" disabled></td>
							<th>사용여부</th>
							<td><input type="radio" id="useYn" name="useYn" value="Y">Y
								<input type="radio" id="notUse" name="useYn" value="N">N</td>
						</tr>
						<tr>
							<td>
								<button type="button" id="btnUpd"
									class="btn cur-p btn-outline-dark">수정</button>
							</td>
							<!-- 	<td>
								<button type="button" id="btnDel"
									class="btn cur-p btn-outline-dark">삭제</button>
							</td> -->
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		var Grid = tui.Grid;
		
		const eqmListGrid = new Grid({
			el : document.getElementById('eqmListGrid'),
			data : {
				api : {
					readData : {
						url : '${path}/eqm/eqmList.do',
						method : 'GET'
					}
				},
				contentType : 'application/json'
			},rowHeaders:['rowNum'],
			selectionUnit : 'row',
			bodyHeight : 500,
			columns : [ {
				header : '설비코드',
				name : 'eqmId'
			}, {
				header : '설비명',
				name : 'eqmName'
			}, {
				header : '공정코드',
				name : 'prcsId'
			}, {
				header : '공정명',
				name : 'nm'
			}, {
				header : '사용여부',
				name : 'useYn'
			}, {
				header : '최고온도',
				name : 'tempMax',
				hidden:true
			}, {
				header : '최저온도',
				name : 'tempMin',
				hidden:true
			}, {
				header : '점검주기',
				name : 'chckPerd',
				hidden:true
			}, {
				header : '이미지',
				name : 'eqmImg',
				hidden:true
			} ]
		});
		
		//드롭다운 선택시 바로 조회
		function selectGubun(){
			let gubun = $('#gubun option:selected').val();
			eqmListGrid.readData(1, {
				'gubun' : gubun
			}, true);
		}
	
		//더블 클릭시 한 행 선택
		eqmListGrid.on("dblclick", (ev) => {
			
			$("#eqmId").val(eqmListGrid.getValue(ev["rowKey"],"eqmId"));
			$("#eqmName").val(eqmListGrid.getValue(ev["rowKey"],"eqmName"));
			$("#prcsId").val(eqmListGrid.getValue(ev["rowKey"],"prcsId"));
			$("#nm").val(eqmListGrid.getValue(ev["rowKey"],"nm"));
			$("#tempMax").val(eqmListGrid.getValue(ev["rowKey"],"tempMax"));
			$("#tempMin").val(eqmListGrid.getValue(ev["rowKey"],"tempMin"));
			$("#chckPerd").val(eqmListGrid.getValue(ev["rowKey"],"chckPerd"));
			//$("#eqmImg").val(eqmListGrid.getValue(ev["rowKey"],"eqmImg"));
			eqmListGrid.getValue(ev["rowKey"],"useYn")=='Y'?$("#useYn").prop("checked",true):$("#notUse").prop("checked",true);
			
			$("#tempMax").attr("disabled",false);
			$("#tempMin").attr("disabled",false);
			$("#chckPerd").attr("disabled",false);
		}) 
		
		//수정버튼 클릭
		$("#btnUpd").on("click", function(){
			
			gubun = $('#gubun option:selected').val();
			
			var yn = $("input[name=useYn]:checked").val();
			var eqmId = $("#eqmId").val();
			var eqmName = $("#eqmName").val();
			var params = {
			eqmId : eqmId,
			eqmName : eqmName,
			prcsId : $("#prcsId").val(),
			nm : $("#nm").val(),
			tempMax : $("#tempMax").val(),
			tempMin : $("#tempMin").val(),
			chckPerd : $("#chckPerd").val(),
			//eqmImg : $("#eqmImg").val(),
			useYn : yn
			}
			
			$.ajax({
				url : "${path}/eqm/eqmUpdate.do",
				data : params,
				method :'GET',
				success : function(res){ 
					eqmListGrid.readData(1,{'gubun':gubun},true);
					if(yn == 'N'){
						if(confirm("비가동관리 페이지로 이동하시겠습니까?")){
							location.href= "${path}/eqm/eqmNonMoving.do?eqmId="+eqmId+"&eqmName="+eqmName;
							/* $.ajax({
								url : "${path}/eqm/eqmNonMoving.do",
								data : params,
								method : 'GET',
								success:function(){
									console.log("성공");
								}
							}) */
						}
					}else{
						toastr.options.positionClass = "toast-top-center";
						toastr.options.progressBar = true;
						toastr.success('수정성공','설비관리',{timeOut:'1500'});
					}
                }
			})
		})
		
	</script>
</body>
</html>