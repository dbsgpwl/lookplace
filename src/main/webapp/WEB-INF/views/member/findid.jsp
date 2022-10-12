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
	<main style="margin-top:20px;">
	<h3 id="title">아이디 찾기</h3>
		<form method="post" class="form-signin" action="findidform"
			name="findform">
			<div class="form-label-group"><label for="name">Name</label>
				<input type="text" id="name" name="name" class="form-control" /> 
			</div>

			<div class="form-label-group">
			<label for="phone">Phone</label>
				<input type="text" id="phone" name="phone" class="form-control" /> 
			</div>
			<div id="inputbox">
				<input id="check" class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="submit" value="check">			
			
			<!-- 이름과 전화번호가 일치하지 않을 때-->
			<c:if test="${check == 1}">
				<script>
					$('.form-label-group').css.('display','none')
					opener.document.findform.name.value = "";
					opener.document.findform.phone.value = "";
				</script>
				<label>일치하는 정보가 존재하지 않습니다.</label>
			</c:if>

			<!-- 이름과 비밀번호가 일치하지 않을 때 -->
			<c:if test="${check == 0 }">
				<label>찾으시는 이메일은 ' ${id}' 입니다.</label>
					<input id="Ok" class="btn btn-lg btn-secondary btn-block text-uppercase"
						type="button" value="OK" onclick="closethewindow()">
			</c:if>
			</div>
		</form>
	</main>

</body>
<script type="text/javascript">
	function closethewindow() {
		self.close();
	}
</script>

</html>