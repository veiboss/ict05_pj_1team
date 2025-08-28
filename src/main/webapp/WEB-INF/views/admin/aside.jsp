<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>YAKSOK ADMIN aside</title>
</head>
<body>
		<!-- menu 시각 -->
		<aside id="aside" class="aside">
			<h1><img src="${path}/resources/images/logo/finger@2x.png" class="logo" alt="TeamOne"></h1>
			<nav id="nav" class="aside-nav">
				<ul>
					<!-- 단일 메뉴  -->
					<li>
						<a href="#">
							<span class="material-symbols-outlined">pill</span>
							<span>영양제</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span class="material-symbols-outlined">user_attributes</span>
							<span>회원</span>
						</a>
					</li>
					<!-- 서브 메뉴가 있을 경우  -->
					<li>
						<a href="#">
							<span class="material-symbols-outlined">forum</span>
							<span>QnA</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span class="material-symbols-outlined">format_list_bulleted</span>
							<span>FAQ</span>
						</a>
					</li>
					<li>
						<a href="review.ad">
							<span class="material-symbols-outlined">rate_review</span>
							<span>후기</span>
						</a>
					</li>
				</ul>
			</nav>
		</aside>
		<!-- menu 끝 -->
</body>
</html>