<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세</title>
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
				<div><h3>리뷰</h3></div>
				<div>
				<span><a href="/">home</a></span> &nbsp;>&nbsp;
				<span><a href="/board/notice">notice</a></span>&nbsp; >&nbsp;
				<span><a href="review">review</a></span> 
				</div>
			</div>
			
			<div class="board-table-area">
				<table class="table border border-1 board-table table-hover">
					<tr>
						<td>작성자</td>
						<td><input value='<c:out value="${board.nickname }"></c:out>'/> </td>
					</tr>
					<tr>
						<td>title</td>
						<td><input value='<c:out value="${board.title }"></c:out>'/></td>
					</tr>
					
					<tr>
						<td colspan=2 style="text-align:left; padding-left:8%;">Content</td>
					</tr>
					<tr>
						<td colspan=2 style="text-align:left;"><textarea style="width:100%; height:400px;"><c:out value="${board.content}"/></textarea></td>
					</tr>
				</table>
				
				
				<div class="board-get-btn-area">
				
					<button class="btn" id="list_btn_r">목록</button> 
					<button class="btn" id="modify_btn_r">수정</button>
			</div>
			<!-- 댓글 시작 -->
			<div>
				<ul>
				<c:forEach items="${reply}" var="reply">
				<li>
					<div>
						<p>${reply.nickname} / <fmt:formatDate value="${reply.regdate}" pattern="yyyy-MM-dd" /></p>
						<p>${reply.content }</p>
					</div>
				</li>	
				</c:forEach>
				</ul>
			</div>
			<!-- 댓글 끝 -->
			<div>
				<form method="post" action="/reply/write">
					<p>
						<label>댓글 작성자</label> <input type="text" name="nickname">
					</p>
					<p>
						<textarea rows="5" cols="50" name="content"></textarea>
					</p>
					<p>
						<input type="hidden" name="bno" value="${board.bno }" />
						<button type="submit">댓글 작성</button>
					</p>
				</form>
			</div>
			<form id="infoForm" action="modify-r" method="get">
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
	
	/* 목록 버튼 */
	$("#list_btn_r").on("click", function(e){
		self.location = "/review?"
					+ "&pageNum=${cri.pageNum }"
					+ "&amount=${cri.amount }"
					+ "&keyword=${cri.keyword }"
					+ "&type=${cri.type }"
					});	
	

	/* 수정 버튼 */
	$("#modify_btn_r").on("click", function(e){
		self.location = "/modify-r?bno=${board.bno}"
					+ "&pageNum=${cri.pageNum }"
					+ "&amount=${cri.amount }"
					+ "&keyword=${cri.keyword }"
					+ "&type=${cri.type }"
					});	


</script>
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>


</html>