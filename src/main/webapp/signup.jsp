<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/signup.css" rel="stylesheet" type="text/css">

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
              id="userid"
            />
          </div>
          <div>
            <input
              class="SignUpInput"
              type="password"
              placeholder="비밀번호"
              id="userpwd"
            />
          </div>
          <div>
            <input
              class="SignUpInput"
              type="password"
              placeholder="비밀번호확인"
            />
          </div>
          <div>
            <input
              class="SignUpInput"
              type="text"
              placeholder="이름"
              
            />
          </div>
          <div>
            <input
              class="SignUpInput"
              type="text"
              placeholder="닉네임"
              
            />
          </div>
          <div>
            <button type="button" class="CancelBtn">취소</button>
            <button type="button" class="SignUpBtn btn-open-popup">회원가입</button>
          </div>
        </form>
      </section>
      <div class="modal">
	  		<div class="modal_body">
		  		<h1>입력내용 확인</h1>
		  		<hr>
		  		<div>
		  			<strong>아이디 : </strong><br>
		  			<strong>비밀번호 : </strong><br>
		  			<strong>이름 : </strong><br>
		  			<strong>주소 : </strong>
		  		</div>
	  			<button class="CancelBtn modal_cancel">취소</button>
	  			<button class="SignUpBtn">회원가입</button>
	  		</div>
		</div>
	</main>
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
<script>
  const BODY = document.querySelector("body");
  const MODAL = document.querySelector(".modal");
  const BTNOPENPOPUP = document.querySelector(".btn-open-popup");
  const MODALCANCEL= document.querySelector(".modal_cancel");

  BTNOPENPOPUP.addEventListener("click", () => {
	  MODAL.classList.toggle("show");

    if (MODAL.classList.contains("show")) {
    	BODY.style.overflow = "hidden";
    }
  });

  MODAL.addEventListener("click", (event) => {
    if (event.target === MODAL) {
    	MODAL.classList.toggle("show");

      if (!MODAL.classList.contains("show")) {
    	  BODY.style.overflow = "auto";
      }
    }
  });
  
  	MODALCANCEL.addEventListener("click", (event)=>{
  		if (MODAL.classList.contains("show")){
			MODAL.classList.toggle("show");
  		}
		if (!MODAL.classList.contains("show")) {
			BODY.style.overflow = "auto";
		}
	});

</script>

</html>