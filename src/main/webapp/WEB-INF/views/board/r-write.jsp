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
				<p style="border-left:2px solid pink;"><a href="review">리뷰</a></p>
				<p><a href="community">커뮤니티</a></p>
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
	<form action="/uploadFormAction" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="nickname">작성자</label>
		<input name="nickname" id="title" class="form-control" value="${member.nickname }">
	</div>
	<div class="form-group">
		<label for="title">여행지명</label>
		<input name="title" id="title" class="form-control">
	</div>
	<div class="form-group">
		<label for="content">내용</label>
		<input name="content" id="content" class="form-control">
	</div>
	<div class="form-group">
		<label for="imagefile">첨부파일</label>
		<input type="file" name="imagefile" id="imagefile" class="form-control">
		<div class="select_img"><img src="" /></div>
	</div>
	 <script>
	  $("#imagefile").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
 </script>
		<div style="margin:5% 0; padding-left:65%;">
			<button class="board-writer-button">등록</button>
			<button class="board-writer-button" type="reset">새로입력</button>
		</div>
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