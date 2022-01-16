<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산 계획 조회</title>
</head>
<style>
th, td {
	padding: 5px;
}
</style>
<body>
    <div>
        <br>
        <h2>생산계획조회</h2>
        <br>
    </div>
    <div>
        <table>
            <tbody>
                <tr>
                    <th>진행 구분</th>
                    <td>
                    	<label for="radio-1">
                            <input type="radio" name="stFgRadio" id="stFgRi" value="전체" checked>
                            <span>전체</span>
                        </label>
                        <label for="radio-2">
                            <input type="radio" name="stFgRadio" id="stFg" value="진행">
                            <span>진행</span>
                        </label>
                        <label for="radio-3">
                            <input type="radio" name="stFgRadio" id="stFgR" value="완료">
                            <span>완료</span>
                        </label>
                    </td>
                    <td rowspan="3">
                        <button type="button" class="btn btn-secondary" id="btnSearch">검색</button>
                        <button type="button" class="btn btn-secondary" id="btnClear">초기화</button>
                    </td>
                </tr>
                <tr>
                    <th>제품명</th>
                    <td><input type="text" id="prdtName" required></td>
                    
                </tr>
                <tr>
                    <th>계획 일자</th>
                    <td><input type="date" id="durStart" required> ~ <input type="date" id="durEnd" required></td>
                </tr>
            </tbody>
        </table>
    </div>
    <br>
    <hr>
    <br>
    <!-- 계획 조회 그리드 -->
    <div id="PlanSearchGrid"></div>
    
    <script>
    	// 계획 조회 그리드 생성
    	var Grid = tui.Grid;

		//그리드 테마
		Grid.applyTheme('striped', {
			cell : {
				header : {
					background : '#eef'
				},
				evenRow : {
					background : '#fee'
				},
				selectedHeader : {
			    	background : '#FFFFFF'
			    }
			}
		});

		// 그리드 생성 : 관리
		const PlanSearchGrid = new Grid({
			el : document.getElementById('PlanSearchGrid'),
			data : {
				api : {
					readData : {url : '${path}/prd/chooseOrder.do',method : 'GET'}
				},
				contentType : 'application/json',
				initialRequest: false
			},
			rowHeaders : ['rowNum' ],
			selectionUnit : 'row',
			columns : [ {
				header : '생산계획코드',
				name : 'planDetaId'
			}, {
				header : '제품명',
				name : 'prdtNm',
			}, {
				header : '제품코드',
				name : 'prdtId',
			}, {
				header : '생산일수',
				name : 'prodDcnt',
			}, {
				header : '작업우선순위',
				name : 'priort',
			}, {
				header : '작업상태',
				name : 'fg',
			},{
				header : '생산계획명',
				name : 'name',
				hidden : true
			}]
		});
		
		$("#btnClear").on(
				"click",
				function() {
					$("#prdtName").val('');
					PlanSearchGrid.clear();
				});
    </script>
</body>
</html>