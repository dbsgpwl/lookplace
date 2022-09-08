<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
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
          <ul>
            <li><a href="#"><i class="fa-sharp fa-solid fa-house"></i>홈</a></li>
            <li><a href="#"><i class="fa-sharp fa-solid fa-location-dot"></i>여행지도</a></li>
            <li><a href="#"><i class="fa-solid fa-clipboard-list"></i>커뮤니티</a></li>
          </ul>
          
          <div id="login-button">
          	<i class="fa-regular fa-user" ></i>
          	<a href="#">LOGIN</a>
          	
         </div>
        </div>
      </section>
      <section class="logoBox">
        <img src="/resources/image/logo.png" />
      </section>
      <section class="searchBox">
      
        <input type="text" placeholder="어디로, 어떤 여행을 떠나실 건가요?"/>
        
        <a style="cursor: pointer;"><i class="fa-solid fa-magnifying-glass"></i></a>
        
      </section>
      <section class="buttonBox">
        <div>
          <button>
           <i class="fa-solid fa-map-location-dot"></i>
           <p style="margin-top:7px; font-size:15px;">여행지도</p>
          </button>
        </div>
      </section>
    </header>

</body>
</html>