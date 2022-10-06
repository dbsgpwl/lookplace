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
				<div class="board-title"><h2>커뮤니티</h2></div>
			</div>
			<div class="board-menu">
				<p><a href="review">리뷰</a></p>
				<p style="border-left:2px solid pink;"><a href="community">커뮤니티</a></p>
			</div>
		</div>
		<div class="board-main-area">
			<div class="board-main-title">
				<div><h3>글쓰기</h3></div>
				<div>
				<span><a href="/">home</a></span> &nbsp;>&nbsp;
				<span><a href="community">Community</a></span> 
				</div>
			</div>
<div class="board-table-area">
	<form method="post" action="/write">
	<table class="table border border-1 board-table table-hover">
		<tr>
			<td>작성자</td>
			<td><input name="nickname" value="${member.nickname }"/></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input name="title" placeholder="제목"/></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" placeholder="내용을 작성해주세요."></textarea></td>
		</tr>
	</table>
		<input type="button" class="board-get-button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
		<input type="button" class="board-get-button" value="글 목록" style="float: right;" onclick="location.href='community';">
	</form>
</div>
</div>
</div>
</main>
<script>

function goWrite(frm) {
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
	console.log(nickname,content,title)
	alert("등록 완료!");
}
</script>
<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>