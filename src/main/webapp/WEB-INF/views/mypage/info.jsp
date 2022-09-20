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
			<!-- 사용자 비밀번호 확인 -->
			
			<div id="pwdConfirm" style="text-align:center; margin-bottom:5vh">
				<h1 style="margin-bottom:5vh">비밀번호 입력</h1>
				<label for=html>비밀번호 :</label> <input id="userPwd" type="password">
			</div>
			<!--  -->
			
			<div id="infoBox" style="display:none">
				<div class="info-table-area">
					<table class="table border border-1 info-table">
						<tr>
							<td>회원코드</td>
							<td>	
							<c:if test="${member!=null}">					
							<input type=text class="form-control" value="${member.membercode}" readonly>
							</c:if>	
							</td>
						</tr>
						<tr>
							<td>닉네임 *</td>
							<td><input type=text class="form-control" value="${member.nickname}">
							</td>
						</tr>
						<tr>
							<td>성명 *</td>
							<td>
							<c:if test="${member!=null}">
							<input type=text class="form-control" value="${member.name}">
							</c:if>	
							</td>
						</tr>
						<tr>
							<td>이메일 *</td>
							<td>
							<c:if test="${member!=null}">
							<input type=text class="form-control" value="${member.email}" readonly>
							</c:if>	
							</td>
						</tr>
						<tr>
							<td>비밀번호 *</td>
							<td>
							<c:if test="${member!=null}">
							<input type=text  class="form-control" value="${member.password}">
							</c:if>	
							</td>
						</tr>
						<tr>
							<td>주소 *</td>
							<td>
							<c:if test="${member!=null}">
							<input type=text  class="form-control" value="${member.address} ">
							</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
				<div class="info-write-area" >
			 <button type="button" class="btn btn-outline-secondary" onclick="SeeInfo()">수정</button>
			 <button type="button" class="btn btn-outline-secondary" onclick="location.href='/member/leavemember'">회원탈퇴</button>
			 
			</div>
		</div>
		
		
	</div>
	</main>
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
<script>

//사용자 정보 박스
const INFOBOX = document.querySelector('#infoBox');

//사용자 비밀번호 인풋
const PWDCONFIRM = document.querySelector('#pwdConfirm');

const INFOAREA = document.querySelector('.info-write-area');

//수정버튼 눌렀을 때 실행될 함수
const SeeInfo = () => {
	//사용자 비밀번호 db값과 일치한지 검사하는 로직 추가필요
	
	
	INFOBOX.style.display='block'
	PWDCONFIRM.style.display='none';
	INFOAREA.innerHTML='<button type="button" class="btn btn-outline-secondary" onclick="CANCEL()">취소</button>'
	
	//수정 함수 작성 후 추가해야됨
	INFOAREA.innerHTML+='<button type="button" class="btn btn-outline-secondary">수정</button>'
}

const CANCEL = () => {
	INFOBOX.style.display='none'
	PWDCONFIRM.style.display='block';
	INFOAREA.innerHTML = '<button type="button" class="btn btn-outline-secondary" onclick="SeeInfo()">수정</button>'
	INFOAREA.innerHTML+= '<button type="button" class="btn btn-outline-secondary" onclick="location.href="/member/leavemember"">회원탈퇴</button>'
}


</script>







</html>