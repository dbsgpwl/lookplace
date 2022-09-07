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
            <li><a href="#">menu1</a></li>
            <li><a href="#">menu2</a></li>
            <li><a href="#">menu3</a></li>
          </ul>
          <img src="LOGIN.png" width="150px">
        </div>
      </section>
      <section class="logoBox">
        <img src="/resources/image/logo.png" />
      </section>
      <section class="searchBox">
      	<i class="fa-solid fa-magnifying-glass"></i>
        <input type="text" />
      </section>
      <section class="buttonBox">
        <button onclick="location.href='Login.html'">Login</button>
        <button onclick="location.href='Sign-Up.html'">Sign-Up</button>
        <div>
          <button>
            <img src="/resources/image/map.png" />
          </button>
        </div>
      </section>
    </header>

</body>
</html>