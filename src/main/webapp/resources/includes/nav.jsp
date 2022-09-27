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
          <a href="/trip/best"><i class="fa-solid fa-house"></i></a>
          <ul class="menu-level2">
            <li><a href="/trip/best">인기</a></li>
          </ul>
        </li>
        <li>
          <a href="news"><i class="fa-solid fa-clipboard-list"></i></a>
          <ul class="menu-level2">
            <li class="downMenu"><a href="review">리뷰</a></li>
            <li><a href="community">커뮤니티</a></li>
          </ul>
        </li>
      </ul>
    </nav>

</body>
</html>