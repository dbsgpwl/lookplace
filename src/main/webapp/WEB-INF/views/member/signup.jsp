
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
          <div>
          	<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
           	<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
           	<span class="id_input_re_3">이메일 형식에 맞지 않습니다.</span>
          </div>
                     
		  <div class="mail_check_input_box" >
		  		<input class="mail_check_input" id="mail_check_input_box_false" type="text" placeholder="인증번호전송" disabled="disabled">
		  		<button type="button" class="mail_check_button" onclick="alert('인증번호가 전송되었습니다.');">
					인증번호 전송
		  		</button>
		  </div>
		  <div>
		  	<span id="mail_check_input_box_warn" style="font-size:1em"></span>
		  </div>	
		  					  	
          <div>
            <input class="SignUpInput" type="password" placeholder="비밀번호" id="password" name="password"/>
          </div>
          <div>
          	<span style="color:red; font-size:12px;">*8글자 이상, (숫자, 영문, 특수문자) 중 2가지 이상 포함</span>
          </div>
          <div>
            <input class="SignUpInput" type="password" placeholder="비밀번호확인" id="pwdchk" />
          </div>
          <div>
            <input class="SignUpInput"  type="text"  placeholder="이름" id="name"  name="name"/>
          </div>
          <div>
            <input class="SignUpInput" type="text" placeholder="닉네임"  id="nickname" name="nickname" />
          </div>
          <div>
            <input class="SignUpInput" type="text" placeholder="연락처" id="phone" name="phone"/>
          </div>          
          <div class="Address_box">
            <input class="AddressInput1" type="text" placeholder="우편번호" name="address" id="address" readonly/>
            <button type="button" class="Address_button" onclick="execution_daum_address()">
	          		주소 찾기
	        </button>
          </div>
          <div>
            <input class="AddressInput2" type="text" placeholder="주소" id="address" name="address" readonly/>
            <input class="AddressInput3" type="text" placeholder="나머지 주소" name="address" />
          </div>
           <div>
            <input class="SignUpInput" type="text" placeholder="닉네임"  id="nickname" name="nickname" />
          </div>
          
          
          <div>
            <button type="button" class="CancelBtn">취소</button>
            <button type="button" class="SignUpBtn btn-open-popup">회원가입</button>
          </div>
        </form>
      </section>
      <div class="modal">
	  		<div class="modal_body">
		  		<h4>입력하신 정보가 맞는지 확인해주세요.</h4>
		  		<hr>
		  		<div id="modalSpace" style="font-size:1.5rem;text-align:left">
		  			
		  		</div>
	  			<button type="button" class="CancelBtn modal_cancel">취소</button>
	  			<button class="SignUpBtn SignUpBtnFinal">회원가입</button>
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

const USERID = document.querySelector("#email");
const MAILCHK = document.querySelector(".mail_check_input");
const USERPWD = document.querySelector("#password");
const PWDCHK = document.querySelector("#pwdchk");
const USERNAME = document.querySelector("#name");
const USERNICKNAME = document.querySelector("#nickname");

const MODALSPACE = document.querySelector("#modalSpace");
var email = USERID.value
var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;


BTNOPENPOPUP.addEventListener("click", () => {
	var pw = USERPWD.value
	var pwchk = PWDCHK.value
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	

    if (USERID.value === '') {
        alert("아이디를 입력해주세요.")
        USERID.focus();
        return false;
    }
    if(MAILCHK.value===''){
    	alert("인증번호를 입력해주세요.")
    	return false;
    }
    if (USERPWD.value === '') {
        alert("비밀번호를 입력해주세요.")
        USERPWD.focus();
        return false;
    } else if(pw.length < 8 || pw.length > 20){
		 alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
		 USERPWD.focus();
		 return false;
	} else if(pw.search(/\s/) != -1){
		 alert("비밀번호는 공백 없이 입력해주세요.");
		 USERPWD.focus();
		 return false;
	} else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
		 alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
		 USERPWD.focus();
		 return false;
	}else if (pw!==pwchk){
    	alert("비밀번호가 일치하지 않습니다!")
    	PWDCHK.focus();
    	return false;
    }
    if (USERNAME.value === '') {
        alert("이름을 입력해주세요.")
        USERNAME.focus();
        return false;
    }
    if (USERNICKNAME.value === '') {
        alert("닉네임을 입력해주세요.")
        USERNICKNAME.focus();
        return false;
    }
    
    MODAL.classList.toggle("show");

    MODALSPACE.innerHTML += '<div>아이디 : ' + USERID.value + '</div>'
    MODALSPACE.innerHTML += '<div>비밀번호 : ' + USERPWD.value + '</div>'
    MODALSPACE.innerHTML += '<div>이름 : ' + USERNAME.value + '</div>'
    MODALSPACE.innerHTML += '<div>닉네임 : ' + USERNICKNAME.value + '</div>'
    
    if (MODAL.classList.contains("show")) {
        BODY.style.overflow = "hidden";
        document.querySelector("header").style.display="none"
    }
});

