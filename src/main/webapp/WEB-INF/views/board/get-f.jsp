<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 상세</title>
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
				<div><h3>게시글보기</h3></div>
				<div>
					<span><a href="/">home</a></span> &nbsp;>&nbsp;
					<span><a href="/board/notice">notice</a></span>&nbsp; >&nbsp;
					<span><a href="/board/freeboard">board</a></span> 
				</div>
			</div>
			<div class="board-writer-area">
                       <table class="table border board-table" >
						    <tr>
						     <td>작성자</td>
						     <td><input type="text" placeholder="자동생성" readonly></td>
						     <td>작성일</td>
						     <td><input type="text" placeholder="자동생성" readonly></td>
						    </tr>
						    <tr>
						     <td class="board-writer-title">제목</td>
						     <td colspan="3">
						     	<input type="text" placeholder="제목을 입력해주세요.">
						     </td>
						    </tr>
						    <tr>
						     <td class="">글내용</td>
						     <td colspan="3">
						     	<textarea  name="content" class="board-writer-content" placeholder="내용을 입력해주세요."></textarea>
						     </td>
						     
    						</tr>
						 </table>
						
						
						 <div class="board-reply-area">
						 <h5>댓글</h5>
							 	<div class="board-reply-o">
							 		<div>
							 			<textarea class="board-reply-content" placeholder="로그인 후 댓글을 남겨주세요."></textarea>
							 		</div>
							 		<div class="board-reply-btn" >
							 			<button class="board-reply-inputbox" onclick="">등록</button>
							 		</div>
							 		<div>
							 			페이지네이션
							 		</div>
							 	</div>
						</div>
						
						 <div class="board-write-area" >
							 
							 <div>
							 	<input type="button" value="이전글" onclick="location.href=''" class="">
							 	<input type="button" value="현재글" onclick="location.href=''" class="">
      							<input type="submit" value="다음글" class="">
							</div>
							
							<div>
							 	<input type="button"  class="board-writer-button" onclick="location.href='/board/freeboard'" value="LIST">
							 </div>
						</div>

			</div>
		</div>
	</div>
</main>
	
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>