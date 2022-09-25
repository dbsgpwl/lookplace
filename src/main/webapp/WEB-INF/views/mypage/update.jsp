<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
							<input type=text class="updateAddress1 form-control" name="address" placeholder="우편번호" style="width:50%; margin-bottom:13px;" readonly>
							<input type=text class="updateAddress2 form-control" name="address" placeholder="주소" style="margin-bottom:13px;" readonly>
							<input type=text class="updateAddress3 form-control" name="address" placeholder="나머지 주소">
							<button type="button" class="Address_button" onclick="update_daum_address()">주소 찾기</button>
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
            
/* 다음 주소 연동 */
function update_daum_address(){	
	new daum.Postcode({
		// 팝업에서 검색결과 항목을 클릭 했을 때 실행할 코드
		oncomplete: function(data){
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 주소변수 문자열과 참고항목 문자열 합치기
                addr += extraAddr;
            
            } else {
              addr += ' ';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $(".updateAddress1").val(data.zonecode);
            $(".updateAddress2").val(addr);
            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동
            $(".updateAddress3").attr("readonly",false);
            $(".updateAddress3").focus();
		}
	}).open();
}

</script>
</html>