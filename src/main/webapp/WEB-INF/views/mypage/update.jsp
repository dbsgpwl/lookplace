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
				<p><a href="/mypage/wishlist">찜한 여행</a></p>
			</div>
		</div>
		<div class="info-main-area">
			<div class="info-main-title">
				<div><h3>나의 정보</h3></div>

			</div>
			<form method="post" id="update_form" class="UpdateForm">			
			<div id="infoBox">
				<div class="info-table-area">
					<table class="table border border-1 info-table">
						<tr>
							<td>회원코드</td>
							<td>					
							<input type=text class="form-control" value="${member.membercode}" readonly>	
							</td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td><input type=text class="form-control" name="nickname">
							</td>
						</tr>
						<tr>
							<td>성명</td>
							<td>
							<input type=text class="form-control" value="${member.name}" readonly>
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
							<input type=text class="form-control" value="${member.email}" readonly name="email">
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>
							<input type=password  class="form-control" name="password">
							</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>
							<input type=text  class="form-control" name="address">
							</td>
						</tr>
					</table>
				</div>
			</div>
				<div class="info-write-area" >
			 <button type="button" class="UpdateBtn btn btn-outline-secondary">적용하기</button>		 
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
            $(".UpdateBtn").click(function() {
         			$("#update_form").attr("action", "/mypage/update");
                    $("#update_form").submit();
                    alert("수정되었습니다. 재로그인 해주세요");
                });
            });
            


</script>
</html>