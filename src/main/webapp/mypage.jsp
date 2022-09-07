<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
</head>

<body>

	<style>
#nav-text {
	text-align: center;
}
#mytable tr,td{
	border: 1px solid gray;
}
#mytable {
	text-align: center;
}
</style>


	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	<jsp:include page="/resources/includes/nav.jsp"></jsp:include>

	<!-- section 안에 작성 -->
	<div style="position: absolute; border-left: 1px solid black; width:10px; height: 30px; top:280px;">
	</div>
	<section style="height: 100%;">
		<div style="display: flex; justify-content: space-between;">
			<div id="nav-text" style="width: 20%; border-right: 1px solid black;">
				<img src=""> <span> <b style="font-size: 30px;">마이페이지</b></span>
				<p><a>나의 정보</a></p>
				<p><a>위시리스트</a></p>
				<p><a>회원탈퇴</a></p>
			</div>

			<section style="height: 300px; width: 70%;">
				<div style="display: flex; justify-content: space-between;">
					<h1 style="">회원탈퇴</h1>
					<p style="padding-top: 50px; margin: 0px;">* 필수입력</p>
				</div>
				<hr>


				<section style="position: relative; width: 450px; height: 100px; left:150px; top: 50px;">
					<form action="">
						<table id="mytable" style="border-collapse: collapse;">
							<colgroup>
								<col width="100">
								<col width="400">
							</colgroup>
							<tr>
								<td>비밀번호</td>
								<td><input type="password" placeholder="password입력" style="border: none;"></td>
							</tr>
						</table>
						<button type="submit" style="margin-top: 60px; font-size:20px; position:relative; left:100px; width: 100px; height: 50px; border-radius: 5px;">탈퇴</button>
					</form>
				</section>
			</section>
		</div>

	</section>



	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>