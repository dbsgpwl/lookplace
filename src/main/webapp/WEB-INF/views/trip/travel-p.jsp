<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지상세</title>
<link href="/resources/css/travel-p.css" rel="stylesheet"
	type="text/css">
<style>
	 section.replyForm-board-reply { padding:30px 0; }
	 section.replyForm-board-reply div.input_area-board-reply { margin:10px 0; }
	 section.replyForm-board-reply textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px; }
	 section.replyForm-board-reply button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
	 
	 section.replyList-board-reply { padding:30px 0; }
	 section.replyList-board-reply ol { padding:0; margin:0; list-style:none;}
	 section.replyList-board-reply ol li { padding:10px 0; border-bottom:2px solid #eee; }
	 section.replyList-board-reply div.userInfo-board-reply { }
	 section.replyLis-board-replyt div.userInfo-board-reply .userName-board-reply { font-size:24px; font-weight:bold; }
	 section.replyList-board-reply div.userInfo-board-reply .date-board-reply { color:#999; display:inline-block; margin-left:10px; }
	 section.replyList-board-reply div.replyContent-board-reply { padding:10px; margin:20px 0; }
	 section.replyList-board-reply div.replyFooter-board button { font-size:14px; border: 1px solid #999; background:none; margin-right:10px; }
 div.replyModal { position:relative; z-index:1; display: none;}
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancel { margin-left:20px; }
</style>
</head>

<body>
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	<!-- section 안에 작성 -->
	<main>

		<div class="travelP_firstdiv">
			<div class="travelP_seconddiv">
				<div>
					<span class="travelP_placespan"><c:out
							value="${detail.place }"></c:out></span>
				</div>

				<div class="travelP_thirddiv">
					<span class="travelP_placeaddr"><c:out
							value="${detail.local }" /> | <c:out value="${detail.address }" /></span><br>
				</div>
			</div>

			<div class="travelP_imgdiv">
				<div>
					<i class="fa-regular fa-heart e_h"></i>&nbsp; <i
						class="fa-regular fa-share-from-square"></i>&nbsp; <span
						style="font-size: 12px;">조회수 <c:out
							value="${detail.count }"></c:out></span>
				</div>
				<hr>


				<div class="travelP_travelinfo">
					<a>사진보기</a><a>상세정보</a><a>주차정보</a><a>여행톡</a>
				</div>
				<hr>
			</div>

			<div class="travelP_travelimg">
				<img
					src="/resources/image/<c:out value = "${detail.course }"></c:out>">
			</div>

			<div style="padding-top: 40px;">
				<div>
					<span class="travelP_detailinfo">상세정보</span>
					<hr>
				</div>

				<div class="travelP_detailinfo2">
					<span>상세정보란</span>
				</div>

				<div>
					<input type="text" value="#해시태그" class="travelP_input"> <input
						type="text" value="#지역" class="travelP_input2"> <input
						type="text" value="#친구와함께" class="travelP_input3">
				</div>
			</div>

			<div style="margin-top: 100px;">

				<h4>여행톡</h4>
				<form  method="post" name = "form">
					<div class="travelP_reply">
						<input type="text" placeholder="로그인 후 댓글을 남겨주세요." name="content">
						<input type="hidden" name="imgno"
							value='<c:out value = "${re.imgno }" />'> <input
							type="hidden" name="nickname"
							value='<c:out value = "${member.nickname }" />'>
							<c:if test="${member==null}">
								<div>									
									<span><a href="/member/login">로그인</a> 후 댓글을 작성해주세요</span>
								</div>	
							 </c:if>
							 <c:if test = "${member!=null }">
								<div style="text-align: right;">
									<button class="travelP_button" onclick = "javascript: form.action='/trip/travel-p';">등록</button>
								</div>
							</c:if>
							

						<c:forEach items="${reply }" var="reply">
							<div class="travelP_reply_content">
								<div
									style="display: flex; justify-content: space-between; margin-bottom: 10px;">
									<span><c:out value="${reply.nickname }"></c:out></span> <span><c:out
											value="${reply.regdate }"></c:out></span>
								</div>
								<p>
									<c:out value="${reply.content }"></c:out>
									<c:if test ="${member.nickname.equals(reply.nickname) }">
										<button id="modify_btn_r" type = "button">수정</button>
										<button onclick = "javascript: form.action='/trip/delete';"name = "reno" value = "${reply.reno }">삭제</button>
										
									</c:if>
								</p>
							</div>
						</c:forEach>
					
					</div>
				</form>
				
				<!-- 댓글 수정창 모달 -->
				<form action="/trip/update" method= "">
				<div class="replyModal">
				 <div class="modalContent">
				  <div>
				   <textarea class="modal_Content" name="modal_Content"></textarea>
				  </div>
				  <div>
				   <button type="submit" class="modal_modify_btn">수정</button>
				   <button type="button" class="modal_cancel">취소</button>
				  </div>
				 </div>
				 <div class="modalBackground"></div>
				</div>
				</form>
				
				
				<script type="text/javascript">
				
				</script>
			</div>
		</div>
	</main>
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>