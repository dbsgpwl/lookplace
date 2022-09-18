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
				<p style="border-left:2px solid pink;"><a href="review">리뷰</a></p>
				<p><a href="freeboard">자유게시판</a></p>
			</div>
		</div>
		<div class="board-main-area">
			<div class="board-main-title">
				<div><h3>글 수정</h3></div>
				<div>
				<span><a href="/">home</a></span> &nbsp;>&nbsp;
				<span><a href="/board/notice">notice</a></span>&nbsp; >&nbsp;
				<span><a href="review">review</a></span> 
				</div>
			</div>
		<div class="board-table-area">
			<form method="post" action="/modify-r" >
			<input type="hidden" name="bno" value="${board.bno}">
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
				<input style="margin:1%;"type="button" value="글 수정" style="float: right;" onclick="goModify(this.form)"/>
				<input style="margin:1%;"type="button" value="취소" onclick="location.href='review';">
				<input style="margin:1%;"type="button" value="글 목록" style="float: right;" onclick="location.href='review';">
			</div>
		</form>
		<form id="infoForm" action="/modify-r" method="get">
			<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
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
}
let form = $("#infoForm");		// 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
let mForm = $("#modifyForm");	// 페이지 데이터 수정 from

/* 목록 페이지 이동 버튼 */
$("#list_btn").on("click", function(e){
	form.find("#bno").remove();
	form.attr("action", "/review");
	form.submit();
});

/* 수정 하기 버튼 */
$("#modify_btn").on("click", function(e){
	mForm.submit();
});

/* 취소 버튼 */
$("#cancel_btn").on("click", function(e){
	form.attr("action", "/get-r");
	form.submit();
});	

/* 삭제 버튼 */
$("#delete_btn").on("click", function(e){
	form.attr("action", "/board/delete");
	form.attr("method", "post");
	form.submit();
});

</script>
<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>