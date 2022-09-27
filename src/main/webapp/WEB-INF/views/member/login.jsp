<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/login.css" rel="stylesheet" type="text/css">
<style>
    
</style>
<body>

	
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
	<main>
		<section class="loginBox">
	        <form id="login-form" method="post">
	          <div style="margin-bottom: 50px">
	            <h1>로그인</h1>
	          </div>
	          <div>
	            <input class="loginInput" type="text" placeholder="아이디" name="email" required/>
	          </div>
	          <div>
	            <input class="loginInput" type="password" placeholder="패스워드" name="password" required/>
	          </div>
	
	          <div class="autoLoginBox">
	            <span>
	              <input type="checkbox" name="chkbox" />
	            </span>	          
	            <span>자동로그인</span>
	          </div>
	          
	          <c:if test = "${result == 0 }">
			  <div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하였습니다.</div>
			  </c:if>
			  
	          <div>
	            <button class="loginBtn">로그인</button>
	          </div>
	        </form>
        <ul
          style="
            list-style: none;
            display: flex;
            margin: 0px;
            padding: 0px;
            justify-content: space-evenly;
            font-size: 0.8em;
          "
        >
          <li style="list-style: none">
            <a href="/member/signup" style="color: gray">회원가입</a>
          </li>
          <li>|</li>
          <li style="list-style: none">
            <a href="/member/findidform" onclick="window.open(`/member/findidform`, '회사소개','width=500px, height=500px'); return false" style="color: gray">아이디찾기</a>
          </li>
          <li>|</li>
          <li style="list-style: none">
            <a href="/member/findpwform" onclick="window.open(`/member/findpwform`, '회사소개','width=500px, height=650px'); return false" style="color: gray">비밀번호찾기</a>
          </li>
        </ul>
      </section>
	</main>
	
	<script>
		$(".loginBtn").click(function(){
			$("#login_form").attr("action","/member/login");
			$("#login_form").submit();
		});
	</script>
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>