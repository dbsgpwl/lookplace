<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<link href="/resources/css/travel-c.css" rel="stylesheet" type="text/css">
<html>
<head>
<meta charset="UTF-8">
<title>코스상세</title>
</head>
<body>

	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	<!-- main 안에 작성 -->
	<main>
	<div class="travelC_firstdiv">
		<div class="travelC_seconddiv">
			<h3>ooo 여행</h3>
			<span style="font-size: 13px;">충남 oo시 ㅣ 코스 총 거리 : 80km</span>
		</div>
		<div>
			<div>
				<img src="/resources/image/heart.png">
				<img src="/resources/image/share.png">
				 <span style="font-size:12px;">조회수 300</span>
			</div>
		</div>
		<hr>
		<div class="travelC_thirddiv">
			<div class="travelC_thirddiv2">
				<i class="fa-solid fa-calendar-days fa-4x"></i>
			</div>
			<div class=".travelC_fontsizediv1">
				<div class="travelC_fontsize1">일정</div>
				<div class="travelC_fontsize2">당일여행</div>
			</div>

			<div class="travelC_thirddiv2">
				<i class="fa-solid fa-users fa-4x"></i>
			</div>
			<div class="travelC_fontsizediv2">
				<div class="travelC_fontsize1">테마</div>
				<div class="travelC_fontsize2">가족코스</div>
			</div>
		</div>
		<hr>
		<div class="travelC_apidiv">
			<span style="color: white;">api 지도</span>
		</div>


		<div class="travelC_apidiv2">
						
		</div>


		<div style="margin-top: 100px; ">
			<h4>여행톡</h4>
			<div class="travelC-reply_content">
				<input type="text" placeholder="로그인 후 댓글을 남겨주세요.">
				<div class="travelC_buttondiv">
				<button class="travelC_button">등록</button>
				</div>
			</div>			
		</div>
	</div>	
	</main>
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>