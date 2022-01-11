<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설비등록</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
    href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
</head>
<body>
<!-- 설비구분 모달 -->
<div id="dialog-form" title="설비구분 모달"></div>
	<form action="${pageContext.request.contextPath}/insert" method="post" name="frm">
		<div>
			<br>
			<h2 id="title">설비 등록</h2>
			<br>
			<div>
				<div>
					<table>
						<tbody>
							<tr>
								<th>설비코드 <strong>*</strong>
								</th>
								<td><input id="eqmId" name="eqmId" required></td>
								<th>사용여부</th>
								<td><input type="checkBox" id="useYn" name="useYn">Y
									<input type="checkBox" id="notUse">N</td>
								<th>설비구분</th>
								<td><input id="fg" name="fg" required>
									<button id="btnFindFg" type="button" class="btn cur-p btn-outline-dark" data-bs-toggle="modal" aria-label="Close">
									찾아보기
									</button><input id="fgName" name="fgName"></td>
							</tr>
							<tr>
								<th>설비명</th>
								<td><input id="eqmName" name="eqmName" required></td>
								<th>설비규격</th>
								<td><input id="spec" name="spec"></td>
							</tr>
							<tr>
								<th>모델번호</th>
								<td><input id="modelNo" name="modelNo"></td>
								<th>제작업체</th>
								<td><input id="vendId" name="vendId"></td>
								<th>작업자</th>
								<td><input id="mngr" name="mngr" width="50px"></td>
							</tr>
							<tr>
								<th>설비규격</th>
								<td><input></td>
							</tr>
							<tr>
								<th>구매일자</th>
								<td><input type="date" id="pureDt" name="pureDt" required></td>
							</tr>
							<tr>
								<th>온도</th>
								<td><input placeholder="최저온도" id="tempMin" name="tempMin">~<input
									placeholder="최고온도" id="tempMax" name="tempMax">°C</td>
							</tr>
							<tr>
								<th>UPH</th>
								<td><input id="uph" name="uph"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<h3>설비 이미지 등록</h3>
						<div class="image-container">
							<img style="width: 250px;" id="preview-image"
								src="../resources/images/img/이미지프리뷰.jpg">
							<input style="display: block;" type="file" id="input-image" >
						</div>
						<img id="eqmImg" name="eqmImg" src="">
						<button type="button" class="btn cur-p btn-outline-dark">이미지업로드</button>
				</div>
				<div>
					<button type="reset" value="내용초기화"
						class="btn cur-p btn-outline-dark">초기화</button>
					<button class="btn cur-p btn-outline-dark">저장</button>
				</div>
			</div>
		</div>
	</form>
	<script>
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image")
	            previewImage.src = e.target.result
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
	}
	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
	    readImage(e.target)
	})
	
//설비구분 모달
$(function(){
	let dialog = $( "#dialog-form" ).dialog({
		autoOpen :false,
		modal : true
	});
	
	$("#btnFindFg").on("click",function(){
		dialog.dialog("open");
		$("#dialog-form").load("${path}/eqm/searchFg.do", 	//load가 익숙치 않으면 ajax를 써도됨
				function(){console.log("로드됨")})
	});
})
	</script>
</body>
</html>