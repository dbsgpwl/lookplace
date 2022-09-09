<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/travelplace.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
	<!-- main 안에 작성 -->
	<main>
		<div class= "e_all all">
			<div style = "width: 50%;">
				<h1>#전체</h1>
				<hr>
				<div class = "e_listorder">
					<a href = "#">최신순</a>
					<span>|</span>
					<a href = "#">인기순</a>
					<hr>
				</div>
				
				<!-- 리스트 목록 -->
				<div class = "e_card">
					<div class= "e_list">
						<img alt="" src="/resources/image/대구.jpeg">
						<div class = "e_explain">
							<span>여행장소</span>
							<span>지역</span>
							<span>#해시태그</span>
						</div>
					</div>
					<div class = "e_heart">
						<i class="fa-regular fa-heart"></i>
					</div>
				</div>
				<hr>
				
				<div class = "e_card">
					<div class= "e_list">
						<img alt="" src="/resources/image/대구.jpeg">
						<div class = "e_explain">
							<span>여행장소</span>
							<span>지역</span>
							<span>#해시태그</span>
						</div>
					</div>
					<div class = "e_heart">
						<i class="fa-regular fa-heart"></i>
					</div>
				</div>
				<hr>
				
				<div class = "e_card">
					<div class= "e_list">
						<img alt="" src="/resources/image/대구.jpeg">
						<div class = "e_explain">
							<span>여행장소</span>
							<span>지역</span>
							<span>#해시태그</span>
						</div>
					</div>
					<div class = "e_heart">
						<i class="fa-regular fa-heart"></i>
					</div>
				</div>
				<hr>
				
				<div class = "e_card">
					<div class= "e_list">
						<img alt="" src="/resources/image/대구.jpeg">
						<div class = "e_explain">
							<span>여행장소</span>
							<span>지역</span>
							<span>#해시태그</span>
						</div>
					</div>
					<div class = "e_heart">
						<i class="fa-regular fa-heart"></i>
					</div>
				</div>
				<hr>
				
			</div>
			<div style = "width: 40%; height: 600px; background-color: lightgray; margin-top:60px;">
					<div style = "width: 60%;margin:100px auto 0 auto;">
						<hr>
						<div class= "e_location">
							<a href = "#">#전체</a>
							<a href = "#">#서울</a>
							<a href = "#">#대구</a>
							<a href = "#">#부산</a>
						</div>
						<div class= "e_location">
							<a href = "#">#인천</a>
							<a href = "#">#울산</a>
							<a href = "#">#광주</a>
							<a href = "#">#대전</a>
						</div>
						<div class= "e_location">
							<a href = "#">#전체</a>
							<a href = "#">#서울</a>
							<a href = "#">#대구</a>
							<a href = "#">#부산</a>
						</div>
						<div class= "e_location">
							<a href = "#">#전체</a>
							<a href = "#">#서울</a>
							<a href = "#">#대구</a>
							<a href = "#">#부산</a>
						</div>
						<hr>
						
						<div class= "e_location">
							<a href = "#">#해시</a>
							<a href = "#">#태그</a>
							<a href = "#">#임둥</a>
						</div>
						<div class= "e_location">
							<a href = "#">#해시</a>
							<a href = "#">#태그</a>
							<a href = "#">#임둥</a>
						</div>
					</div>
			</div>
		</div>
	</main>
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>

</body>
</html>