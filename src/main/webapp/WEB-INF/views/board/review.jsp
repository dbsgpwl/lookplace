<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<p style="border-left:2px solid pink;"><a href="/board/review">리뷰</a></p>
				<p ><a href="freeboard">자유게시판</a></p>
			</div>
		</div>
		
		<div class="board-main-area">
			<div class="board-main-title">
				<div><h3>리뷰</h3></div>
				<div>
				<span><a href="/">home</a></span> &nbsp;>&nbsp;
				<span><a href="/board/notice">notice</a></span>&nbsp; >&nbsp;
				<span><a href="/board/review">review</a></span> 
				</div>
			</div>
			<div class="board-main-area-firstline" id="search_wrap">
			<section class="searchBox" id="search_area">
				<select name="type" class="board-search-type">
	                <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
	                <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
	                <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
	                <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
	                <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
	                <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
	                <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
	           	</select>
	       		<input type="text" name="keyword" value="${pageMaker.cri.keyword }" placeholder="작성자/제목을 검색해보세요" style="text-align:left;"/>
	        		<button class="board-search-button">검색</button>
	     	</section>
	     		<div class="board-write-area" >
				 <input type="button"  class="board-writer-button" onclick="location.href='/board/insert-r'" value="글쓰기">
				</div>
				 
			</div>
			
			<div class="board-table-area">
				<table class="table border border-1 board-table table-hover">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>날짜</td>
						<td>조회수</td>
					</tr>
					<c:forEach items="${review}" var="review" varStatus="x">
					<tr>
					
						<td><c:out value="${pageMaker.total -(pageMaker.cri.pageNum-1) * pageMaker.cri.amount - x.index}"/></td>
						<td><a class="move" href='<c:out value="get-r?bno=${review.bno}"/>'>
							<c:out value="${review.title}"/>
						</a></td>
						 <td><c:out value="${review.nickname}"/></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${review.regdate}"/></td>
						<td>조회수</td>
					</tr>
				
					</c:forEach>
				</table>
			</div>
			<div class="board-pagenation" >
				<div class="pageInfo_wrap" >
        			<div class="pageInfo_area">
	       				<ul class="pageInfo" id="pageInfo">
			           		<!-- 이전페이지 버튼 -->
			                <c:if test="${pageMaker.prev}">
			                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}"><i class="fas fa-chevron-left"></i></a></li>
			                </c:if> 	
			                  <!-- 각 번호 페이지 버튼 -->
			                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
			                </c:forEach>
			                <!-- 다음페이지 버튼 -->
			                <c:if test="${pageMaker.next}">
			                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }"><i class="fas fa-chevron-right"></i></a></li>
			                </c:if>    
		 				</ul>
	        		</div>
   	 			</div>
			</div>
			
			<form id="moveForm" method="get">    
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">  
		        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		        <input type="hidden" name="type" value="${pageMaker.cri.type}">
		    </form>
			
		</div>
		
		
	</div>
	</main>
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
	
	<script>
$(document).ready(function(){
	
	let result = '<c:out value="${result}"/>';
	
	checkAlert(result);
	
	function checkAlert(result){
		
		if(result === ''){
			return;
		}
		
		if(result === "등록완료"){
			alert("등록이 완료되었습니다.");
		}
		
		if(result === "modify success"){
	            alert("수정이 완료되었습니다.");
	    }
		if(result === "delete success"){
            alert("삭제가 완료되었습니다.");
        }
		
	}	
 
	
	 	let moveForm = $("#moveForm");
	 
	    $(".move").on("click", function(e){
	        /* e.preventDefault();	//클릭한 <a>태그 기능 정지
	        
	        //form 태그 내부에 bno 값을 저장하는 <input>태그 생성
	        moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
	        //<form>태그 action 속성 추가
	        moveForm.attr("action", "/board/get-r"); */
	        //<form태그 내부 데이터 서버 전송
	        moveForm.submit();
	    });
	    
	    $(".pageInfo a").on("click", function(e){
	    	 
	        e.preventDefault();
	        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	        moveForm.attr("action", "/board/review");
	        moveForm.submit();
	    });
	    
	    $("#search_area button").on("click", function(e){
	        e.preventDefault();
	        let val = $("input[name='keyword']").val();
	        moveForm.find("input[name='keyword']").val(val);
	        moveForm.find("input[name='pageNum']").val(1);
	        moveForm.submit();
	    });
	    
	    $("#search_area button").on("click", function(e){
	        e.preventDefault();
	        
	        let type = $("#search_area select").val();
	        let keyword = $("#search_area input[name='keyword']").val();
	        
	        if(!type){
	            alert("검색 종류를 선택하세요.");
	            return false;
	        }
	        
	        if(!keyword){
	            alert("키워드를 입력하세요.");
	            return false;
	        }        
	        
	        moveForm.find("input[name='type']").val(type);
	        moveForm.find("input[name='keyword']").val(keyword);
	        moveForm.find("input[name='pageNum']").val(1);
	        moveForm.submit();
	    });
	 
	
});
</script>
</body>
</html>