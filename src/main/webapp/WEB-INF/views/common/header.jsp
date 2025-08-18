<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
	<!-- header 시작 -->
	<!-- 요청 : url, 버튼, 링크 -->
	<nav class="navbar"> 	
		<ul class="navbar_title">
			<li> <i class="fa-solid fa-cat"></i> </li>
		</ul>
		<ul class="navbar_menu">
			<!-- 여러 페이지를 하나의 서블릿에서 처리하기 위해서 -->
			<!-- 회원정보, 로그인 => *.do -->
			<!-- 게시판 => *.bo -->
			<!-- 상품 => *.pd -->
			<li><a href="${path}/main.do"> HOME </a></li>
			<li><a href="#"> 제품소개 </a></li>
			<li><a href="#"> Q&A </a></li>
		</ul>
		<ul class="navbar_icons">
			<li><a href="#"> <i class="fa-brands fa-twitter"></i> </a></li>
			<li><a href="#"> <i class="fa-brands fa-facebook"></i> </a></li>
			<li><a href="${path}/login.do"> LOGIN </a></li>
			<li><a href="${path}/join.do"> JOIN </a></li>
			<li><a href="#"> <i class="fa-solid fa-cart-shopping"></i> </a></li>
			<li><a href="#"> <i class="fa-solid fa-user"></i> </a></li>
		</ul>
		<!-- 반응형웹 - (1).햄버거 아이콘 : https://fontawesome.com/ => 돋보기 => 기본이 free > bars 선택 -->
		<a href="#" class="navbar_toggleBtn">
			<i class="fa-solid fa-bars"></i>	<!-- 햄버거 아이콘 -->
		</a>
	</nav>
	<!-- header 끝 -->
</body>
</html>