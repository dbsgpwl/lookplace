<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세</title>
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
				<div><h3>리뷰</h3></div>
				<div>
					<span><a href="/">home</a></span> &nbsp;>&nbsp;
					<span><a href="/board/notice">notice</a></span>&nbsp; >&nbsp;
					<span><a href="/board/freeboard">board</a></span> 
				</div>
			</div>
			<div class="board-writer-area">
                       <table class="table border board-table" >
                       <%-- <c:forEach items="${review}" var="review" varStatus="x">
						    <tr>
						     <td>번호</td>
						     <td><input name="bno" readonly="readonly" value='<c:out value="${cri.total -(cri.pageNum-1) * cri.amount - x.index}"/>' ></td>
						</c:forEach> --%>
						     <td>작성자</td>
						     <td><input name="nickname"  type="text" readonly="readonly" value='<c:out value="${pageInfo.nickname}"/>'></td>
						     <td>작성일</td>
						     <td><input name="regdate" type="text" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>'></td>
						    </tr>
						    <tr>
						     <td class="board-writer-title">제목</td>
						     <td colspan="3">
						     	<input name="title" type="text" readonly="readonly" value='<c:out value="${pageInfo.title}"/>'>
						     </td>
						    </tr>
						    <tr>
						     <td class="">글내용</td>
						     <td colspan="3">
						     	<textarea  name="content" class="board-writer-content" readonly="readonly" ><c:out value="${pageInfo.content}"/></textarea>
						     </td>
						     
    						</tr>
    						
						 </table>
						
    						<form id="infoForm" action="/board/modify" method="get">
								<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
								<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
								<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
								<input type="hidden" name="keyword" value="${cri.keyword}">
								<input type="hidden" name="type" value="${cri.type}">
							</form>
						
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
											<li>
												<div>
													<p>두번째 댓글 작성자</p>
													<p>두번째 댓글</p>
												</div>
											</li>
											<li>
												<div>
													<p>세번째 댓글 작성자</p>
													<p>세번째 댓글</p>
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
							 	<!-- <input type="button"  class="board-writer-button" onclick="location.href='/board/review'" value="LIST"> -->
							 	<a class="btn" id="list_btn">목록 페이지</a> 
								<a class="board-modify-button" id="modify_btn" style="text-decoration: none;">수정하기</a>
							 </div>

			</div>
		</div>
	</div>
</main>
	
	<script>
		let form = $("#infoForm");
		
		$("#list_btn").on("click", function(e){
			form.find("#bno").remove();
			form.attr("action", "/board/review");
			form.submit();
		});
		
		$("#modify_btn").on("click", function(e){
			form.attr("action", "/board/modify");
			form.submit();
		});	
	</script>	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>