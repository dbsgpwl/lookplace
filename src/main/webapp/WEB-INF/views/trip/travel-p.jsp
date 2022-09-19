<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지상세</title>
<link href="/resources/css/travel-p.css" rel="stylesheet" type="text/css">
</head>

<body>
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	<!-- section 안에 작성 -->
	<main>
	
	<div class="travelP_firstdiv">
		<div class="travelP_seconddiv">
			<div>
				<span class="travelP_placespan"><c:out value = "${detail.place }"></c:out></span>
			</div>

			<div class="travelP_thirddiv">
				<span class="travelP_placeaddr"><c:out value = "${detail.local }" /> | <c:out value = "${detail.address }" /></span><br>
			</div>
		</div>

		<div class="travelP_imgdiv">
				<div>
				<i class="fa-regular fa-heart e_h"></i>&nbsp;
				<i class="fa-regular fa-share-from-square"></i>&nbsp;
				 <span style="font-size:12px;">조회수 <c:out value="${detail.count }"></c:out></span>	
				</div>
			<hr>


			<div class="travelP_travelinfo">
				<a>사진보기</a><a>상세정보</a><a>주차정보</a><a>여행톡</a>
			</div>
			<hr>
		</div>

		<div class="travelP_travelimg">
			<img src="/resources/image/<c:out value = "${detail.course }"></c:out>">
		</div>

		<div style="padding-top: 40px;">
			<div>
				<span class="travelP_detailinfo">상세정보</span>
				<hr>
			</div>

			<div class="travelP_detailinfo2">
				<span>상세정보란</span>
			</div>

			<div>
				<input type="text" value="#해시태그" class="travelP_input">
				<input type="text" value="#지역" class="travelP_input2">
				<input type="text" value="#친구와함께" class="travelP_input3">
			</div>
		</div>

		<div style="margin-top: 100px; ">

			<h4>여행톡</h4>
			<div class="travelP_reply">
				<form action="/trip/travel-p" method = "post">
					<input type="text" placeholder="로그인 후 댓글을 남겨주세요." name  = "content">
					<input type ="hidden" name = "imgno" value = '<c:out value = "${re.imgno }" />'>
					<input type ="hidden" name = "nickname" value = '<c:out value = "${member.nickname }" />'>
					<div style="text-align:right;">
						<button class="travelP_button">등록</button>
					</div>
				
				
				<c:forEach items="${reply }" var = "reply">
				<div class = "travelP_reply_content">
					<div style = "display: flex; justify-content: space-between; margin-bottom: 10px;">
						<span><c:out value="${reply.nickname }"></c:out></span>
						<span><c:out value="${reply.regdate }"></c:out></span>
					</div>
					<p><c:out value="${reply.content }"></c:out></p>
				</div>
				</c:forEach>
				</form>
			</div>
		</div>
		</div>
	</main>
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>