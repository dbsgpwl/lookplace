<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>글쓰기</title>

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
				<p style="border-left:2px solid pink;"><a href="/board/review">리뷰</a></p>
				<p><a href="freeboard">자유게시판</a></p>
			</div>
		</div>
		<div class="board-main-area">
			<div class="board-main-title">
				<div><h3>글쓰기</h3></div>
				<div>
				<span><a href="/">home</a></span> &nbsp;>&nbsp;
				<span><a href="/board/notice">notice</a></span>&nbsp; >&nbsp;
				<span><a href="review">review</a></span> 
				</div>
			</div>
<div class="board-table-area">
	<form method="post" action="/write">
	<table class="table border border-1 board-table table-hover">
		<tr>
			<td>작성자</td>
			<td><input type="text" name="nickname" value="${member.nickname }"/></td>
		</tr>
		<tr>
			<td>title</td>
			<td><input type="text" name="title" placeholder="제목"/></td>
		</tr>
		<tr>
			<td>Content</td>
			<td><textarea name="content"></textarea></td>
		</tr>
	</table>
		<!-- <tr>
			<td>파일 업로드</td>
			<td><input type="file" name="img" id="review-img" multiple /></td>
		</tr>
		<tr>
			<td colspan=2>
				<div class="select_img"><img src=""/></div>
			</td>
		</tr>
	<script>
		$("#review-img").change(function(){
			if(this.files && this.files[0]){
				var reader = new FileReader;
				reader.onload = function(data) {
				     $(".select_img img").attr("src", data.target.result).width(500);        
				    }
				    reader.readAsDataURL(this.files[0]);
				   }
				});
	</script> -->
		<input type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
		<input type="button" value="글 목록" style="float: right;" onclick="location.href='review';">
	</form>
</div>
</div>
</div>
</main>
<script>
function goWrite(frm) {
	var title = frm.title.value;
	var content = frm.content.value;
	
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	else if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	
	else{
	frm.submit();
		
	}
	
	return true;
}
</script>
<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>