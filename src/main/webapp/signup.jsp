<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/infopage.css" rel="stylesheet" type="text/css">
<style>
    .SignUpBox {
      width: 30vw;
      height: 70vh;
      background-color: white;
      margin: 10vh auto;
      padding-top: 40px;
      border: 1px solid #e1e1e1;
      border-radius: 6px;
      text-align: center;
    }
    .SignUpForm {
      text-align: center;
    }
    .SignUpForm div {
      margin-bottom: 20px;
    }

    .SignUpInput {
      width: 20vw;
      height: 5vh;
      font-size: 1.2em;
      border: 1px solid #e1e1e1;
      padding: 5px;
    }
    .SignUpBtn {
      width: 7vw;
      height: 5vh;
      background-color: rgb(255, 56, 142);
      color: white;
      font-size: 1.2em;
      font-weight: 700;
      border: 1px solid rgba(0, 0, 0, 0);
      border-radius: 2px;
    }
    .CancelBtn {
      width: 5vw;
      height: 5vh;
      background-color: rgba(128, 128, 128, 0.767);
      color: white;
      font-size: 1.2em;
      font-weight: 700;
      border: 1px solid rgba(0, 0, 0, 0);
      border-radius: 2px;
    }

</style>
<body>

	
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
	<main>
		<section class="SignUpBox">
        <form action="/#" method="post" class="SignUpForm">
          <div style="margin-bottom: 50px">
            <h1>회원가입</h1>
          </div>
          <div>
            <input
              class="SignUpInput"
              type="email"
              placeholder="E-Mail"
              required
            />
          </div>
          <div>
            <input
              class="SignUpInput"
              type="password"
              placeholder="비밀번호"
              required
            />
          </div>
          <div>
            <input
              class="SignUpInput"
              type="password"
              placeholder="비밀번호확인"
              required
            />
          </div>
          <div>
            <input
              class="SignUpInput"
              type="text"
              placeholder="이름"
              required
            />
          </div>
          <div>
            <input
              class="SignUpInput"
              type="text"
              placeholder="닉네임"
              required
            />
          </div>
          <div>
            <button type="button" class="CancelBtn">취소</button>
            <button class="SignUpBtn">회원가입</button>
          </div>
        </form>
      </section>
	</main>
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>