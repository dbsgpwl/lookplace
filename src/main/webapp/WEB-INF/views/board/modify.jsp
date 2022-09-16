<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
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
			<form id="review-modifyForm" action="/board/modify" method="post">
                       <table class="table border board-table" >
						    <tr>
						     <td>작성자</td>
						     <td><input type="text" name="nickname" readonly="readonly" value='<c:out value="${pageInfo.nickname}"/>'></td>
						     <td>작성일</td>
						     <td><input name="regdate" type="text" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>'></td>
						    </tr>
						    <tr>
						     <td class="board-writer-title">제목</td>
						     <td colspan="3">
						     	<input name="title" type="text" value='<c:out value="${pageInfo.title}"/>'>
						     </td>
						    </tr>
						    <tr>
						     <td class="">글내용</td>
						     <td colspan="3">
						     	<textarea  name="content" class="board-writer-content"><c:out value="${pageInfo.content}"/></textarea>
						     </td>
						     
    						</tr>
    						<tr>
    						<td colspan="2">
    						 	<a class="btn" id="list_btn_r">목록 페이지</a> 
        						<a class="btn" id="modify_btn_r">수정 완료</a>
        						<a class="btn" id="delete_btn_r">삭제</a>
       						 	<a class="btn" id="cancel_btn_r">수정 취소</a>
       						 </td>
 							</tr>
    						
						 </table>
						 </form>
							<form id="review-infoForm" action="/board/modify" method="get">
								<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
								<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
								<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
								<input type="hidden" name="keyword" value="${cri.keyword }">
								<input type="hidden" name="type" value="${cri.type }">
							</form>
						
						
						
						

			</div>
		</div>
	</div>
</main>
	
	<script>
	let form = $("#review-infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
    let mForm = $("#review-modifyForm");     // 페이지 데이터 수정 from
    
    /* 목록 페이지 이동 버튼 */
    $("#list_btn_r").on("click", function(e){
        form.find("#bno").remove();
        form.attr("action", "/board/review");
        form.submit();
    });
    
    /* 수정 하기 버튼 */
    $("#modify_btn_r").on("click", function(e){
        mForm.submit();
    });
    
    /* 취소 버튼 */
    $("#cancel_btn_r").on("click", function(e){
        form.attr("action", "/board/get-r");
        form.submit();
    });    
    /* 삭제 버튼 */
    $("#delete_btn_r").on("click", function(e){
        form.attr("action", "/board/delete");
        form.attr("method", "post");
        form.submit();
    });
	</script>	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>