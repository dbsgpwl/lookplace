<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#p_firstline{
		display: flex;
		justify-content: space-between;
	}
	#p_location{
		width: 80%;
		text-align: center;
		margin: 0 auto;
	}
	#p_location tr{
		height: 60px;
	}
	#hashtag{
		display: flex;
		justify-content: space-around;
		padding-top: 30px;
	}
	
	.p_top{
		border : 1px solid black;
		width:150px;
		height:150px;
		background-color : gray;
		text-align: center;
	}
</style>
</head>
<body>


	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
	
	
	
	<section style="height:100%;">
		<div>
			<h1><b>인기</b></h1>
			<hr>
			<div id = "hashtag">
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
		<div>
			<h3><b>지역</b></h3>
			<table id = "p_location" border = "1">
				<tr>
					<td>전체</td>
					<td>서울</td>
					<td>대전</td>
					<td>대구</td>
					<td>광주</td>
					<td>부산</td>
					<td>울산</td>
					<td>세종</td>
					<td>경기</td>
				</tr>
				<tr>
					<td>인천</td>
					<td>강원</td>
					<td>충북</td>
					<td>충남</td>
					<td>경북</td>
					<td>경남</td>
					<td>전북</td>
					<td>전남</td>
					<td>제주</td>
				</tr>
			</table>
		</div>
		<div>
			<h3>9월의 SNS인기 여행지 TOP 10</h3>
			<div id = "p_firstline">
				<div class = "p_top">
					<img>
					<h3>여행지1</h3>
				</div>
				<div class = "p_top">
					<img>
					<h3>여행지2</h3>
				</div>
				<div class = "p_top">
					<img>
					<h3>여행지3</h3>
				</div>
				<div class = "p_top">
					<img>
					<h3>여행지4</h3>
				</div>
				<div class = "p_top">
					<img>
					<h3>여행지5</h3>
				</div>
			</div>
			<div id = "p_firstline">
				<div class = "p_top">
					<img>
					<h3>여행지1</h3>
				</div>
				<div class = "p_top">
					<img>
					<h3>여행지2</h3>
				</div>
				<div class = "p_top">
					<img>
					<h3>여행지3</h3>
				</div>
				<div class = "p_top">
					<img>
					<h3>여행지4</h3>
				</div>
				<div class = "p_top">
					<img>
					<h3>여행지5</h3>
				</div>
			</div>
			<div id = "p_firstline">
				<div class = "p_top">
					<img>
					<h3>여행지1</h3>
				</div>
				<div class = "p_top">
					<img>
					<h3>여행지2</h3>
				</div>
				<div class = "p_top">
					<img>
					<h3>여행지3</h3>
				</div>
				<div class = "p_top">
					<img>
					<h3>여행지4</h3>
				</div>
				<div class = "p_top">
					<img>
					<h3>여행지5</h3>
				</div>
			</div>
		</div>
	</section>
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>