<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>글수정</title>

</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/board.css" rel="stylesheet" type="text/css">
<body>

<jsp:include page="/resources/includes/header.jsp"></jsp:include>
<main>

<div class="board-main">
		<div class="board-aside-menu">
			<div class="board-aside"> 
				<div class="board-icon">
					<i class="fa-solid fa-clipboard-list"></i>
				</div>
				<div class="board-title"><h2>Notice</h2></div>
			</div>
			<div class="board-menu">
				<p><a href="review">리뷰</a></p>
				<p  style="border-left:2px solid pink;"><a href="community">커뮤니티</a></p>
			</div>
		</div>
		<div class="board-main-area">
			<div class="board-main-title">
				<div><h3>글 수정</h3></div>
				<div>
				<span><a href="/">home</a></span> &nbsp;>&nbsp;
				<span><a href="notice">notice</a></span>&nbsp; >&nbsp;
				<span><a href="community">Community</a></span> 
				</div>
			</div>
		<div class="board-table-area">
			<form method="post" action="/modify-r" >
			<input type="hidden" name="bno" value="${board.bno}">
			<input type="hidden" name="bno" value="${reply.bno}">
			<input type="hidden" name="rno" value="${reply.rno}">
				<table class="table border border-1 board-table table-hover">
					<tr>
						<td>작성자</td>
						<td><input type="text" name="nickname" value="${board.nickname }" readonly/></td>
					</tr>
					<tr>
						<td>title</td>
						<td><input type="text" name="title" value="${board.title }"/></td>
					</tr>
					<tr>
						<td>Content</td>
						<td><textarea name="content" style="width:100%; height:400px;">${board.content }</textarea></td>
					</tr>
					
					
					
				</table>
			<div class="board-get-btn-area" >
				<input class="board-get-button" type="button" value="글 수정" onclick="goModify(this.form)"/>
				<input class="board-get-button" type="button" value="삭제" onclick="del(${board.bno})"/>
				<input class="board-get-button" type="button" id="cancel_btn_r" value="취소" />
				<input class="board-get-button" type="button" id="list_btn_r" value="글 목록" style="float: right;">
				
			</div>
		</form>
		<form id="infoForm" action="/modify-r" method="get">
			<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'>
			<input type="hidden" name="pageNum" value="${cri.pageNum }">  
			<input type="hidden" name="amount" value="${cri.amount }">  
			<input type="hidden" name="keyword" value="${cri.keyword }">  
			<input type="hidden" name="type" value="${cri.type }"> 
		</form>
	</div>
</div>
</div>
</main>
<script>
function del(bno) {
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='delete-r?bno='+bno;
		alert("삭제 완료!");
	}
}	

function goModify(frm) {
	var title = frm.title.value;
	var nickname = frm.nickname.value;
	var content = frm.content.value;
	
	if (nickname.trim() == ''){
		alert("작성자를 입력해주세요");
		return false;
	}
	else if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	else if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
	alert("수정 완료!");
}


/* 취소 버튼 */
$("#cancel_btn_r").on("click", function(e){
	self.location = "/get-r?bno=${board.bno}"
				+ "&pageNum=${cri.pageNum }"
				+ "&amount=${cri.amount }"
				+ "&keyword=${cri.keyword }"
				+ "&type=${cri.type }"
				});	
				
/* 목록 버튼 */
$("#list_btn_r").on("click", function(e){
	self.location = "/community?"
				+ "&pageNum=${cri.pageNum }"
				+ "&amount=${cri.amount }"
				+ "&keyword=${cri.keyword }"
				+ "&type=${cri.type }"
				});	


</script>
<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>