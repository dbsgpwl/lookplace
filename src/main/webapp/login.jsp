<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/infopage.css" rel="stylesheet" type="text/css">
<style>
    /* login */
    .loginBox {
      width: 30vw;
      height: 60vh;
      background-color: white;
      margin: 10vh auto;
      padding: 70px 90px;
      border: 1px solid #e1e1e1;
      border-radius: 6px;
      text-align: center;
    }
    .loginInput {
      width: 17vw;
      height: 5vh;
      font-size: 1.2em;
      border: 1px solid #e1e1e1;
    }

    .loginForm {
      text-align: center;
    }
    .loginForm div {
      margin-bottom: 20px;
    }

    .loginBtn {
      width: 17.4vw;
      height: 5vh;
      background-color: rgb(255, 56, 142);
      color: white;
      font-size: 1.2em;
      font-weight: 700;
      border: 1px solid rgba(0, 0, 0, 0);
      border-radius: 2px;
    }
    .autoLoginBox {
      width: 14vw;
      margin-left: 8vw;
      font-size: 13px;
      align-items: center;
    }
    .autoLoginBox input {
      font-size: 1.2em;
      width: 12px;
      height: 12px;
    }

</style>
<body>

	
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
	<main>
		<section class="loginBox">
	        <form action="/#" method="post" class="loginForm">
	          <div style="margin-bottom: 50px">
	            <h1>로그인</h1>
	          </div>
	          <div>
	            <input
	              class="loginInput"
	              type="text"
	              placeholder="아이디"
	              required
	            />
	          </div>
	          <div>
	            <input
	              class="loginInput"
	              type="password"
	              placeholder="패스워드"
	              required
	            />
	          </div>
	
	          <div class="autoLoginBox">
	            <span>
	              <input type="checkbox" name="chkbox" />
	            </span>
	            <span>자동로그인</span>
	          </div>
	
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
            <a href="#" style="color: gray">회원가입</a>
          </li>
          <li>|</li>
          <li style="list-style: none">
            <a href="#" style="color: gray">아이디찾기</a>
          </li>
          <li>|</li>
          <li style="list-style: none">
            <a href="#" style="color: gray">비밀번호찾기</a>
          </li>
        </ul>
      </section>
	</main>
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>