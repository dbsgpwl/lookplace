<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="/resources/css/info.css" rel="stylesheet" type="text/css">
<body>

	
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
	<main>
	<div class="info-main">
		<div class="info-aside-menu" style="">
			<div class="info-aside"> 
				<div class="info-icon">
					<i class="fa-solid fa-clipinfo-list"></i>
				</div>
				<div class="info-title"><h2>Notice</h2></div>
			</div>
			<div class="info-menu">
				<p style="border-left:2px solid pink;"><b>리뷰</b></p>
				<p >자유게시판</p>
			</div>
		</div>
		
		<div class="info-main-area">
			<div style="display:flex; align-items:center; justify-content:space-between">
				<div><h3>리뷰</h3></div>
<section class="searchBox">
      
        <input type="text" placeholder="작성자/제목을 검색해보세요"/>
        
        <a style="cursor: pointer;"><i class="fa-solid fa-magnifying-glass"></i></a>
        
      </section>
			</div>
			<div class="info-table-area">
				<table class="table info-table">
					<tr>
						<td>번호</td>
						
					</tr>
					
				</table>
			</div>
			<div class="info-write-area" >
			 <button type="button" class="btn btn-outline-secondary" >수정</button>
			</div>
		</div>
		
		
	</div>
	</main>
	
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>