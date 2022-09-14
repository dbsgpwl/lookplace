<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/travelplace.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	<%@page import="java.util.*, com.look.model.*"%>
	<%
	ArrayList<TripDTO> trip = (ArrayList<TripDTO>) request.getAttribute("trip");
	%>
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
				<c:forEach items="${list }" var = "all">
					<div class = "e_card">
						<div class= "e_list">
							<img src='/resources/image/<c:out value = "${all.course }"></c:out>'>
							<div class = "e_explain">
								<span><c:out value = '${all.place }'></c:out></span>
								<span>지역</span>
								<span>#해시태그</span>
							</div>
						</div>
						<div class = "e_heart">
							<i class="fa-regular fa-heart"></i>
						</div>
					</div>
					<hr>
				</c:forEach>
			</div>
			<form action="/trip/area" method = "get">
			<div style = "width: 40%; height: 600px; background-color: lightgray; margin-top:60px;">
					<div style = "width: 60%;margin:100px auto 0 auto;">
						<hr>
						<div class= "e_location">
							<a href = "#">#전체</a>
							<a href = "#">#서울</a>
							<input type="submit" name ="keyword" value ="대구">
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
			</form>
			<form id ="actionForm" action ="/board/list" method ="get">
					<input type = "hidden" name ="pageNum" value = "${pageMaker.cri.pageNum}">
					<input type = "hidden" name ="amount" value = "${pageMaker.cri.amount}">
					<input type = "hidden" name ="keyword" value = "${pageMaker.cri.keyword}">
					<input type = "hidden" name ="type" value = "${pageMaker.cri.type}">
				</form>
		</div>
	</main>
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>

</body>
</html>