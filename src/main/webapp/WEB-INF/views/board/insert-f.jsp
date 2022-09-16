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

	
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
	<!-- main 안에 작성 -->
<main>

	
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
				 <form action="/board/insert-f" method="post">
                       <table class="table border board-table" >
						    <tr>
						     <td>작성자</td>
						     <td><input type="text" name="nickname"></td>
						    <!--  <td>작성일</td>
						     <td><input type="text" readonly></td> -->
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
						     	<textarea  name="content" class="board-writer-content" placeholder="내용을 입력해주세요."></textarea>
						     </td>
						     
    						</tr>
    						<tr>
    						<td colspan="4" style="text-align:left; padding:0;">
						     	<input type="file" name=""  style="border:0 solid black; ">
						     </td>
						     </tr>
						 </table>
						 <div  class="board-write-area" >
							 <div>
							 	<input type="button"  class="board-writer-button" onclick="location.href='/board/freeboard'" value="LIST">
							 </div>
							 <div>
							 	<input type="button" value="취소" onclick="location.href='/board/freeboard'" class="board-writer-button">
      							<button class="board-writer-button">글쓰기</button>
							</div>
						</div>

				</form>
			</div>
		</div>
	</div>
</main>
	
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>