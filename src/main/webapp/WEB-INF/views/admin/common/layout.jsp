<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="robots" content="noindex">
<meta name="googlebot" content="noindex">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<title>약쏙 관리자</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/yaksokAd.css">

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/yaksokAd.js" defer></script>
</head>
<body>
	<div class="skip-nav"><a href="#content">본문 바로가기</a></div>

	<div id="wrap" class="frame">
		<!-- menu 시작 -->
		<%@ include file="aside.jsp" %>
		<!-- menu 끝 -->
		
		<!-- header 시작 -->
		<%@ include file="header.jsp" %>
		<!-- header 끝 -->
		
		<div id="container" class="container">
			<!-- 컨텐츠 시작 -->
			
			
			<div class="title-bar">
				<h2 class="page-title ellipsis">페이지 제목 </h2>
			</div>
			

			<main id="content">


				<div class="row-2">
					<div class="col box-wrap">
						.row-2 > .col
					</div>
					<div class="col box-wrap">
						.row-2 > .col
					</div>
				</div>
				<div class="row-3">
					<div class="col box-wrap">
						.row-3 > .col
					</div>
					<div class="col box-wrap">
						.row-3 > .col
					</div>
					<div class="col box-wrap">
						.row-3 > .col
					</div>
				</div>
				<div class="row-3">
					<div class="col field box-wrap">
						.row-3 > .col
					</div>
					<div class="col-2 box-wrap">
						.row-3 > .col-2
					</div>
				</div>
				<div class="row-4">
					<div class="col box-wrap">
						.row-4 > .col
					</div>
					<div class="col box-wrap">
						.row-4 > .col
					</div>
					<div class="col box-wrap">
						.row-4 > .col
					</div>
					<div class="col box-wrap">
						.row-4 > .col
					</div>
				</div>
				<div class="row-4">
					<div class="col field box-wrap">
						.row-4 > .col
					</div>
					<div class="col-2 box-wrap">
						.row-4 > .col-2
					</div>
					<div class="col field box-wrap">
						.row-4 > .col
					</div>
				</div>
				<div class="row-4">
					<div class="col field box-wrap">
						.row-4 > .col
					</div>
					<div class="col-3 box-wrap">
						.row-4 > .col-3
					</div>
				</div>
				<div class="row-5">
					<div class="col box-wrap">
						.row-5 > .col
					</div>
					<div class="col box-wrap">
						.row-5 > .col
					</div>
					<div class="col box-wrap">
						.row-5 > .col
					</div>
					<div class="col box-wrap">
						.row-5 > .col
					</div>
					<div class="col box-wrap">
						.row-5 > .col
					</div>
				</div>
				<div class="row-5">
					<div class="col box-wrap">
						.row-5 > .col
					</div>
					<div class="col-4 field box-wrap">
						.row-5 > .col-4
					</div>
				</div>
				<div class="row-5">
					<div class="col-2 box-wrap">
						.row-5 > .col-2
					</div>
					<div class="col-3 field box-wrap">
						.row-5 > .col-3
					</div>
				</div>
				<div class="row-5">
					<div class="col box-wrap">
						.row-5 > .col
					</div>
					<div class="col-2 box-wrap">
						.row-5 > .col-2
					</div>
					<div class="col-2 box-wrap">
						.row-5 > .col-2
					</div>
				</div>
			</main>
			
			<!-- 컨텐츠 끝 -->
			
			
			<!-- footer 시작 -->
			<%@ include file="footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container  -->
	</div><!-- // #wrap  -->
</body>
</html>