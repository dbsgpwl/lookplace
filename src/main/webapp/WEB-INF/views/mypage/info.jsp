<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/infopage.css" rel="stylesheet" type="text/css">
<body>	
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
	<main>
	<div class="info-main">
		<div class="info-aside-menu">
			<div class="info-aside"> 
				<div class="info-icon">
					<i class="fa-solid fa-circle-user"></i>
				</div>
				<div class="info-title"><h2>Info</h2></div>
			</div>
			<div class="info-menu">
				<p style="border-left:2px solid pink;"><a href="/mypage/info">나의 정보</a></p>
				<p><a href="/mypage/wishlist?nickname=${member.nickname }">찜한 여행</a></p>
			</div>
		</div>
		<div class="info-main-area">
			<div class="info-main-title">
				<div><h3>나의 정보</h3></div>
			</div>
			<form>			
			<div id="infoBox">
				<div class="info-table-area">
					<table class="table border border-1 info-table">
						<tr>
							<td>회원코드</td>
							<td>	
							<c:if test="${member!=null}">					
							<span>${member.membercode}</span>
							</c:if>	
							</td>
						</tr>
						<tr>
							<td>닉네임 </td>
							<td>
							<span>${member.nickname}</span>
							</td>
						</tr>
						<tr>
							<td>성명 </td>
							<td>
							<c:if test="${member!=null}">
							<span>${member.name}</span>
							</c:if>	
							</td>
						</tr>
						<tr>
							<td>이메일 </td>
							<td>
							<c:if test="${member!=null}">
							<span>${member.email}</span>
							</c:if>	
							</td>
						</tr>
						<tr>
							<td>비밀번호 </td>
							<td>
							<c:if test="${member!=null}">
							<span>${member.password}</span>
							</c:if>	
							</td>
						</tr>
						<tr>
							<td>주소 </td>
							<td>
							<c:if test="${member!=null}">
							<span>${member.address}</span>
							</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
				<div class="info-write-area" >
			 <button type="button" class="btn btn-outline-secondary" onclick="location.href='/mypage/update'">수정</button>
			 <button type="button" class="btn btn-outline-secondary" onclick="location.href='/mypage/leavemember'">회원탈퇴</button>			 
			</div>
			</form>	
		</div>		
	</div>
	</main>
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
<script>
/* 정보수정 */ 
 $(document).ready(function() {
            $("#UpdateBtn").click(function() {
         			$("#update_form").attr("action", "/mypage/info");
                    $("#update_form").submit();
     });            
});



</script>







</html>