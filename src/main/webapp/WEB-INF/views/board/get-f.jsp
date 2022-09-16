<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
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
				<p style="border-left:2px solid pink;"><a href="freeboard">자유게시판</a></p>
			</div>
		</div>
		
		<div class="board-main-area">
			<div class="board-main-title">
				<div><h3>자유게시판</h3></div>
				<div>
					<span><a href="/">home</a></span> &nbsp;>&nbsp;
					<span><a href="/board/notice">notice</a></span>&nbsp; >&nbsp;
					<span><a href="freeboard">board</a></span> 
				</div>
			</div>
			<div class="board-writer-area">
                       <table class="table border board-table" >
                       
						     <td>작성자</td>
						     <td><input name="nickname" type="text" readonly="readonly" value='<c:out value="${board.nickname}"/>'></td>
						     <td>작성일</td>
						     <td><input name="regdate" type="text" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/>'></td>
						    </tr>
						    <tr>
						     <td class="board-writer-title">제목</td>
						     <td colspan="3">
						     	<input name="title" type="text" readonly="readonly" value='<c:out value="${board.title}"/>'>
						     </td>
						    </tr>
						    <tr>
						     <td class="">글내용</td>
						     <td colspan="3">
						     	<textarea name="content" class="board-writer-content" readonly="readonly" ><c:out value="${board.content}"/></textarea>
						     </td>
						     
    						</tr>
    						
						 </table>
						
						 <div class="board-reply-area">
						 <h5>댓글</h5>
							 	<div class="board-reply-o">
																	 	
										<ul>
											<li>
												<div>
													<p>첫번째 댓글 작성자</p>
													<p>첫번째 댓글</p>
												</div>
											</li>
											
										</ul>
							 		<div>
							 			<textarea class="board-reply-content" placeholder="로그인 후 댓글을 남겨주세요."></textarea>
							 		</div>
							 		<div class="board-reply-btn" >
							 			<button class="board-reply-inputbox" onclick="">등록</button>
							 		</div>
							 		
							 	</div>
						</div>
						
							 
							 <div class="board-page">
							 	<a><i class="fas fa-angle-up"></i> &nbsp;Previous</a>
							 	<a>현재글</a>
							 	<a><i class="fas fa-angle-down"></i> &nbsp;Next</a>
							</div>
							
							<div class="board-get-btn-area">
							 	<input type="button" value="수정" onclick="location.href='modify-r?bno=${board.bno}'"/>
								<input type="button" value="삭제" onclick="del(${board.bno})"/>
								<input type="button" value="글 목록" onclick="location.href='freeboard';"/>
							 </div>

			</div>
		</div>
	</div>
</main>
	<script>
//글삭제 확인 스크립트 작성
	function del(bno) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='delete-f?bno='+bno;
		}
	}	
</script>
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>