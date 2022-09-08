<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	@keyframes fadeInLeft {
        0% {
            opacity: 0;
            transform: translate3d(-100%, 0, 0);
        }
        to {
            opacity: 1;
            transform: translateZ(0);
        }
    }
    @keyframes fadeInRight {
        0% {
            opacity: 0;
            transform: translate3d(100%, 0, 0);
        }
        to {
            opacity: 1;
            transform: translateZ(0);
        }
    }
    .test_obj{
    	position: relative;
        animation: fadeInLeft 3s;
        animation-iteration-count:1;
    }
      .test_obj2{
    	position: relative;
        animation: fadeInRight 3s;
        animation-iteration-count:1;
    }
</style>
</head>
<body>


	<jsp:include page="/resources/includes/header.jsp"></jsp:include>
	<jsp:include page="/resources/includes/nav.jsp"></jsp:include>
	
	
	
	<main style="height:100%;">
		<div style="display:flex; flex-direction: column; width:100%;">
			<div style="display: flex; text-align: center;">
				<div style="width:50%; height:500px; background-color: black" class="test_obj">1</div>
				<div style="width:50%; height: 500px; line-height:500px; background-color: skyblue;" class="test_obj2">
					<h1>관광지 이름</h1>
				</div>
			</div>
			<div style="display: flex; text-align: center;">
				<div style="width:50%; height: 500px;line-height:500px; background-color: yellow;" class="test_obj">
					<h1>관광지 이름</h1>
				</div>
				<div style="width:50%; height:500px; background-color: red" class="test_obj2">1</div>
				
			</div>
			<div style="display: flex; text-align: center;">
				<div style="width:50%; height:500px; background-color: black" class="test_obj">1</div>
				<div style="width:50%; height: 500px; line-height:500px; background-color: pink;" class="test_obj2">
					<h1>관광지 이름</h1>
				</div>
			</div>
		</div>
			
		<div style="width:100%; height:35vh; margin-top:10vh; display:flex; ">
			<div style="width:20%;height:100%; border:1px solid red;">
				1
			</div>
			<div style="width:100%; height:100%; border:1px solid gray; display:flex; text-align:center; justify-content:space-arround; align-items: center; border:1px solid blue">
				<div style="width:25%; height:90%; display:flex; flex-direction:column; align-items:center; border:1px solid black;">
					<div style="width:100%; height:80%; background-color:yellow">
						이미지
					</div>
					<div style="width:100%; height: 20%; background-color:green">
						2
					</div>
				</div>
				<div style="width:25%; height:90%; display:flex; flex-direction:column; align-items:center; border:1px solid black;">
					<div style="width:100%; height:80%; background-color:yellow">
						이미지
					</div>
					<div style="width:100%; height: 20%; background-color:green">
						2
					</div>
				</div>
				<div style="width:25%; height:90%; display:flex; flex-direction:column; align-items:center; border:1px solid black;">
					<div style="width:100%; height:80%; background-color:yellow">
						이미지
					</div>
					<div style="width:100%; height: 20%; background-color:green">
						2
					</div>
				</div>
				<div style="width:25%; height:90%; display:flex; flex-direction:column; align-items:center; border:1px solid black;">
					<div style="width:100%; height:80%; background-color:yellow">
						이미지
					</div>
					<div style="width:100%; height: 20%; background-color:green">
						2
					</div>
				</div>
			</div>
		</div>
		
		
	</main>
	
	
	<jsp:include page="/resources/includes/footer.jsp"></jsp:include>
</body>
</html>