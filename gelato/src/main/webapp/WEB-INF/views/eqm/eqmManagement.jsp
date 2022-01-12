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
			<div class="col-8">
				<h2 class="title">설비관리</h2>
				<label>구분</label> <select id="gubun">
					<option value="전체">전체
					<option value="배합">배합
					<option value="운송">운송
					<option value="측정">측정
					<option value="가공">가공
				</select>
				<button id="btnFind">조회</button>
				<div id="codeGrid"></div>
			</div>
			<div class="col-4">
				<h2 class="detailTitle">상세조회</h2>
				<div>설비 이미지</div>
				<div id="imageView">
					<img style="width: 200px;" id="preview-image"
						src="../resources/images/img/이미지프리뷰.jpg">
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
							<td><input id="eqmId"></td>
							<th>설비명</th>
							<td><input id="eqmName"></td>
						</tr>
						<tr>
							<th>최고온도</th>
							<td><input id="tempMax"></td>
							<th>최저온도</th>
							<td><input id="tempMin"></td>
						</tr>
						<tr>
							<th>점검주기</th>
							<td><input id="chckPerd"></td>
							<th>사용여부</th>
							<td><input type="checkBox" id="useYn" name="useYn">Y
								<input type="checkBox" id="notUse">N</td>
						</tr>
						<tr>
							<td>
								<button type="button" id="btnUpd"
									class="btn cur-p btn-outline-dark">수정</button>
							</td>
							<td>
								<button type="button" id="btnDel"
									class="btn cur-p btn-outline-dark">삭제</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		var Grid = tui.Grid;
		const codeGrid = new Grid({
			el : document.getElementById('codeGrid'),
			data : {
				api : {
					readData : {
						url : '${path}/eqm/eqmList.do',
						method : 'GET'
					}
				},
				contentType : 'application/json'
			},
			rowHeaders : [ 'checkbox' ],
			selectionUnit : 'row',
			bodyHeight : 600,
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
			} ]
		});

		$('#btnFind').on("click", function() {
			let gubun = $('#gubun option:selected').val();

			codeGrid.readData(1, {
				'gubun' : gubun
			}, true);
			//codeGrid.refreshLayout();
		})
	</script>
</body>
</html>