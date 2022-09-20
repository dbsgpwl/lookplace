<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<jsp:include page="link.jsp"></jsp:include>
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
    <header>
      <section class="burgerBox">
        <input type="checkbox" id="check_box" />
        <label for="check_box">
          <span></span>
          <span></span>
          <span></span>
        </label>
        <div id="side_menu">
          <ul style="padding-top:20px;">
			
				<!-- 로그인 하지 않은 상태 -->				
					<c:if test="${member==null}">
						<div>									
							<span>로그인 후</span><br>
							<span>LookPlace를 즐겨보세요</span>
						</div>	
					</c:if>
				
				<!-- 로그인 한 상태 -->
					<c:if test="${member!=null}">
						<div class="login_success_area">
								<span onclick="location.href='/mypage/info'" style="cursor:pointer">${member.nickname}님 </span><br>
								<span>LookPlace에 오신걸 환영합니다.</span>
						</div>
					</c:if>
			
            <li><a href="/"><i class="fa-sharp fa-solid fa-house"></i>홈</a>
            	<ul class="side_Detail">
            		<li>인기</li>
            		<li>코스</li>
            	</ul>
            </li>
            <li><a href="/map/mapapi"><i class="fa-sharp fa-solid fa-location-dot"></i>여행지도</a></li>
            <li><a href="freeboard"><i class="fa-solid fa-clipboard-list"></i>커뮤니티</a>
            	<ul class="side_Detail">
            		<li>인기</li>
            		<li>코스</li>
            	</ul>
            </li>
          </ul>
       	<!-- 로그인 하지 않은 상태 -->				
		<c:if test="${member==null}">
          <div id="login-button">
          	<i class="fa-regular fa-user" ></i>
          	<a href="/member/login">LOGIN</a>         	
         </div>
        </c:if> 
        
        <!-- 로그인 하지 않은 상태 -->				
		<c:if test="${member!=null}">
          <div id="login-button">
          	<i class="fa-regular fa-user" ></i>
          	<a href="/member/logout">LOGOUT</a>         	
         </div>
        </c:if> 
        
        
        </div>
      </section>
      <section class="logoBox">
        <a href="javascript:location.href='/'"><img src="/resources/image/logo.png" /></a>
      </section>
      <section class="searchBox">
      
        <input type="text" placeholder="어디로, 어떤 여행을 떠나실 건가요?"/>
        
        <a style="cursor: pointer;"><i class="fa-solid fa-magnifying-glass"></i></a>
        
      </section>
      <section class="buttonBox">
        <div>
          <button onclick="location.href='/map/mapapi'">
           <i class="fa-solid fa-map-location-dot" ></i>
           <p style="margin-top:7px; font-size:15px;">여행지도</p>
          </button>
          
        <!-- 로그인 한 상태 -->				
		<c:if test="${member!=null}">
			<button onclick="location.href='/mypage/info'">
				<i class="fa-sharp fa-solid fa-user-pen"></i>
				<p style="margin-top:7px; font-size:15px;">내 정보</p>
			</button>		
        </c:if> 
        </div>
      </section>
    </header>

</body>
</html>