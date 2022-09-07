<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/travelplace.css" rel="stylesheet" type="text/css">
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
	<!-- section 안에 작성 -->
	<section style="height:100%; margin-top:100px;">
		<div>
			<h1><b>코스</b></h1>
			<hr>
			<div class = "hashtag">
				<a href = "#">#전체</a>
				<a href = "#">#여행지</a>
				<a href = "#">#관광지</a>
				<a href = "#">#체험</a>
				<a href = "#">#자연</a>
				<a href = "#">#실내여행지</a>
				<a href = "#">#가을</a>
				<a href = "#">#단풍</a>
			</div>
		</div>
		

			<h3 class = "p_title">여행코스</h3>
			<div class = "C_trable">
				<div>
					<h5 class="C_course">대구 여행</h5>
					<div>
						<i class="fa-light fa-location-dot"></i>
						<span>여행장소</span>
						<i class="fa-regular fa-chevron-down"></i>
					</div>
					<div>
						<i class="fa-light fa-location-dot"></i>
						<span>여행장소1</span>
						<i class="fa-regular fa-chevron-down"></i>
					</div>
					<div>
						<i class="fa-light fa-location-dot"></i>
						<span>여행장소2</span>
						<i class="fa-regular fa-chevron-down"></i>
					</div>
					<div>
						<i class="fa-light fa-location-dot"></i>
						<span>여행장소3</span>
						<i class="fa-regular fa-chevron-down"></i>
					</div>
				</div>
				<div>
					<h5 style = "background-image: url(/resources/image/대구.jpeg); width:33%; height: 100px; line-height: 100px; text-align: center;" >대구 여행</h5>
					<div>
						<i class="fa-light fa-location-dot"></i>
						<span>여행장소</span>
						<i class="fa-regular fa-chevron-down"></i>
					</div>
					<div>
						<i class="fa-light fa-location-dot"></i>
						<span>여행장소1</span>
						<i class="fa-regular fa-chevron-down"></i>
					</div>
					<div>
						<i class="fa-light fa-location-dot"></i>
						<span>여행장소2</span>
						<i class="fa-regular fa-chevron-down"></i>
					</div>
					<div>
						<i class="fa-light fa-location-dot"></i>
						<span>여행장소3</span>
						<i class="fa-regular fa-chevron-down"></i>
					</div>
				</div>
				<div>
					<h5 style = "background-image: url(/resources/image/대구.jpeg); width:33%; height: 100px; line-height: 100px; text-align: center;" >대구 여행</h5>
					<div>
						<i class="fa-light fa-location-dot"></i>
						<span>여행장소</span>
						<i class="fa-regular fa-chevron-down"></i>
					</div>
					<div>
						<i class="fa-light fa-location-dot"></i>
						<span>여행장소1</span>
						<i class="fa-regular fa-chevron-down"></i>
					</div>
					<div>
						<i class="fa-light fa-location-dot"></i>
						<span>여행장소2</span>
						<i class="fa-regular fa-chevron-down"></i>
					</div>
					<div>
						<i class="fa-light fa-location-dot"></i>
						<span>여행장소3</span>
						<i class="fa-regular fa-chevron-down"></i>
					</div>
				</div>
			</div>

	
		
	</section>
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>