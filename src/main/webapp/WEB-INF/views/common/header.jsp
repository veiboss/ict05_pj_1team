<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YAKSOK header</title>
</head>
<body>
	<!-- header 시작 -->
	<!-- 요청 : url, 버튼, 링크 -->
			<header id="header">
				<h1>
					<a href="${path}/"><span class="logo"><span class="blind">약을 쏘옥</span></span></a>
				</h1>

				<div class="btns"></div>

				<div class="detail-line">
					<button type="button" class="btn back">
						<i class="ico back"><span>뒤로</span></i>
					</button>

					<button type="button" class="btn close">
						<i class="ico close"><span>닫기</span></i>
					</button>
				</div>
			</header>
	<!-- header 끝 -->
</body>
</html>