<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설비등록</title>
</head>
<body>
	<form action="insert" method="post" name="frm">
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
									<button type="button">찾아보기</button> <input></td>
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
								src="../images/img/이미지프리뷰.jpg">
							<input style="display: block;" type="file" id="input-image" >
						</div>
						<img id="eqmImg" name="eqmImg" src="">
						<button type="button" class="btn cur-p btn-outline-dark">이미지업로드</button>
				</div>
				<div>
					<button type="reset" value="내용초기화"
						class="btn cur-p btn-outline-dark">초기화</button>
					<button type="button" class="btn cur-p btn-outline-dark">저장</button>
				</div>
			</div>
		</div>
	</form>

	<script>
		
	</script>
</body>
</html>