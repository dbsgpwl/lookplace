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
        <form id="join_form" method="post" class="SignUpForm">
          <div style="margin-bottom: 50px">
            <h1>회원가입</h1>
          </div>
          
          <div>
            <input class="SignUpInputEmail" type="email" placeholder="E-Mail" id="email" name="email" />
          </div> 
           
		  <div class="mail_check_input_box">
		  		<input class="mail_check_input" id="mail_check_input_box_false" type="text" placeholder="인증번호전송" disabled="disabled">
		  	<div class="mail_check_button">
		  			<span>인증번호 전송</span>
		  	</div>
			<span id="mail_check_input_box_warn"></span>
		  	</div>	
		  					  	
          <div>
            <input class="SignUpInput" type="password" placeholder="비밀번호" id="password" name="password"/>
          </div>
          <div>
            <input class="SignUpInput" type="password" placeholder="비밀번호확인" />
          </div>
          <div>
            <input class="SignUpInput"  type="text"  placeholder="이름" id="name"  name="name"/>
          </div>
          <div>
            <input class="SignUpInput" type="text" placeholder="닉네임"  id="nickname" name="nickname" />
          </div>
           <div>
            <input class="SignUpInput" type="text" placeholder="주소"  id="address" name="address" />
          </div>
           <div>
            <input class="SignUpInput" type="text" placeholder="grade"  id="grade" name="grade" />
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
		  		<div id="modalSpace" style="font-size:1.5rem; ">
		  			
		  		</div>
	  			<button class="CancelBtn modal_cancel">취소</button>
	  			<button class="SignUpBtn"  onclick="location.href='/'">회원가입</button>
	  		</div>
		</div>
	</main>
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
<script>
const BODY = document.querySelector("body");
const MODAL = document.querySelector(".modal");
const BTNOPENPOPUP = document.querySelector(".btn-open-popup");
const MODALCANCEL = document.querySelector(".modal_cancel");

const USERID = document.querySelector("#userid");
const USERPWD = document.querySelector("#userpwd");
const USERNAME = document.querySelector("#name");
const USERNICKNAME = document.querySelector("#nickname");

const MODALSPACE = document.querySelector("#modalSpace");

BTNOPENPOPUP.addEventListener("click", () => {
    if (USERID.value === '') {
        alert("아이디가 비어져있습니다")
        USERID.focus();
        return;
    }
    if (USERPWD.value === '') {
        alert("비밀번호가 비어져있습니다")
        USERPWD.focus();
        return;
    }
    if (USERNAME.value === '') {
        alert("이름이 비어져있습니다")
        USERNAME.focus();
        return;
    }
    if (USERNICKNAME.value === '') {
        alert("닉네임이 비어져있습니다")
        USERNICKNAME.focus();
        return;
    }

    MODAL.classList.toggle("show");

    MODALSPACE.innerHTML += '<div>아이디 : ' + USERID.value + '</div>'
    MODALSPACE.innerHTML += '<div>비밀번호 : ' + USERPWD.value + '</div>'
    MODALSPACE.innerHTML += '<div>이름 : ' + USERNAME.value + '</div>'
    MODALSPACE.innerHTML += '<div>닉네임 : ' + USERNICKNAME.value + '</div>'



    if (MODAL.classList.contains("show")) {
        BODY.style.overflow = "hidden";
    }
});

MODAL.addEventListener("click", (event) => {
    if (event.target === MODAL) {
        MODAL.classList.toggle("show");
        MODALSPACE.innerHTML = ''; /* 모달에서 취소할 시 기존 내용 삭제 */

        if (!MODAL.classList.contains("show")) {
            BODY.style.overflow = "auto";
        }
    }
});

MODALCANCEL.addEventListener("click", (event) => {
    if (MODAL.classList.contains("show")) {
        MODAL.classList.toggle("show");
    }

    MODALSPACE.innerHTML = ''; /* 모달에서 취소할 시 기존 내용 삭제 */

    if (!MODAL.classList.contains("show")) {
        BODY.style.overflow = "auto";
    }
});


var code = "";            // 이메일 인증번호 저장

// 회원가입 
$(document).ready(function() {
            $(".SignUpBtn").click(function() {
                    $("#join_form").attr("action", "/member/signup");
                    $("#join_form").submit();
                });
            });
            
            // 인증번호 이메일
            $(".mail_check_button").click(function() {
                console.log("aaaaa");
                var email    = $(".SignUpInputEmail").val(); // 입력한 이메일
                var checkBox = $(".mail_check_input");       // 인증번호 입력란
                var boxWrap  = $(".mail_check_input_box")    // 인증번호 입력란 박스

                $.ajax({
                    type: "GET",
                    url: "mailCheck?email=" + email,
                    success : function(data){
                   // 	console.log("data : " + data);
                   		checkBox.attr("disabled",false);
                   		boxWrap.attr("id","mail_check_input_box_true");
                   		code = data;
                    }
                });
            });
// 인증번호 비교
$(".mail_check_input").blur(function(){
	
	var inputCode   = $(".mail_check_input").val();    // 입력코드
	var checkResult = $("#mail_check_input_box_warn")  // 비교결과 
	
	if(inputCode == code){
		checkResult.html("인증번호가 일치합니다.");
		checkResult.attr("class","correct");
	}else{
		checkResult.html("인증번호를 다시 확인해주세요.");
		checkResult.attr("class","incorrect");
		
	}
})
            
</script>

</html>