MODAL.addEventListener("click", (event) => {
    if (event.target === MODAL) {
        MODAL.classList.toggle("show");
        MODALSPACE.innerHTML = ''; /* 모달에서 취소할 시 기존 내용 삭제 */

        if (!MODAL.classList.contains("show")) {
            BODY.style.overflow = "auto";
            document.querySelector("header").style.display="flex"
        }
    }
});

MODALCANCEL.addEventListener("click", (event) => {
    if (MODAL.classList.contains("show")) {
        MODAL.classList.toggle("show");
        document.querySelector("header").style.display="flex"
    }

    MODALSPACE.innerHTML = ''; /* 모달에서 취소할 시 기존 내용 삭제 */

    if (!MODAL.classList.contains("show")) {
        BODY.style.overflow = "auto";
    }
});


var code = "";            // 이메일 인증번호 저장

/* 회원가입 */ 
$(document).ready(function() {
            $(".SignUpBtnFinal").click(function() {
         			$("#join_form").attr("action", "/member/signup");
                    $("#join_form").submit();
                });
            });
            
/* 아이디 중복 검사 */
$('.SignUpInputEmail').on("propertychange change keyup paste input", function(){
	
	var email = $('.SignUpInputEmail').val();
	var data  = {email : email}
	
	if(exptext.test(email)==false){
		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
		$('.id_input_re_3').css("display", "inline-block");
		$('.id_input_re_1').css("display","none");
		$('.id_input_re_2').css("display","none");
		
	}else{
		$.ajax({
			type : "post",
			url  : "/member/memberIdChk",
			data : data,
			success : function(result){
				if(result != 'fail'){
					$('.id_input_re_1').css("display", "inline-block");
					$('.id_input_re_2').css("display","none");
					$('.id_input_re_3').css("display","none");
				}else{
					$('.id_input_re_2').css("display", "inline-block");
					$('.id_input_re_1').css("display","none");
					$('.id_input_re_3').css("display","none");
				}
			}
		});
	}
});
            
/* 인증번호 이메일 */
$(".mail_check_button").click(function() {
      var email    = $(".SignUpInputEmail").val(); // 입력한 이메일
      var checkBox = $(".mail_check_input");       // 인증번호 입력란


             $.ajax({
                 type: "GET",
                 url: "mailCheck?email=" + email,
                 success : function(data){
                 // 	console.log("data : " + data);
                 		checkBox.attr("disabled",false);
                 		checkBox.attr("id","mail_check_input_box_true");
                   		code = data;
                    }
                });
            });

/* 인증번호 비교 */
$(".mail_check_input").blur(function(){
	
	var inputCode   = $(".mail_check_input").val();    // 입력코드
	var checkResult = $("#mail_check_input_box_warn")  // 비교결과 
	
	if(inputCode == code){
		checkResult.html("인증번호가 일치합니다.");
		checkResult.attr("class","correct");
		$(".mail_check_input").css('border','1px solid gray');
		$(".mail_check_input").css('background-color','	white');
		$(".mail_check_input").css('color','black');
	}else{
		checkResult.html("인증번호를 다시 확인해주세요.");
		checkResult.attr("class","incorrect");
		$(".mail_check_input").css('border','1px solid red');
	}
});

/* 다음 주소 연동 */
function execution_daum_address(){
	
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
            $(".AddressInput1").val(data.zonecode);
            $(".AddressInput2").val(addr);
            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동
            $(".AddressInput3").attr("readonly",false);
            $(".AddressInput3").focus();
		}
	}).open();
}
            
</script>

</html>