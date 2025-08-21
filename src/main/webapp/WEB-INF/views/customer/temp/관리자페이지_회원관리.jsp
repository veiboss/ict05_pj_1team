<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<img id="slideImage" src="${path}/resources/images/product_sample/35.png" width="1200">
	<button id="nextBtn" type="button">Next</button>
	<button id="mainBtn" type="button">Main</button>
	<button id="1Btn" type="button">관리자페이지_회원관리</button>
	<button id="2Btn" type="button">관리자페이지_FAQ목록</button>
	<button id="3Btn" type="button">관리자페이지_전문가QnA</button>
	
	
	<script>
	  // 공통 경로 + 파일명 배열
	  const base = "${path}/resources/images/product_sample/";
	  const images = ["35.png"];
	
	  let currentIndex = 0; // 현재 표시 중인 인덱스(초기 4.png)
	
	  document.getElementById("nextBtn").addEventListener("click", function (e) {
	    // form 안이라도 새로고침 방지
	    e.preventDefault();
	    currentIndex = (currentIndex + 1) % images.length; // 다음으로 순환
	    document.getElementById("slideImage").src = base + images[currentIndex];
	  });
	  
	  document.getElementById("mainBtn").addEventListener("click", function() {
		location.href = "main.do";   // main.do로 이동
	  });
	  
	  document.getElementById("1Btn").addEventListener("click", function() {
		location.href = "ADU20.ad";   // main.do로 이동
	  });

	  document.getElementById("2Btn").addEventListener("click", function() {
		location.href = "AFQ40.ad";   // main.do로 이동
	  });

	  document.getElementById("3Btn").addEventListener("click", function() {
		location.href = "AQA30.ad";   // main.do로 이동
	  });
	</script>
</body>
</html>