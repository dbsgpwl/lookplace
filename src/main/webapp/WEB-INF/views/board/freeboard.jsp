<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
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
				<p><a href="/board/review">리뷰</a></p>
				<p style="border-left:2px solid pink;"><a href="/board/freeboard">자유게시판</a></p>
			</div>
		</div>
		
		<div class="board-main-area">
			<div class="board-main-title">
				<div><h3>자유게시판</h3></div>
				<div>
				<span><a href="/">home</a></span> &nbsp;>&nbsp;
				<span><a href="/board/notice">notice</a></span>&nbsp; >&nbsp;
				<span><a href="/board/freeboard">board</a></span> 
				</div>
			</div>
			<div class="board-main-area-firstline">
				<section class="searchBox">
	       		<input type="text" placeholder="작성자/제목을 검색해보세요"/>
	        		<a style="cursor: pointer;"><i class="fa-solid fa-magnifying-glass"></i></a>
	     		</section>
	     		<div class="board-write-area" >
				 <button class="board-writer-button" onclick="location.href='/board/insert-f'" >글쓰기</button>
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
					<c:forEach items="${list }" var="list">
					<tr>
						<td><c:out value="${list.bno }" /></td>
						<td><a class="move" href='<c:out value="${list.bno}"/>'>
                        		<c:out value="${list.title}"/>
                    		</a></td>
						<td><c:out value="${list.nickname }" /></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
						<td><c:out value="${list.viewcnt }" /></td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div class="board-page" >
				                                      페이지네이션
			</div>
			
		</div>
		<form id="moveForm-f" method="get">
		</form>
		
	</div>
	</main>
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>

<script>
$(document).ready(function(){
    
    let result = '<c:out value="${result}"/>';
    
    checkAlert(result);
    
    function checkAlert(result){
        
        if(result === ''){
            reutrn;
        }
        
        if(result === "enrol success"){
            alert("등록이 완료되었습니다.");
        }
        
        if(result === "modify success"){
            alert("수정이 완료되었습니다.");
        }
        
    }    
    
});

let moveForm = $("#moveForm-f");

$(".move").on("click", function(e){
	e.preventDefault();
	
	moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
	moveForm.attr("action", "/board/get-f");
	moveForm.submit();
})
</script>

</html>