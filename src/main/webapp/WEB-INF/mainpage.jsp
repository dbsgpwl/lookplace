<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>
<jsp:include page="../resources/includes/link.jsp"></jsp:include>
<link href="../resources/css/mainpage.css" rel="stylesheet" type="text/css">
<body>


	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	<jsp:include page="/resources/includes/nav.jsp"></jsp:include>
	
	<main style="height:100%; overflow-x:hidden;">
		<div class="firstSection">
			<div style="display: flex; text-align: center;">
				<div class="firstInLeft test_obj">1</div>
				<div class="firstRight test_obj2">
					<h1>관광지 이름</h1>
				</div>
			</div>
			<div style="display: flex; text-align: center;">
				<div class="firstInLeft test_obj">1</div>
				<div class="firstRight test_obj2">
					<h1>관광지 이름</h1>
				</div>
			</div>
			<div style="display: flex; text-align: center;">
				<div class="firstInLeft test_obj">1</div>
				<div class="firstRight test_obj2">
					<h1>관광지 이름</h1>
				</div>
			</div>
		</div>
			
		<section class="secondSection">
			<div class="secondLeft">
				1
			</div>
			<div class="secondRight">
				<div class="secondInSection">
					<div class="secondInSectionTop">
						<img src="resources/image/대구.jpeg">
					</div>
					<div class="secondInSectionBottom">
						2
					</div>
				</div>
				<div class="secondInSection">
					<div class="secondInSectionTop">
						<img src="resources/image/대구.jpeg">
					</div>
					<div class="secondInSectionBottom">
						2
					</div>
				</div>
				<div class="secondInSection">
					<div class="secondInSectionTop">
						<img src="resources/image/대구.jpeg">
					</div>
					<div class="secondInSectionBottom">
						2
					</div>
				</div>
				<div class="secondInSection">
					<div class="secondInSectionTop">
						<img src="resources/image/대구.jpeg">
					</div>
					<div class="secondInSectionBottom">
						2
					</div>
				</div>
			</div>	
		</section>
	</main>
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>