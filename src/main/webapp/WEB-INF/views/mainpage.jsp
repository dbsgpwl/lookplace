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
	<section class="secondSection">
		<div class="page-wrapper" style="position:relative;">
	      <h1 style="padding-left:8%;">최신 Top 10</h1>
	      <div class="post-slider">
	        <i class="fas fa-chevron-left prev"></i>  
	        <i class="fas fa-chevron-right next"></i>   
	         <div class="post-wrapper">
	          <div class="post">
	            <img src="resources/image/대구.jpeg" class="slider-image">
	            <div class="post-info">
	              <h4><a href="#">#대구1</a><a href="#">#대구1</a></h4>
	            </div>
	          </div>
	          <div class="post">
	            <img src="resources/image/대구.jpeg" class="slider-image">
	            <div class="post-info">
	              <h4><a href="#">#대구2</a><a href="#">#대구2</a></h4>
	            </div>
	          </div>
	          <div class="post">
	            <img src="resources/image/대구.jpeg" class="slider-image">
	            <div class="post-info">
	              <h4><a href="#">#대구3</a><a href="#">#대구3</a></h4>
	            </div>
	          </div>
	          <div class="post">
	            <img src="resources/image/대구.jpeg" class="slider-image">
	            <div class="post-info">
	              <h4><a href="#">#대구4</a><a href="#">#대구4</a></h4>
	            </div>
	          </div>
	          <div class="post">
	            <img src="resources/image/대구.jpeg" class="slider-image">
	            <div class="post-info">
	              <h4><a href="#">#대구5</a><a href="#">#대구5</a></h4>
	            </div>
	          </div>
	          <div class="post">
	            <img src="resources/image/대구.jpeg" class="slider-image">
	            <div class="post-info">
	              <h4><a href="#">#대구6</a><a href="#">#대구6</a></h4>
	            </div>
	          </div>
	          <div class="post">
	            <img src="resources/image/대구.jpeg" class="slider-image">
	            <div class="post-info">
	              <h4><a href="#">#대구7</a><a href="#">#대구7</a></h4>
	            </div>
	          </div>
	          <div class="post">
	            <img src="resources/image/대구.jpeg" class="slider-image">
	            <div class="post-info">
	              <h4><a href="#">#대구8</a><a href="#">#대구8</a></h4>
	            </div>
	          </div>
	          <div class="post">
	            <img src="resources/image/대구.jpeg" class="slider-image">
	            <div class="post-info">
	              <h4><a href="#">#대구9</a><a href="#">#대구9</a></h4>
	            </div>
	          </div>
	          <div class="post">
	            <img src="resources/image/대구.jpeg" class="slider-image">
	            <div class="post-info">
	              <h4><a href="#">#대구10</a><a href="#">#대구10</a></h4>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	</section>
</main>


	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
<script>
$('.post-wrapper').slick({
	  slidesToShow: 5,
	  slidesToScroll: 1,
	  autoplay: true,
	  autoplaySpeed: 2000,
	  nextArrow:$('.next'),
	  prevArrow:$('.prev'),
	});
</script>
</html>