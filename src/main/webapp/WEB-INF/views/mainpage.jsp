<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>
<jsp:include page="../../resources/includes/link.jsp"></jsp:include>
<link href="../resources/css/mainpage.css" rel="stylesheet"
	type="text/css">
<body>


	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	<jsp:include page="/resources/includes/nav.jsp"></jsp:include>

	
	


	<main class = "m_main">
		<div class="firstSection">
			<c:forEach items="${get }" var="get" begin ="0" end = "2" varStatus="status">
			<c:if test="${status.index == 1}">
				<div class= "m_img">
					<div class="firstRight test_obj2">
						<h1><c:out value = "${get.place }"></c:out></h1>
						<button onclick= "location.href = '/trip/travel-p?imgno=${get.imgno }'">상세 페이지</button>
					</div>
					<div class="firstInLeft test_obj">
						<img alt="" src= "/resources/image/<c:out value = "${get.course }"></c:out>">
					</div>
				</div>
			</c:if>
			<c:if test="${status.index != 1}">
				<div class= "m_img">
					<div class="firstInLeft test_obj">
						<img alt="" src= "/resources/image/<c:out value = "${get.course }"></c:out>">
					</div>
					<div class="firstRight test_obj2">
						<h1><c:out value = "${get.place }"></c:out></h1>
						<button onclick= "location.href = '/trip/travel-p?imgno=${get.imgno }'">상세 페이지</button>
					</div>
				</div>
			</c:if>
				
			</c:forEach>
		</div>



		<!-- 슬릭 -->
		<section class="secondSection">
			<div class="secondLeft">1</div>
			<div class="secondRight">
				<div class="secondInSection">
					<div class="secondInSectionTop">
						<img src="resources/image/대구.jpeg">
					</div>
					<div class="secondInSectionBottom">2</div>
				</div>
				<div class="secondInSection">
					<div class="secondInSectionTop">
						<img src="resources/image/대구.jpeg">
					</div>
					<div class="secondInSectionBottom">2</div>
				</div>
				<div class="secondInSection">
					<div class="secondInSectionTop">
						<img src="resources/image/대구.jpeg">
					</div>
					<div class="secondInSectionBottom">2</div>
				</div>
				<div class="secondInSection">
					<div class="secondInSectionTop">
						<img src="resources/image/대구.jpeg">
					</div>
					<div class="secondInSectionBottom">2</div>
				</div>
			</div>
		</section>
	</main>


	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>