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

	<img id="slideImage" src="${path}/resources/images/product_sample/26.png" width="1200">
	<button id="nextBtn" type="button">Next</button>
	<button id="mainBtn" type="button">Main</button>
	
	
	<script>
	  // 공통 경로 + 파일명 배열
	  const base = "${path}/resources/images/product_sample/";
	  const images = ["26.png","25.png"];
	
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
	</script>
</body>
</html>