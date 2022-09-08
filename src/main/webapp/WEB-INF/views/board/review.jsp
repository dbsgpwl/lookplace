<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/board.css" rel="stylesheet" type="text/css">
<body>

	
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
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
				<p style="border-left:2px solid pink;"><b>리뷰</b></p>
				<p >자유게시판</p>
			</div>
		</div>
		
		<div class="board-main-area">
			<div style="display:flex; align-items:center; justify-content:space-between">
				<div><h3>리뷰</h3></div>
<section class="searchBox">
      
        <input type="text" placeholder="작성자/제목을 검색해보세요"/>
        
        <a style="cursor: pointer;"><i class="fa-solid fa-magnifying-glass"></i></a>
        
      </section>
			</div>
			<div class="board-table-area">
				<table class="table board-table">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>날짜</td>
						<td>조회수</td>
					</tr>
					<tr>
						<td>1</td>
						<td>제목</td>
						<td>작성자</td>
						<td>날짜</td>
						<td>조회수</td>
					</tr>
					<tr>
						<td>2</td>
						<td>제목</td>
						<td>작성자</td>
						<td>날짜</td>
						<td>조회수</td>
					</tr>
					<tr>
						<td>3</td>
						<td>제목</td>
						<td>작성자</td>
						<td>날짜</td>
						<td>조회수</td>
					</tr>
					<tr>
						<td>4</td>
						<td>제목</td>
						<td>작성자</td>
						<td>날짜</td>
						<td>조회수</td>
					</tr>
				</table>
			</div>
			<div class="board-write-area" >
			 <button type="button" class="btn btn-outline-secondary" >글쓰기</button>
			</div>
			<div class="board-page" >
				                                      페이지네이션
			</div>
			
		</div>
		
		
	</div>
	</main>
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>