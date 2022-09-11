<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/css/travel-p.css" rel="stylesheet" type="text/css">
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
	<div class="travelP_firstdiv">
		<div class="travelP_seconddiv">
			<div>
				<span class="travelP_placespan">여행장소 이름 </span>
			</div>

			<div class="travelP_thirddiv">
				<span class="travelP_placeaddr">지역명 + 주소</span><br>
				<span class="travelP_description">열글자 설명</span>
			</div>
		</div>

		<div class="travelP_imgdiv">
				<div>
				<img src="/resources/image/heart.png">
				<img src="/resources/image/share.png">
				 <span style="font-size:12px;">조회수 300</span>
				</div>
			<hr>


			<div class="travelP_travelinfo">
				<a>사진보기</a><a>상세정보</a><a>주차정보</a><a>여행톡</a>
			</div>
			<hr>
		</div>

		<div class="travelP_travelimg">
			<div>사진</div>
		</div>

		<div style="padding-top: 40px;">
			<div>
				<span class="travelP_detailinfo">상세정보</span>
				<hr>
			</div>

			<div class="travelP_detailinfo2">
				<span>상세정보란</span>
			</div>

			<div>
				<input type="text" value="#해시태그" class="travelP_input">
				<input type="text" value="#지역" class="travelP_input2">
				<input type="text" value="#친구와함께" class="travelP_input3">
			</div>
		</div>

		<div style="margin-top: 100px; ">
			<h4>여행톡</h4>
			<div class="travelP_reply-content">
				<input type="text" placeholder="로그인 후 댓글을 남겨주세요.">
				<div style="text-align:right;">
				<button class="travelP_button">등록</button>
				</div>
			</div>
		</div>
		</div>
	</main>
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>