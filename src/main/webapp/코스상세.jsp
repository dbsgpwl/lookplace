<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://kit.fontawesome.com/2c827c8cca.js" crossorigin="anonymous"></script>
<html>
<head>
<meta charset="UTF-8">
<title>코스상세</title>
</head>
<body>
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>	
	<!-- main 안에 작성 -->
<main>
	<div style="text-align: center; margin-bottom:20px;">
		<h3>ooo 여행</h3>
		<span style="font-size:13px; ">충남 oo시  ㅣ 코스 총 거리 : 80km</span>
	</div>
	
	<div>
		<div>
			<i class="fa-regular fa-heart"></i>
			공유
			조회수 300
		</div>
	</div>	
		<hr>
		<div style="display:flex; justify-content: center;">
			<div style="color:rgb(29, 228, 195);"><i class="fa-solid fa-calendar-days fa-4x"></i></div>
			<div style="margin-right: 150px; margin-left:15px;">
				<div style="font-size:16px;">일정</div>
				<div style="font-size:x-large;">당일여행</div>				
			</div>
			
			<div style="color:rgb(29, 228, 195); margin-left: 100px;"><i class="fa-solid fa-users fa-4x"></i></div>
			<div style="margin-left:15px;">
				<div style="font-size:16px;">테마</div>
				<div style="font-size:x-large;">가족코스</div>
		    </div>		
		</div>	
		<hr>
	<div style="width:30%; height:250px; background-color:black; margin: 0 auto;">
		<span style="color: white;">api 지도</span>
	</div>	
	
	<div style="width:60%; height:300px; background-color:lightgray; margin:0 auto; margin-top: 30px; ">
		
	</div>
	
	<style>
		input {
			
			width:100%;
			height: 60px;
		}
		button{
		width:60px;
		}
		
	</style>
		
	<div style="margin-top:100px;">		
	<h4>여행톡</h4>
		<div style="width:59%; height:140px; background-color:lightgray; margin: 0 auto; padding: 10px 10px 0 10px; display: flex; flex-direction: column; justify-content: space-between;">
			<input type="text" placeholder="로그인 후 댓글을 남겨주세요.">
			<button>등록</button>
		</div>
	</div>	
</main>
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>