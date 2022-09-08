<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://kit.fontawesome.com/2c827c8cca.js" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지상세</title>
</head>


<body>
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>

	<!-- section 안에 작성 -->

	<main>
	<div style="margin-bottom: 30px; text-align: center;">
		<div>
			<span style="font-weight: bold; font-size: xx-large; margin-bottom: 50px;">여행
				장소 이름
			</span>
		</div>

		<div style="margin-bottom: 20px; text-align: center;">
			<span style="font-size: 10px;">지역명 + 주소</span><br> <span
				style="font-size: x-large;">열글자 설명</span>
		</div>
	</div>
	
	<div style="font-size: 16px; margin-top: 30px;">
		<div>
			<i class="fa-regular fa-heart"></i>
			공유
			조회수 300
		</div>
		<hr>
	
		<div style="display: flex; justify-content: space-between; margin-bottom: 25px; margin-top: 30px; font-weight: bold; margin-bottom: 30px;">
			<a>사진보기</a><a>상세정보</a><a>주차정보</a><a>여행톡</a>
		</div>
		<hr>
	</div>
	
	<div style="border-radius: 9px; background-color: lightgray; width: 30%; font-size: 25px; height: 200px; margin: 0 auto;">
		<div>
			사진
		</div>
	</div>

	<div style="padding-top: 40px;">	
	<div>
			<span style="font-weight: bold; font-size: large;">상세정보</span>
			<hr>
		</div>

		<div style="height: 20%; width: 80%; margin-top: 10px;">
			<span>상세정보란</span>
		</div>

		<div>
			<input type="text" value="#해시태그"
				style="width: 90px; height: 35px; margin-right: 10px; font-size: 14px;">
			<input type="text" value="#지역"
				style="width: 90px; height: 35px; margin-right: 10px; text-align: center; font-size: 14px;">
			<input type="text" value="#친구와함께"
				style="width: 90px; height: 35px; font-size: 14px;">
		</div>
	</div>	

 	<div style="margin-top: 30px; font-weight: bold; font-size: x-large;">
		<div>
			<span>여행톡</span>
			<div style="background-color: lightgray; width: 80%; height: 30%;">
				<input type="text">
			</div>
		</div>
	</div>	
	</main>
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>