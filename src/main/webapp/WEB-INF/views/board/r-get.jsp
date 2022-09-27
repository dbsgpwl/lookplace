<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<div class="board-title">
						<h2>커뮤니티</h2>
					</div>
				</div>
				<div class="board-menu">
					<p>
						<a href="review">리뷰</a>
					</p>
					<p>
						<a href="community">커뮤니티</a>
					</p>
				</div>
			</div>
			<div class="board-main-area">
				<div class="board-main-title">
					<div>
						<h3>리뷰</h3>
					</div>
					<div>
						<span><a href="/">home</a></span> &nbsp;>&nbsp; <span>
						<a href="review">review</a></span>&nbsp;
					</div>
				</div>
				<div class="board-table-area">
					<input type="hidden" name="bno" value="${board.bno}">
					<table class="table border border-1 board-table table-hover">
						<tr>
							<td>작성자</td>
							<td><input
								value='<c:out value="${board.nickname }"></c:out>' /></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input value='<c:out value="${board.title }"></c:out>' /></td>
						</tr>

						<tr>
							<td>내용</td>
							<td><input value='<c:out value="${board.content }"></c:out>' /></td>
						</tr>
						<tr>
							
							<td colspan=2 style="text-align:center;"><img src='<c:out value="${board.filename }"></c:out>' style="width: 500px;height: 400px;object-fit: cover;"/></td>
						</tr>
					</table>
				

				</div>
				<div class="board-get-btn-area">
							<button class="board-get-button" id="list_btn_r">목록</button>
							<c:if test="${board.nickname == member.nickname}">
								<button class="board-get-button" onclick="deleteImage(${board.bno})">삭제</button>
							</c:if>
						</div>		


			</div>
			</div>
			<form id="infoForm" action="modify-r" method="get">
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }"> 
				<input type="hidden" name="keyword" value="${cri.keyword }"> 
				<input type="hidden" name="type" value="${cri.type }">
			</form>
	</main>
	<script>
		/* 게시글 목록 버튼 */
		$("#list_btn_r").on(
				"click",
				function(e) {
					self.location = "/review?" + "&pageNum=${cri.pageNum }"
							+ "&amount=${cri.amount }"
							+ "&keyword=${cri.keyword }" + "&type=${cri.type }"
				});
		
		function deleteImage(bno) {
			var chk = confirm("정말 삭제하시겠습니까?");
			if (chk) {
				location.href='deleteImage?bno='+bno;
				alert("삭제 완료!");
			}
		}	

		
	</script>


	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>

</body>


</html>