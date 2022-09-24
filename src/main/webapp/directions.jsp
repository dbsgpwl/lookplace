<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아오시는길</title>
</head>

<jsp:include page="/resources/includes/link.jsp"></jsp:include>
<link href="../resources/css/directions.css" rel="stylesheet" type="text/css">
<body>
	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	
	<!-- main 안에 작성 -->
	<main>
		<h1 style="text-align:center; margin-bottom:10vh">찾아오시는길</h1>
		<div style="display:flex; justify-content:space-between">
			<div id="map" style="width:50%;height:500px; border-radius:15px"></div>
			<div style="width:45%; height:500px;">
				<p style="font-size: 2rem;">저희 LookPlace는 번화가에 위치하고 있어</p>
				<p style="font-size: 2rem;">대중교통을 이용하면 빠르게 오실 수 있습니다.</p>
				<br>
				<p style="font-size: 1.7em;">주변 지하철</p>
				<span style="font-size: 1.5em;">반월당역</span><br><br>
				<p style="font-size: 1.7em;">주변 정류장</p>
				<span style="font-size: 1.5em;">약령시건너(동성로입구), 2.28기념공원, 봉산문화거리건너</span>
			</div>
			
		</div>
	</main>
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e8fc6231999fd6457131e41d11e3f37&libraries=services&libraries=services"></script>
<script>
 
var mapContainer = document.getElementById('map'), // 지도의 중심좌표
mapOption = { 
    center: new kakao.maps.LatLng(35.866067, 128.593816), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
}; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//지도에 마커를 표시합니다 
var marker = new kakao.maps.Marker({
	map: map, 
	position: new kakao.maps.LatLng(35.866067, 128.593816)
});

//커스텀 오버레이에 표시할 컨텐츠 입니다
//커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
//별도의 이벤트 메소드를 제공하지 않습니다 
var content = '<div class="wrap">' + 
              '    <div class="info">' + 
              '        <div class="title">' + 
              '            LookPlace' + 
              '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
              '        </div>' + 
              '        <div class="body">' + 
              '            <div class="img">' +
              '                <img src="../resources/image/logo.png" width="73" height="70">' +
              '           </div>' + 
              '            <div class="desc">' + 
              '                <div class="ellipsis">대구광역시 중구 중앙대로 366</div>' + 
              '                <div class="jibun ellipsis">(우) 41943 (지번) 덕산동 96-15</div>' + 
              '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
              '            </div>' + 
              '        </div>' + 
              '    </div>' +    
              '</div>';

//마커 위에 커스텀오버레이를 표시합니다
//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
var overlay = new kakao.maps.CustomOverlay({
	content: content,
	map: map,
	position: marker.getPosition()       
});

//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
kakao.maps.event.addListener(marker, 'click', function() {
	overlay.setMap(map);
});

//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
	overlay.setMap(null);     
}

</script>
</html>