<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/infopage.css" rel="stylesheet" type="text/css">
<body>

	
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
	<main>
	<form id="delete_form" method="post" class="DeleteForm">
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
				<div><h3>회원탈퇴</h3></div>
			</div>
			<div class="info-table-area">
				<table class="table border border-1 info-table">
					<tr>
						<td>이메일</td>
						<td><input type=email id="email" class="form-control" placeholder="E-mail 입력" name="email" value="${member.email}" readonly></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type=text  id="password" class="form-control" placeholder="password 입력" name="password"></td>
					</tr>											
				</table>
			</div>
			<div class="info-write-area" >
			 <button type="button" class="DeleteBtn btn btn-outline-secondary">탈퇴</button>
			 <button type="button" class="btn btn-outline-secondary" onclick="location.href='/'">취소</button>			 
			</div>	
			<div>
				<c:if test="${msg==false}">
			<span style="color: red; font-size:13px;">비밀번호가 맞지 않습니다.</span>
				</c:if>
	</div>		
		</div>		
	</div>
	</form>
	</main>	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
<script>
$(document).ready(function(){
	$("#submit").on("click", function(){
		if($("#password").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		}
	});
})

/* 회원탈퇴 */ 
$(document).ready(function() {
            $(".DeleteBtn").click(function() {
         			$("#delete_form").attr("action", "/mypage/leavemember");
                    $("#delete_form").submit();
                });
            });
            

</script>
<script>

</script>
</html>