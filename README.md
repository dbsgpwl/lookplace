# 🎈 프로젝트 기획
기간 : 2022/09/02 - 2022/09/25 (3주간)

## 1) 프로젝트 소개🎖️ 
<br>
전국 구석구석에 있는 다양한 여행 장소에 대해 소개하고, <br>
인기 여행지를 추천하여 주는 서비스입니다.<br>
<br>
여행 지도를 통해 전국에 있는 여행지를 한눈에 검색해 볼 수 있고,<br>
게시판을 통해 유저들끼리 커뮤니케이션을 하며 정보를 공유합니다.<br>

## 2) 핵심 기능 소개🎈
#### ⭐<b>사용자 페이지</b>⭐
**🔖 멤버 기능**
- 회원가입 및 로그인
- 마이페이지 회원 정보 조회/수정/탈퇴 
- 찜한 여행지 조회 
<br>

**🔖 메인 페이지 기능**
- 인기 여행지 추천 BEST 10 조회   
- 관심있는 여행지 찜(하트)하기
<br>

**🔖 여행 페이지 기능**
- 전국 인기 여행지 조회/조회수  
- 여행지 상세 정보 조회 
- 관심있는 여행지 찜(하트)하기
- 여행톡 댓글 작성/수정/삭제/목록 조회
<br>

**🔖 게시판 페이지 기능**
- 리뷰 이미지 게시판 목록 조회/작성/수정/삭제/조회수
- 리뷰글 상세보기 및 여행톡 작성/수정/삭제/목록 조회

- 자유게시판 목록 조회/작성/수정/삭제/조회수
- 자유게시판 상세보기 및 여행톡 작성/수정/삭제/목록 조회
- 공지사항 조회 
- 인기글, 최신글 정렬 기능
<br>

**🔖 여행 지도 기능**
- 지도API로 여행지 검색, 지역별 여행지 추천

## 3) 프로토타입🎈
[LOOKPLACE](https://ovenapp.io/view/aDPoiCGk5gW6Qf5lavPODGeLxzcuvYFr/ )
<br><br><br>
<hr>


# 🎈 설계 및 구현
## 1) 개발환경
<br>

* [x] JAVA 11
* [x] Spring Framework 5.2.8
* [x] HikariCP 커넥션 풀, Lombok 1.18.24, MyBatis 3.5.3
* [x] MySQL 8.0.30
* [x] Apache Tomcat 9.0
* [x] HTML, CSS, JavaScript, Jquery, BootStrap
* [x] IDE : Eclipse 
<br>

## 2) ERD / 테이블 정의서
<br>

![](https://velog.velcdn.com/images/dbsgpwl/post/2a8e8b54-d822-4b62-a0b9-a073f83b30a3/image.png)

<br>

## 3) UseCaseDiagram
![](https://velog.velcdn.com/images/dbsgpwl/post/96432a23-2395-4fff-b916-8db483daf794/image.png)


<br>

## 4) 결과물 소개
<br>
🪄 메인 화면

![image](https://user-images.githubusercontent.com/103105338/192481939-f0969acf-31f2-456f-ab3b-a228ba364ef9.png)
🪄 여행지도 화면
![image](https://velog.velcdn.com/images/dbsgpwl/post/47b2ff69-8100-4b57-b5b3-f39cb420e595/image.png)
🪄 멤버 서비스 화면
![](https://velog.velcdn.com/images/dbsgpwl/post/37243cee-e190-4c57-a430-d7d522e244e3/image.png)

![](https://velog.velcdn.com/images/dbsgpwl/post/051590bf-718a-4ce0-b0d6-e7ee0f4bf73d/image.png)

![](https://velog.velcdn.com/images/dbsgpwl/post/9d425372-2999-4fa1-b79c-df8730194c13/image.png)

![](https://velog.velcdn.com/images/dbsgpwl/post/e1166f28-a8cb-4f50-b9da-3dc42efc1ee0/image.png)

![](https://velog.velcdn.com/images/dbsgpwl/post/9c4ea889-7458-4518-8230-478c60f1f8df/image.png)

🪄 인기 지역 화면
![](https://velog.velcdn.com/images/dbsgpwl/post/8af69fba-0caa-4743-9f03-0c6e73e0a7d9/image.png)

![](https://velog.velcdn.com/images/dbsgpwl/post/96517728-e30b-4774-92b9-c91f95a21d04/image.png)

🪄 지역 상세 화면
![](https://velog.velcdn.com/images/dbsgpwl/post/92e98b49-6658-41bd-a560-ba7be07d0d19/image.png)

🪄 게시판 화면
![](https://velog.velcdn.com/images/dbsgpwl/post/082508a3-fb3a-427f-ab29-8baa8565f835/image.png)

![](https://velog.velcdn.com/images/dbsgpwl/post/2ee715e9-46a3-4771-a6ac-8809b0341280/image.png)

![](https://velog.velcdn.com/images/dbsgpwl/post/5225b7d6-619a-4b3b-b7a5-384562b316b1/image.png)


🪄 게시판 상세글 화면
![](https://velog.velcdn.com/images/dbsgpwl/post/4a724b00-8449-43e0-89c0-9bb31e1ce69a/image.png)

![](https://velog.velcdn.com/images/dbsgpwl/post/f52d9c18-ef6a-455e-9205-3a652594c5fe/image.png)

<br>

## 5) 배포
### 헤로쿠를 이용하여 배포
[Lookplace 배포 사이트 클릭!](https://lookplacesite.herokuapp.com/
).
but 문제상황 발생
문제 1) 헤로쿠는 DB에 저장된 이미지 파일 경로를 불러오지 못함.
문제 2) 이미지 파일 업로드시 DB 저장 불가
->> 문제 해결방안을 서치 중.
