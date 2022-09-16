<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 수정</title>
</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/board.css" rel="stylesheet" type="text/css">
<body>
<script>

$(document).ready(function(){
	let form = $("#infoForm");		// 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#modifyForm");	// 페이지 데이터 수정 from
	
	/* 목록 페이지 이동 버튼 */
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/board/freeboard");
		form.submit();
	});
	
	/* 수정 하기 버튼 */
	$("#modify_btn").on("click", function(e){
		
		mForm.attr("action", "/board/freeboard");
		mForm.attr("method", "get");
		mForm.submit();
	});
	
	/* 취소 버튼 */
	$("#cancel_btn").on("click", function(e){
		form.attr("action", "/board/get-f");
		form.submit();
	});	
	
	/* 삭제 버튼 */
	$("#delete_btn").on("click", function(e){
		form.attr("action", "/board/delete");
		form.attr("method", "post");
		form.submit();
	});	
}
</script>
	
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
					<span><a href="freeboard">board</a></span> 
				</div>
			</div>
			<div class="board-writer-area">
			<form id="modifyForm" action="/board/modify-f" method="post">
                       <table class="table border board-table" >
						    <tr>
						     <td>작성자</td>
						     <td><input type="text" name="nickname" value='<c:out value="${pageInfo.nickname }"/>' readonly></td>
						    </tr>
						    <tr>
						     <td class="board-writer-title">제목</td>
						     <td colspan="3">
						     	<input type="text" name="title" value='<c:out value="${pageInfo.title }"/>' />
						     </td>
						    </tr>
						    <tr>
						     <td class="">글내용</td>
								<td colspan="3">
								<textarea name="content" class="board-writer-content"><c:out value="${pageInfo.content }"/></textarea>
								</td>
    						
    						</tr>
    						
						 </table>
						 
						
						<div class="btn_wrap">
							<button id="list_btn" >목록 페이지</button>
							<button id="modify_btn" >수정하기</button>
							<button id="cancel_btn" >수정 취소</button>
							 	
							 </div> 
							 
						</form>
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
							
							
	 <form id="infoForm" action="/board/modify-f" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>' />
	</form>
	
						</div>

			</div>
		</div>
	</div>
</main>
	
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>


</html>