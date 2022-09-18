<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/findid.css" rel="stylesheet" type="text/css">
<body>
<jsp:include page="/resources/includes/header.jsp"></jsp:include>

<main>
	<section class="emailBox">
		<form>
			<h1>아이디찾기</h1>
			<div class="inputBox">
				<input class="findInputEmail"  placeholder="e-mail">
				<button class="mail_find_button" type="button" onclick="alert('인증번호가 전송되었습니다.');">인증번호 전송</button>
			</div>
			<div>
			</div>
			<div class="inputBox">
				<input class="mail_find_input" placeholder="인증번호 입력" disabled="disabled">
			</div>
			
			<div>
		  		<span id="mail_find_input_box_warn" style="font-size:1em"></span>
		  	</div>
		  			  	
			<button class="CancelBtn" type="button" onclick="location.href='/'">
				취소
			</button>
			<button class="findBtn btn-open-popup" type="button">
				아이디찾기
			</button>
		</form>
	</section>
		<div class="modal">
	  		<div class="modal_body">
		  		<h1>아이디 확인</h1>
		  		<hr>
		  		<div id="modalSpace" style="font-size:1.5rem; ">
		  			<span></span>
		  		</div>
	  			<button type="button" class="CancelBtn modal_cancel">취소</button>
	  			<button type="button" class="findBtn">확인</button>
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

const MODALSPACE = document.querySelector("#modalSpace");

BTNOPENPOPUP.addEventListener("click", () => {
    
    MODAL.classList.toggle("show");

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

var code = "";

$(".mail_find_button").click(function(){
	var email = $(".findInputEmail").val();
	var checkBox = $(".mail_find_input");
	var boxWrap = $(".inputBox");
	
	 $.ajax({
	        
	        type:"GET",
	        url:"mailCheckfind?email=" + email,
	 // success 코드 넣으면 controller 접근이 안되는거 같다..
	 		success:function(finddata){
	 			checkBox.attr("disabled",false);
	 			boxWrap.attr("id","mail_find_input_box_true");
	 			code = finddata;
	 		}	 
	    });
});

/* 인증번호 비교 */
$(".mail_find_input").blur(function(){
	var inputCode = $(".mail_find_input").val();			// 입력코드
	var checkResult = $("#mail_find_input_box_warn");		// 비교결과
	
	if(inputCode == code){
		checkResult.html("인증번호가 일치합니다.");
		checkResult.attr("class","mail_input_correct");
	}else{
		checkResult.html("인증번호를 다시 확인해주세요.");
		checkResult.attr("class","mail_input_incorrect");
	}
});
</script>

</html>