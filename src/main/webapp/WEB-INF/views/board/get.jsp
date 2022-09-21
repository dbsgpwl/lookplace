<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세</title>
<script> 
function replyList(){
   var bno = ${board.bno};
   $.getJSON("/reply/list" + "?n=" + bno, function(data){
    var str = "";
    
    $(data).each(function(){
     
     console.log(data);
     
     var regdate = new Date(this.regdate);
     regdate = regdate.toLocaleDateString("ko-US")
     
     str += "<li data-rno='" + this.rno + "'>"
       + "<div class='userInfo-board-reply'>"
       + "<span class='userName-board-reply'>" + this.nickname + " "
       + "<span class='date-board-reply'>" + regdate + " "
       + "</div>"
       + "<div class='replyContent-board-reply'>" + this.content + "</div>"
       
       + "<c:if test='${member != null}'>"
       
       + "<div class='replyFooter-board'>"
       + "<button type='button' class='modify-reply' data-rno='" + this.rno + "'>수정</button>"
       + "<button type='button' class='delete-reply' data-rno='" + this.rno + "'>삭제</button>"
       + "</div>"
       
       + "</c:if>" 
       
       + "</li>";             
    });
    
    $("section.replyList-board-reply ol").html(str);
   });
}


   
 	
</script>
</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/board.css" rel="stylesheet" type="text/css">
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
					<c:if test="${board.nickname == member.nickname}">
					<button class="btn" id="modify_btn_r">수정</button>
					</c:if>
				</div>
				
			<!-- 댓글 목록 -->
			<div id="reply">

			<c:if test="${member==null}">
				<div>									
					<span><a href="/member/login">로그인</a> 후 댓글을 작성해주세요</span>
				</div>	
			 </c:if>
			   <section class="replyList-board-reply">
				 	<ol>
				  </ol>  
				  <script type="text/javascript">
				  	replyList();
				  </script>  
				  <script>
				  
				 	/* 댓글 삭제 */
				   $(document).on("click", ".delete-reply", function(){
				    var deleteChk = confirm("정말로 삭제하시겠습니까?");
				    
				    if(deleteChk){
				    var data = {rno : $(this).attr("data-rno")};
				     
				    $.ajax({
				     url : "/reply/delete",
				     type : "post",
				     data : data,
				     success : function(result){
				    	   
				    	   if(result == 1) {
				    	    replyList();
				    	   } else {
				    	    alert("작성자 본인만 할 수 있습니다.");       
				    	   }
				    	},
				    	error : function(){
				    		alert("로그인 후 삭제해주세요.")
				    	}
				     
				   	 });
				    }
				   });
				</script>
				</section>
			 <c:if test="${member != null}">
			 <section class="replyForm-board-reply">
				 <form method="post"> 
				  <input type="hidden" name="bno" id="bno" value="${board.bno}">
				   <div class="input_area-board-reply">
				    <textarea name="content" id="content"></textarea>
				   </div>
   			  <!-- 댓글 작성 -->
			   <div class="input_area-board-reply">
			    <button type="button" id="reply_btn-board-reply">댓글 남기기</button>
<script>
			$("#reply_btn-board-reply").click(function(){
				    
			var formObj = $(".replyForm-board-reply form[role='form']");
			var bno = $("#bno").val();
			var content = $("#content").val()
				    
			var data = {
				 bno : bno,
				 content : content
				};
				    
			$.ajax({
				 url : "/reply/write",
				 type : "post",
				 data : data,
				 success : function(){
				 replyList();
		   $("#content").val("");
			 }
		 });
	});
</script>
		   </div>
		 </form>
		</section>
		</c:if>
 


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
	
	/* 게시글 목록 버튼 */
	$("#list_btn_r").on("click", function(e){
		self.location = "/review?"
					+ "&pageNum=${cri.pageNum }"
					+ "&amount=${cri.amount }"
					+ "&keyword=${cri.keyword }"
					+ "&type=${cri.type }"
					});	
	

	/* 게시글 수정 버튼 */
	$("#modify_btn_r").on("click", function(e){
		self.location = "/modify-r?bno=${board.bno}"
					+ "&pageNum=${cri.pageNum }"
					+ "&amount=${cri.amount }"
					+ "&keyword=${cri.keyword }"
					+ "&type=${cri.type }"
					});	
	
</script>
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
	
	<!-- 댓글 수정창 모달 -->
	<div class="replyModal">
	 <div class="modalContent">
	  <div>
	   <textarea class="modal_Content" name="modal_Content"></textarea>
	  </div>
	  <div>
	   <button type="button" class="modal_modify_btn">수정</button>
	   <button type="button" class="modal_cancel">취소</button>
	  </div>
	 </div>
	 <div class="modalBackground"></div>
	</div>

<!-- 댓글 수정 스크립트 -->
<script>
$(".modal_cancel").click(function(){
  $(".replyModal").fadeOut(200);
});

$(document).on("click", ".modify-reply", function(){
   $(".replyModal").fadeIn(200); /* 200은 0.2초 */
   
   var rno = $(this).attr("data-rno");
   var content = $(this).parent().parent().children(".replyContent-board-reply").text();
   
   $(".modal_Content").val(content);
   $(".modal_modify_btn").attr("data-rno", rno);
   
});
	
	$(".modal_modify_btn").click(function(e){
	   var modifyChk = confirm("정말로 수정하시겠습니까?");
	   
	   if(modifyChk) {
	    var data = {
	       rno : $(this).attr("data-rno"),
	       content : $(".modal_Content").val()
	      };  // ReplyDTO 형태로 데이터 생성
	    
	    $.ajax({
	     url : "/reply/modify",
	     type : "post",
	     data : data,
	     success : function(result){
	      
	      if(result == 1) {
	       replyList();
	       $(".replyModal").fadeOut(200);
	      } else {
	       alert("작성자 본인만 할 수 있습니다.");         
	      }
	     },
	     error : function(){
	      alert("로그인 후 수정해주세요.")
	     }
	    });
	   }
	   
	});
	
</script>
</body>


</html>