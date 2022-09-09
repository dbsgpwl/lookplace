<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하트 페이지</title>
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
				<p ><a href="/mypage/info">나의 정보</a></p>
				<p style="border-left:2px solid pink;"><a href="/mypage/wishlist">찜한 여행</a></p>
			</div>
		</div>
		
		<div class="info-main-area">
			<div class="info-main-title">
				<div style="display:flex; align-items:center; ">
					<h3 style="height:30px;">찜한 여행</h3>
					<i style="height:30px; line-height:20px; padding-left: 10px; font-size:2rem; color:rgb(255, 56, 142);" class="fa-solid fa-heart"></i>
				</div>
				

			</div>
			
			<div class="wish-list">
				<div class="wish-list-article">
					<div class="border border-1 wish-list-card" >
					  <img src="/resources/image/대구.jpeg">
					  <div class="wish-list-card-title">
					    <p style="font-size:1rem;"><a href="/trip/travel-p">#지역명 #장소</a></p>
					    <p><i style="font-size:1.9rem; color:rgb(255, 56, 142);" class="fa-solid fa-heart"></i></p>
					  </div>
					</div>
				</div>
				<div class="wish-list-article">
					<div class="border border-1 wish-list-card" >
					  <img src="/resources/image/대구.jpeg">
					  <div class="wish-list-card-title">
					    <p style="font-size:1rem;"><a href="/trip/travel-p">#지역명 #장소</a></p>
					    <p><i style="font-size:1.9rem; color:rgb(255, 56, 142);" class="fa-solid fa-heart"></i></p>
					  </div>
					</div>
				</div>
				<div class="wish-list-article">
					<div class="border border-1 wish-list-card" >
					  <img src="/resources/image/대구.jpeg">
					  <div class="wish-list-card-title">
					    <p style="font-size:1rem;"><a href="/trip/travel-p">#지역명 #장소</a></p>
					    <p><i style="font-size:1.9rem; color:rgb(255, 56, 142);" class="fa-solid fa-heart"></i></p>
					  </div>
					</div>
				</div>
			</div>
			
			
		</div>
		
		
		
		
	</div>
	</main>
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>