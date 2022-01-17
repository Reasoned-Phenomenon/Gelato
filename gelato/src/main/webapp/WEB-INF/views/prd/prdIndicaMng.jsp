<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산 지시 조회</title>
</head>
<body>
	<div>
		<br>
		<h2>생산지시관리</h2>
		<br>
	</div>
	<br>
	<div class="row">
		<div class="col-sm-8">
			 <button type="button" class="btn btn-secondary" id="btnSearch">미지시 계획 조회</button>
		</div>
		<div class="col-sm-4">
			 <button type="button" class="btn btn-secondary" id="btnIns">지시 등록</button>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-sm-4">
			<div id="planDetaGrid">그리드1</div>
			<hr>
		</div>
		<div class="col-sm-8">
			<div id="planIndicaGrid">그리드2</div>
			<hr>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4">
			<div id="RwmatrGrid">그리드3</div>
			<hr>
		</div>
		<div class="col-sm-8">
			<div id="RwmatrLotGrid">그리드4</div>
			<hr>
		</div>
	</div>
	
	<!-- 미지시 생산계획조회 모달창 -->
	<div id=nonIndicaDialog title="미지시 생산계획 목록"></div>
</body>

<script>

	// 미지시 생산계획 조회 모달창 생성
	var NonIndicaDialog = $("#nonIndicaDialog").dialog({
			modal : true,
			autoOpen : false,
			height: 600,
			width: 1000
		});
	
	$("#btnSearch").on(
			"click", function() {
				console.log(121212);
				NonIndicaDialog.dialog("open");
				console.log(232323);
				   $("#nonIndicaDialog").load("${path}/prd/nonIndicaDialog.do",
						function() {
							console.log("주문창 로드")
						})
			});
	//종료





















</script>
</html>