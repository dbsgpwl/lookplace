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
			<h1>��й�ȣ ã��</h1>
			<div class="inputBox">
				<input class="findInputEmail"  placeholder="e-mail">
				<button class="mail_find_button" type="button" onclick="alert('������ȣ�� ���۵Ǿ����ϴ�.');">������ȣ ����</button>
			</div>
			<div>
				<span id="mail_find_input_box_warn"></span>
			</div>
			<div class="inputBox">
				<input class="mail_find_input" id="mail_find_input_box_false" placeholder="������ȣ �Է�" disabled="disabled">
			</div>
			
			<div>
		  		<span id="mail_find_input_box_warn" style="font-size:1em"></span>
		  	</div>
		  			  	
			<button class="CancelBtn" type="button" onclick="location.href='/'">
				���
			</button>
			<button class="findBtn btn-open-popup" type="button">
				���ã��
			</button>
		</form>
	</section>
		<div class="modal">
	  		<div class="modal_body">
		  		<h1>��й�ȣ</h1>
		  		<hr>
		  		<div id="modalSpace" style="font-size:1.5rem; ">
		  			<span></span>
		  		</div>
	  			<button type="button" class="CancelBtn modal_cancel">���</button>
	  			<button type="button" class="findBtn">Ȯ��</button>
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

var code = "";

$(".mail_find_button").click(function(){
	var email=$(".findInputEmail").val();
	var checkBox=$(".mail_find_input");
	var boxWrap=$(".inputBox");
	
	
	$.ajax({
		
		type:"GET",
		url :"mailCheckfind?email=" + email
		success:function(data){
			checkBox.attr("disabled",false);
			boxWrap.attr("id","mail_check_input_box_true");
			code = data;
		}
	});	
});

</script>

</html>