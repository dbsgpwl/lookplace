<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/infopage.css" rel="stylesheet" type="text/css">
<body>

	
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
	<main>
	<div class="info-main">
		<div class="info-aside-menu" style="">
			<div class="info-aside"> 
				<div class="info-icon">
					<i class="fa-solid fa-circle-user"></i>
				</div>
				<div class="info-title"><h2>Info</h2></div>
			</div>
			<div class="info-menu">
				<p style="border-left:2px solid pink;"><b>나의 정보</b></p>
				<p>찜한 여행</p>
			</div>
		</div>
		
		<div class="info-main-area">
			<div class="info-main-title">
				<div><h3>회원탈퇴</h3></div>

			</div>
			<div class="info-table-area">
				<table class="table border border-1 info-table">
					<tr>
						<td>비밀번호</td>
						<td><input type=text class="form-control" placeholder="password 입력"></td>
					</tr>
				</table>
			</div>
			<div class="info-write-area" >
			 <button type="button" class="btn btn-outline-secondary" >탈퇴</button>
			 
			</div>
		</div>
		
		
	</div>
	</main>
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>