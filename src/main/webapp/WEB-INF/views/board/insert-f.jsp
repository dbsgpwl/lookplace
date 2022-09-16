<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/board.css" rel="stylesheet" type="text/css">
<body>
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
	
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
	<!-- main 안에 작성 -->
<main>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>
	
	<div class="board-main">
		<div class="board-aside-menu" style="">
			<div class="board-aside"> 
				<div class="board-icon">
					<i class="fa-solid fa-clipboard-list"></i>
				</div>
				<div class="board-title"><h2>Notice</h2></div>
			</div>
			<div class="board-menu">
				<p><a href="/board/review">리뷰</a></p>
				<p style="border-left:2px solid pink;"><a href="/board/freeboard">자유게시판</a></p>
			</div>
		</div>
		
		<div class="board-main-area">
			<div class="board-main-title">
				<div><h3>게시글쓰기</h3></div>
				<div>
					<span><a href="/">home</a></span> &nbsp;>&nbsp;
					<span><a href="/board/notice">notice</a></span>&nbsp; >&nbsp;
					<span><a href="freeboard">board</a></span> 
				</div>
			</div>
			<div class="board-writer-area">
				 <form action="/insert-f" method="post">
                       <table class="table border board-table" >
						    <tr>
						     <td>작성자</td>
						     <td><input type="text" name="nickname"></td>
						    </tr>
						    <tr>
						     <td class="board-writer-title">제목</td>
						     <td colspan="3">
						     	<input type="text" name="title" placeholder="제목을 입력해주세요.">
						     </td>
						    </tr>
						    <tr>
						     <td class="">글내용</td>
						     <td colspan="3">
						     	<textarea id="summernote" name="content" class="board-writer-content" placeholder="내용을 입력해주세요."></textarea>
						     </td>
						     
    						</tr>
    						
						 </table>
						 <div  class="board-write-area" >
							 <div>
							 	<input type="button"  class="board-writer-button" onclick="location.href='/board/freeboard'" value="LIST">
							 </div>
							 <div>
							 	<input type="button" value="취소" onclick="location.href='freeboard'" class="board-writer-button">
      							<button class="board-writer-button" onclick="goWrite(this.form)">글쓰기</button>
							</div>
						</div>

				</form>
			</div>
		</div>
	</div>
</main>
	
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
<script>
function goWrite(frm) {
	var title = frm.title.value;
	var writer = frm.nickname.value;
	var content = frm.content.value;
	
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (nickname.trim() == ''){
		alert("작성자를 입력해주세요");
		return false;
	}
	if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>
</html>