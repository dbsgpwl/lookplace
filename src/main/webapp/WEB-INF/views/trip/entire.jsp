<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/resources/css/travelplace.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	<%@page import="java.util.*,com.look.model.*"%>
	<%
	ArrayList<TripDTO> trip = (ArrayList<TripDTO>) request.getAttribute("trip");
	%>
	<!-- main 안에 작성 -->
	<main>
		<div class= "e_all all">
			<div style = "width: 50%;">
				<h1><c:out value = "${key }"></c:out></h1>
				<hr>
				<form action = "/trip/entire" method="post" class = "e_listorder">
					<input type="submit" name ="type" value ="최신순">
					<span>|</span>
					<input type="submit" name ="type" value ="인기순">
					<hr>
				</form>
				
				<!-- 리스트 목록 -->
				<c:forEach items="${trip }" var = "all">
					<div class = "e_card">
						<div class= "e_list" onclick= "location.href = '/trip/travel-p?imgno=${all.imgno }'">
							<img class= "e_img" src='/resources/image/<c:out value = "${all.course }"></c:out>'>
							<div class = "e_explain">
								<span><c:out value = '${all.place }'></c:out></span>
								<span><c:out value = "${all.local }"></c:out></span>
								<span>#해시태그</span>
							</div>
						</div>
						<form method = "post">
							<div class = "e_heart">
								<input type="hidden" name="keyword" value="${key }">
								<input type = "hidden" name ="nickname" value = "${member.nickname }">
								<button onclick = "javascript: form.action='/trip/heart';"name = "imgno" value ="${all.imgno }"><i class="fa-regular fa-heart e_h"></i></button>
							</div>
						</form>
					</div>
					<hr>
				</c:forEach>
			 <div class="board-pagenation" >
				<div class="pageInfo_wrap" >
        			<div class="pageInfo_area">
	       				<ul class="pageInfo" id="pageInfo">
			           		<!-- 이전페이지 버튼 -->
			                <c:if test="${pageMaker.prev}">
			                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}"><i class="fas fa-chevron-left"></i></a></li>
			                </c:if> 	
			                  <!-- 각 번호 페이지 버튼 -->
			                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
			                </c:forEach>
			                <!-- 다음페이지 버튼 -->
			                <c:if test="${pageMaker.next}">
			                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }"><i class="fas fa-chevron-right"></i></a></li>
			                </c:if>    
		 				</ul>
	        		</div>
   	 			</div>
			</div>
			</div>
			
			<!-- 지역의 관련된 리스트 출력  -->
			<form action="/trip/entire" method = "get" style = "width: 40%; height: 600px; background-color: lightgray; margin-top:60px;">
				<div style = "width: 60%;margin:100px auto 0 auto;">
					<hr>
					<div class= "e_location">
						<input type="submit" name ="keyword" value ="전체">
						<input type="submit" name ="keyword" value ="서울">
						<input type="submit" name ="keyword" value ="대구" id = "name" onchange='printName()'>
						<input type="submit" name ="keyword" value ="부산">
					</div>
					<div class= "e_location">
						<input type="submit" name ="keyword" value ="인천">
						<input type="submit" name ="keyword" value ="울산">
						<input type="submit" name ="keyword" value ="광주">
						<input type="submit" name ="keyword" value ="대전">
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
			</form>
			<form id = "moveForm" method ="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	        	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">   
	        	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
        	</form>
		</div>
	</main>
	<script type="text/javascript">
		let moveForm = $("#moveForm");
		 
	    $(".move").on("click", function(e){
	        e.preventDefault();	//클릭한 <a>태그 기능 정지
	        
	        //form 태그 내부에 bno 값을 저장하는 <input>태그 생성
	        moveForm.append("<input type='hidden' name='imgno' value='"+ $(this).attr("href")+ "'>");
	        //<form>태그 action 속성 추가
	        moveForm.attr("action", "/trip/entrie");
	        //<form태그 내부 데이터 서버 전송
	        moveForm.submit();
	    });
    
	
		 $(".pageInfo a").on("click", function(e){
			 
		        e.preventDefault();
		        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		        moveForm.attr("action", "/trip/entire");
		        moveForm.submit();
		        
		    });
	</script>
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>

</body>
</html>