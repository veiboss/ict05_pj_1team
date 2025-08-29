<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>약을 쏘옥, 약속</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/yaksok.css">

<!--  js -->
<script src="https://kit.fontawesome.com/d7162d59a4.js" crossorigin="anonymous"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
</head>
<body>
	<div id="wrap" class="wrap">
		<!-- PC 컨텐츠 -->
		<%@ include file="pc_left.jsp" %>
		<!-- PC 컨텐츠 끝 -->
		
		<div id="container" class="">
		<!-- [D] HEADER VIEW :  no class /.lines(2) / .only-back(1) / .only-close(1) -->
			<!-- header 시각 -->
			<%@ include file="header.jsp" %>
			<!-- header 끝 -->
		
			
			<!-- 컨텐츠 시작 -->
			<!-- SID : COM000 -->
			<div id="content" class="main"><!-- [D] main / sub-main / sub && pagd name -->
				
				<div class="img-wrap out-cont">
					<img src="${path}/resources/images/common/main.jpg">

					<div class="text-wrap">
						<div class="pack-down gap-40">
							<p class="fs-48 fc-000">
								<strong>
									필요한 것만 <br>
									잘 드시고 <br>
									계신가요?
								</strong>
							</p>
							<p class="ta-c">
								<a class="btn black xlarge r-full" href="javascript:void(0);"> 내 건강 점수는 ???</a>
							</p>
						</div>
					</div>
				</div>

			</div><!-- // #content -->
			<!-- 컨텐츠 끝 -->
		
			<!-- nav 시작 -->
			<%@ include file="nav.jsp" %>
			<!-- nav 끝 -->
		
			<!-- footer 시작 -->
			<%@ include file="footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container -->
	</div><!-- // #wrap -->
</body>
</html>