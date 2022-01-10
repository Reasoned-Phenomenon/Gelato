<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설비등록</title>
</head>
<body>
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
							<td><input id="macNo" required></td>
							<th>사용여부</th>
							<td><input type="checkBox" id="Use">Y <input
								type="checkBox" id="notUse">N</td>
							<th>설비구분</th>
							<td><input required>
								<button type="button">찾아보기</button> <input></td>
						</tr>
						<tr>
							<th>설비명</th>
							<td><input required></td>
							<th>설비규격</th>
							<td><input></td>
						</tr>
						<tr>
							<th>모델</th>
							<td><input></td>
							<th>제작업체</th>
							<td><input></td>
							<th>작업자</th>
							<td><input></td>
						</tr>
						<tr>
							<th>용도</th>
							<td><input></td>
							<th>용량/규격</th>
							<td><input></td>
							<th>제작일자</th>
							<td><input></td>
						</tr>
						<tr>
							<th>구매금액</th>
							<td><input></td>
							<th>구매일자</th>
							<td><input type="date" required></td>
						</tr>
						<tr>
							<th>온도</th>
							<td><input placeholder="최저온도">~<input
								placeholder="최고온도">°C</td>
						</tr>
						<tr>
							<th>UPH</th>
							<td><input></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<h3>설비 이미지 등록</h3>
				<div>
					<button>이미지 업로드</button>
					<button>지우기</button>
				</div>
			</div>
			<div>
				<button>저장</button>
			</div>
		</div>
	</div>
</body>
</html>