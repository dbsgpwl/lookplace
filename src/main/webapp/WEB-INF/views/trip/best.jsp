<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기</title>
<link href="/resources/css/travelplace.css" rel="stylesheet" type="text/css">
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
</head>
<body>
	<%@page import="java.util.*, com.look.model.*"%>
	<%
	ArrayList<TripDTO> list = (ArrayList<TripDTO>) request.getAttribute("list");
	%>
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
	
	
	<main>
		<div class="all">
			<div>
				<h1><b>인기</b></h1>
				<hr>
				<div class = "hashtag">
					<a href = "/trip/entire">#전체</a>
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
				<table id = "p_location">
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
				<h3 class = "p_title">9월의 SNS인기 여행지 TOP 10</h3>
				<div class = "p_firstline">
					<c:forEach items="${list }" var = "best" begin="0" end="4">
						<div class = "p_top">
							<img src = '/resources/image/<c:out value = "${best.course }"></c:out>'>
							<h3><c:out value = "${best.place }"></c:out></h3>
						</div>
					</c:forEach>
				</div>
				
				<div class = "p_firstline">
					<c:forEach items="${list }" var = "best" begin="5" end="9">
						<div class = "p_top">
							<img src = '/resources/image/<c:out value = "${best.course }"></c:out>'>
							<h3><c:out value = "${best.place }"></c:out></h3>
						</div>
					</c:forEach>
				</div>
			</div>
			<hr>	
			<div>
				<h3 class = "p_title">가을의 인기 여행지 TOP 10</h3>
				<div class = "p_firstline">
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
				<div class = "p_firstline">
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
			<hr>
			<div>
				<h3 class = "p_title">이번달 인기 여행지 TOP 10</h3>
				<div class = "p_firstline">
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
				<div class = "p_firstline">
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
			<div>
				<h3 class = "p_title">인기 여행 기사 TOP 10</h3>
				
				
				
			</div>
		</div>
	</main>
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>