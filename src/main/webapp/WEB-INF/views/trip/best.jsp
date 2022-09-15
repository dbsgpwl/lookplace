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
			<form action = "/trip/entire" method = "get">
				<h1><b>인기</b></h1>
				<hr>
				<div class = "hashtag">
					<input type="submit" name ="keyword" value ="전체">
					<a href = "#">#여행지</a>
					<a href = "#">#관광지</a>
					<a href = "#">#체험</a>
					<a href = "#">#자연</a>
					<a href = "#">#실내여행지</a>
					<a href = "#">#가을</a>
					<a href = "#">#단풍</a>
				</div>
			
			<div>
				<h3><b>지역</b></h3>
				<table id = "p_location">
					<tr>
						<td><input type="submit" name ="keyword" value ="전체"></td>
						<td><input type="submit" name ="keyword" value ="서울"></td>
						<td><input type="submit" name ="keyword" value ="대전"></td>
						<td><input type="submit" name ="keyword" value ="대구"></td>
						<td><input type="submit" name ="keyword" value ="광주"></td>
						<td><input type="submit" name ="keyword" value ="부산"></td>
						<td><input type="submit" name ="keyword" value ="울산"></td>
						<td><input type="submit" name ="keyword" value ="세종"></td>
						<td><input type="submit" name ="keyword" value ="경기"></td>
					</tr>
					<tr>
						<td><input type="submit" name ="keyword" value ="인천"></td>
						<td><input type="submit" name ="keyword" value ="강원"></td>
						<td><input type="submit" name ="keyword" value ="충북"></td>
						<td><input type="submit" name ="keyword" value ="충남"></td>
						<td><input type="submit" name ="keyword" value ="경북"></td>
						<td><input type="submit" name ="keyword" value ="경남"></td>
						<td><input type="submit" name ="keyword" value ="전북"></td>
						<td><input type="submit" name ="keyword" value ="전남"></td>
						<td><input type="submit" name ="keyword" value ="제주"></td>
					</tr>
				</table>
			</div>
			</form>
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