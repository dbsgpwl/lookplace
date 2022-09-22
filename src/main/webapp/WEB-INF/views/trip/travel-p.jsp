<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지상세</title>
<link href="/resources/css/travel-p.css" rel="stylesheet"
	type="text/css">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 

</head>

<body>
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>

	<!-- section 안에 작성 -->
	<main>

		<div class="travelP_firstdiv">
			<div class="travelP_seconddiv">
				<div>
					<span class="travelP_placespan"><c:out
							value="${detail.place }"></c:out></span>
				</div>

				<div class="travelP_thirddiv">
					<span class="travelP_placeaddr"><c:out
							value="${detail.local }" /> | <c:out value="${detail.address }" /></span><br>
				</div>
			</div>

			<div class="travelP_imgdiv">
				<div>
					<i class="fa-regular fa-heart e_h"></i>&nbsp; <i
						class="fa-regular fa-share-from-square"></i>&nbsp; <span
						style="font-size: 12px;">조회수 <c:out
							value="${detail.count }"></c:out></span>
				</div>
				<hr>


				<div class="travelP_travelinfo">
					<a>사진보기</a><a>상세정보</a><a>주차정보</a><a>여행톡</a>
				</div>
				<hr>
			</div>

			<div class="travelP_travelimg">
				<img
					src="/resources/image/<c:out value = "${detail.course }"></c:out>">
			</div>

			<div style="padding-top: 40px;">
				<div>
					<span class="travelP_detailinfo">상세정보</span>
				</div>

				<div class="travelP_detailinfo2">
					<span>상세정보란</span>
				</div>

				<div>
					<input type="text" value="#해시태그" class="travelP_input"> <input
						type="text" value="#지역" class="travelP_input2"> <input
						type="text" value="#친구와함께" class="travelP_input3">
				</div>
			</div>

			<div style="margin-top: 100px;">

				<h4>여행톡</h4>
				<form  method="post" name = "form">
					<div class="travelP_reply">
						<input type="text" placeholder="로그인 후 댓글을 남겨주세요." name="content">
						<input type="hidden" name="imgno"
							value='<c:out value = "${re.imgno }" />'> <input
							type="hidden" name="nickname"
							value='<c:out value = "${member.nickname }" />'>
							<c:if test="${member==null}">
								<div style = "margin:10px 0;">									
									<span><a href="/member/login" style = "color:red;">로그인</a> 후 댓글을 작성해주세요</span>
								</div>	
							 </c:if>
							 <c:if test = "${member!=null }">
								<div style="text-align: right;">
									<button class="travelP_button" onclick = "javascript: form.action='/trip/travel-p';">등록</button>
								</div>
							</c:if>
							

						<c:forEach items="${reply }" var="reply">
							<div class="travelP_reply_content">
								<div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
									<span><c:out value="${reply.nickname }"></c:out></span> 
									<span><fmt:formatDate pattern="yyyy/MM/dd" value="${reply.regdate}"/></span>
								</div>
								<p>
									<c:out value="${reply.content }"></c:out>
									<c:if test ="${member.nickname.equals(reply.nickname) }">
										<button id="modify_btn" type = "button" onclick ="modal()" name = "reno" value = "${reply.reno }">수정</button>
										<button onclick = "javascript: form.action='/trip/delete';"name = "reno" value = "${reply.reno }">삭제</button>
									</c:if>
								</p>
							</div>
						</c:forEach>
					
					</div>
				</form>
				
				<!-- 댓글 수정창 모달 -->
			</div>
		</div>
	</main>
	<style>

</style>
	
	<div id= "modify">
		<form action="/trip/update" method = "post">
			<div id = "modal-input">
				<textarea placeholder="수정할 내용을 입력하세요." style = "width:80%; height: 300px;margin-bottom:30px;" name ="content"></textarea>
				<div class= btnarea>
				<input type="hidden" name="imgno" value='<c:out value = "${re.imgno }" />'>
					<button id ="modify_btn1" name = "reno">수정</button>
					<button onclick = "cancel()" type = "button">취소</button>
				</div>
			</div>
		</form>
	</div>				
	
	<script type="text/javascript">
		function modal(){
			document.getElementById("modify_btn1").value = document.getElementById("modify_btn").value;
			var modify = document.getElementById("modify");
			modify.style.display = "block";
			modify.style.zIndex = "999";
			
		}
		function cancel(){
			var modify = document.getElementById("modify");
			modify.style.display = "none";
			document.getElementById("modify_btn1") = 0;
		}
		
	</script>
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>