<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설비비가동 페이지(비가동등록/비가동내역 조회)</title>
</head>
<body>
	<div class="container">
		<div class="flex row">
			<div class="col-4">
				<h2>비가동 등록</h2>
				${datas} <br> <label>설비구분</label> <select id="gubun">
					<option value="전체">전체
					<option value="배합">배합
					<option value="운송">운송
					<option value="측정">측정
					<option value="가공">가공
				</select>
				<button id="btnFind">조회</button>
				<div id="eqmListGrid" style="width: 100%;"></div>
			</div>
			<div class="col-8">
				<h2>비가동 등록</h2>
				<form>
					<table>
						<tbody>
							<tr>
								<th>비가동코드 <strong>*</strong>
								</th>
								<td><input></td>
								<th>설비명</th>
								<td><input></td>
							</tr>
							<tr>
								<th>작업자</th>
								<td><input></td>
							</tr>
							<tr>
								<th>점검시작</th>
								<td><select>
										<option>09시</option>
										<option>11시</option>
										<option>13시</option>
										<option>15시</option>
										<option>17시</option>
								</select></td>
							</tr>
							<tr>
								<th>점검내역</th>
								<td><input type="text"></td>
							</tr>
							<tr>
								<th>판정</th>
								<td><input type="checkBox" id=>적합<input
									type="checkBox">부적합</td>
							</tr>
							<tr>
								<td><button>점검완료</button></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="col-12">
				<br>
				<h2>내역 조회</h2>
				<br> <label>공정코드</label> <select>
					<option>공정코드1</option>
					<option>공정코드2</option>
					<option>공정코드3</option>
					<option>공정코드4</option>
				</select>
				<button>조회</button>
				<div id="eqmNonList" style="width: 100%;"></div>
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
						url : '${path}/eqm/eqmNonMovingList.do',
						method : 'GET'
					}
				},
				contentType : 'application/json'
			},
			bodyHeight : 600,
			columns : [ {
				header : '설비코드',
				name : 'eqmId'
			}, {
				header : '설비명',
				name : 'eqmName',
				width : 'auto'
			}, {
				header : '공정명',
				name : 'nm',
				width : 'auto'
			}, {
				header : '점검주기',
				name : 'chckPerd',
			} ]
		});

		const eqmNonListGrid = new Grid({
			el : document.getElementById('eqmNonList'),
			data : {
				api : {
					readData : {
						url : '${path}/eqm/eqmNonSelect.do',
						method : 'GET'
					}
				},
				contentType : 'application/json'
			},
			rowHeaders : [ 'rowNum' ],
			selectionUnit : 'row',
			bodyHeight : 600,
			columns : [ {
				header : '설비코드',
				name : 'eqmId'
			}, {
				header : '설비명',
				name : 'eqmName'
			}, {
				header : '비가동명',
				name : 'resnName'
			}, {
				header : '시작시간',
				name : 'nonOprFrTm',
			}, {
				header : '종료시간',
				name : 'nonOprToTm',
			} ]
		});
	</script>
</body>
</html>