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
    	<div id="sidemenu-s1" class="sidemenu sidemenu-vertical sidemenu-left">
          <div style="position:absolute; top:12%; left:20%;font-size:1.5em;">
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
					<span onclick="location.href='/mypage/info'" style="cursor:pointer;">${member.nickname}님 </span><br>
					<span>LookPlace에 오신걸 <br> 환영합니다.</span>
				</div>
			</c:if>
          </div>
          <ul class="side_title" style="padding-top:20px; position:absolute; top:17%;left:12%">
            <li><a href="/"><i class="fa-sharp fa-solid fa-house"></i>홈</a>
            	<button id="side_Btn1" class="side_Btn" onclick="ShowDetail1()"><i class="fa-solid fa-caret-down"></i></button>
            	<ul class="side_Detail1">
            		<li><a href="/trip/best">인기</a></li>
            	</ul>
            </li>
            <li><a href="/map/mapapi"><i class="fa-sharp fa-solid fa-location-dot"></i>여행지도</a></li>
            <li><a href="freeboard"><i class="fa-solid fa-clipboard-list"></i>News</a>
            	<button id="side_Btn2" class="side_Btn" onclick="ShowDetail2()"><i class="fa-solid fa-caret-down"></i></button>
            	<ul class="side_Detail2">
            		<li><a href="review">Review</a></li>
            		<li><a href="community">Community</a></li>
            	</ul>
            </li>
          </ul>
       	<div style="position:absolute; top:85%; left:25%;">
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
     </div> 
    
      
	 <div id="showLeft" class="burger">
	      <div class="line1"></div>
	      <div class="line2"></div>
	      <div class="line3"></div>
	 </div>
	  
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
           <p style="margin-top:7px; font-size:15px; color:rgb(255, 56, 142)">여행지도</p>
          </button>
          
        <!-- 로그인 한 상태 -->				
		<c:if test="${member!=null}">
			<button onclick="location.href='/mypage/info'">
				<i class="fa-sharp fa-solid fa-user-pen"></i>
				<p style="margin-top:7px; font-size:15px; color:rgb(255, 56, 142)">내 정보</p>
			</button>		
        </c:if> 
        </div>
      </section>
    </header>

</body>
<script>

var menuLeft = document.getElementById( 'sidemenu-s1' ),
	showLeft = document.getElementById( 'showLeft' )
	
const DETAIL1 = document.querySelector('.side_Detail1')
const DETAIL2 = document.querySelector('.side_Detail2')

const SIDEBTN1 = document.querySelector('#side_Btn1')
const SIDEBTN2 = document.querySelector('#side_Btn2')

const burger = document.querySelector('.burger');


showLeft.onclick = function() {
	
	menuLeft.classList.toggle('sidemenu-open');
	burger.classList.toggle('toggle');
	if(!DETAIL1.classList.contains('side_Detail1')){
		DETAIL1.classList.add('side_Detail1');
		DETAIL1.style.height="0px";
		SIDEBTN1.classList.add('rotate_down')
	}
	if(!DETAIL2.classList.contains('side_Detail2')){
		DETAIL2.classList.add('side_Detail2');
		DETAIL2.style.height="0px";
		SIDEBTN2.classList.add('rotate_down')
	}
	
};	


const ShowDetail1 = () =>{
	if(DETAIL1.classList.contains('side_Detail1')){
		DETAIL1.style.height="50px";
		DETAIL1.classList.remove('side_Detail1');
		SIDEBTN1.classList.add('rotate_up')
		SIDEBTN1.classList.remove('rotate_down')
		DETAIL1.classList.add('down1')
		DETAIL1.classList.remove('up')
	}else{
		DETAIL1.style.height="0px";
		DETAIL1.classList.add('side_Detail1');
		SIDEBTN1.classList.add('rotate_down')
		SIDEBTN1.classList.remove('rotate_up')
		DETAIL1.classList.add('up')
		DETAIL1.classList.remove('down1')
	}
}

const ShowDetail2 = () =>{
	if(DETAIL2.classList.contains('side_Detail2')){
		DETAIL2.style.height="80px";
		DETAIL2.classList.remove('side_Detail2');
		SIDEBTN2.classList.add('rotate_up')
		SIDEBTN2.classList.remove('rotate_down')
		DETAIL2.classList.add('down')
		DETAIL2.classList.remove('up')
	}else{
		DETAIL2.style.height="0px";
		DETAIL2.classList.add('side_Detail2');
		SIDEBTN2.classList.add('rotate_down')
		SIDEBTN2.classList.remove('rotate_up')
		DETAIL2.classList.add('up')
		DETAIL2.classList.remove('down')
	}
}

</script>
</html>