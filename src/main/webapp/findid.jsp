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
			<h1>���̵�ã��</h1>
			<div class="inputBox">
				<input class="findInput findInputEmail"  placeholder="e-mail">
				<button class="mail_check_button" type="button" onclick="alert('������ȣ�� ���۵Ǿ����ϴ�.');">������ȣ ����</button>
			</div>
			<div class="inputBox">
				<input class="mail_check_input" id="mail_check_input_box_false" placeholder="������ȣ �Է�" disabled="disabled">
			</div>
			
			<div>
		  		<span id="mail_check_input_box_warn" style="font-size:1em"></span>
		  	</div>
		  			  	
			<button class="CancelBtn" type="button" onclick="location.href='/'">
				���
			</button>
			<button class="findBtn btn-open-popup" type="button">
				���̵�ã��
			</button>
		</form>
	</section>
		<div class="modal">
	  		<div class="modal_body">
		  		<h1>���̵� Ȯ��</h1>
		  		<hr>
		  		<div id="modalSpace" style="font-size:1.5rem; ">
		  			<span></span>
		  		</div>
	  			<button type="button" class="CancelBtn modal_cancel">���</button>
	  			<button type="button" class="findBtn"  onclick="location.href='/'">Ȯ��</button>
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
        MODALSPACE.innerHTML = ''; /* ��޿��� ����� �� ���� ���� ���� */

        if (!MODAL.classList.contains("show")) {
            BODY.style.overflow = "auto";
        }
    }
});

MODALCANCEL.addEventListener("click", (event) => {
    if (MODAL.classList.contains("show")) {
        MODAL.classList.toggle("show");
    }

    MODALSPACE.innerHTML = ''; /* ��޿��� ����� �� ���� ���� ���� */

    if (!MODAL.classList.contains("show")) {
        BODY.style.overflow = "auto";
    }
});



/* ������ȣ �̸��� */
$(".mail_check_button").click(function() {
      var email    = $(".findInputEmail").val(); // �Է��� �̸���
      var checkBox = $(".mail_check_input");       // ������ȣ �Է¶�
      var boxWrap  = $(".mail_check_input_box")    // ������ȣ �Է¶� �ڽ�

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



/* ������ȣ �� */
$(".mail_check_input").blur(function(){
	
	var inputCode   = $(".mail_check_input").val();    // �Է��ڵ�
	var checkResult = $("#mail_check_input_box_warn")  // �񱳰�� 
	
	if(inputCode == code){
		checkResult.html("������ȣ�� ��ġ�մϴ�.");
		checkResult.attr("class","correct");
		$(".mail_check_input").css('border','1px solid gray');
		$(".mail_check_input").css('background-color','	white');
		$(".mail_check_input").css('color','black');
	}else{
		checkResult.html("������ȣ�� �ٽ� Ȯ�����ּ���.");
		checkResult.attr("class","incorrect");
		$(".mail_check_input").css('border','1px solid red');
	}
})

</script>

</html>