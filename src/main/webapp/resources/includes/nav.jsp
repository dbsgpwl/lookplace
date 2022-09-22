<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>
</head>
<body>
    <nav>
      <ul class="menu-level1">
        <li>
          <a href="/map/mapapi"><i class="fa-solid fa-location-dot"></i></a>
        </li>
        <li>
          <a href="#"><i class="fa-solid fa-house"></i></a>
          <ul class="menu-level2">
            <li class="downMenu"><a href="/trip/best">인기</a></li>
            <li><a href="/trip/course">코스</a></li>
          </ul>
        </li>
        <li>
          <a href="notice"><i class="fa-solid fa-clipboard-list"></i></a>
          <ul class="menu-level2">
            <li class="downMenu"><a href="review">Review</a></li>
            <li><a href="community">Community</a></li>
          </ul>
        </li>
      </ul>
    </nav>

</body>
</html>