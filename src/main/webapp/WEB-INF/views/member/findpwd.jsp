<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/findid.css" rel="stylesheet" type="text/css">
<body>
<!-- Bootstrap core JavaScript -->
<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<main>
 <h3 id="title">비밀번호 찾기</h3>
		<form method="post" class="form-signin" action="findpwform" name="findform">
<div class="form-label-group">
			<input type="text" id="id" name="email" class="form-control"/>
			<label for="id">Email</label>
		</div>
		
		<div class="form-label-group">
			<input type="text" id="name" name="name" class="form-control"/>
			<label for="name">name</label>
		</div>
		
		<div class="form-label-group">
			<input type="text" id="phone" name="phone" class="form-control"/>
			<label for="phone">phone</label>
		</div>
		<div class="inputbox">
			<input id="check" class="btn btn-lg btn-secondary btn-block text-uppercase"
				type="submit" value="check">
	    </div>
		<!-- 정보가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
			opener.document.findform.id.value = "";
				opener.document.findform.name.value = "";
				opener.document.findform.phone.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 이름과 비밀번호가 일치하지 않을 때 -->
		<c:if test="${check == 0 }">
		
		<h3 style="text-align: center;">비빌번호 수정</h3>
		<div class="form-label-group">
		<input type="hidden" id="id" name="updateid" value="${updateid }">
		
			<input type="password" id="password" name="password" class="form-control"/>
			<label for="password">수정 비밀번호</label>
		</div>
		
		<div class="form-label-group">
			<input type="password" id="confirmpassword" name="confirmpwd" class="form-control"/>
			<label for="confirmpassword">비밀번호 확인</label>
		</div>
		<div class="inputbox">
				<input id="Ok" class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" value="수정하기" onclick="updatePassword()">
		</div>
		</c:if>

	</form>
</main>

</body>

<script type="text/javascript">
		function updatePassword(){
			if(document.findform.password.value==""){
				alert("비밀번호를 입력해주세요.");
				document.findform.pwd.focus();
			} else if(document.findform.password.value != document.findform.confirmpwd.value){
				alert("비밀번호가 일치하지 않습니다.");
				document.findform.confirmpwd.focus();
			} else {
				document.findform.action="update_password";
				document.findform.submit();
			}
		}
	</script>

</html>