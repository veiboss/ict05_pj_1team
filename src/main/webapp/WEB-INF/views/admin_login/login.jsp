<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/setting.jsp" %>
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

<!--  js -->
<script src="https://kit.fontawesome.com/d7162d59a4.js" crossorigin="anonymous"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/yaksokAd.js" defer></script>
</head>
<body>

	<div id="wrap" class="login">
		<div id="container" class="container">
			<!-- 컨텐츠 시작 -->
			<main id="content" class="login">
				<h1><img src="${path}/resources/images/logo/logo@2x.png" class="logo" alt="약을 쏘옥, 약속"></h1>
			
				<form class="login-form" action="loginAction.ad" method="post">
					<fieldset class="fieldset">
						<legend class="blind">로그인</legend>
						<div class="field text">
							<label class="label small" for="userId">ID</label>
							<div class="insert">
								<input type="text" id="userId" class="input-text large" title="아이디 입력" placeholder="아이디를 입력해주세요.">
							</div>
						</div>
						<div class="field text">
							<label class="label small" for="password">PASSWORD</label>
							<div class="insert">
								<input type="password" id="password" class="input-text large" title="비밀번호 입력" placeholder="비밀번호를 입력해주세요.">
							</div>
						</div>
						<div class="button-area">
							<button type="submit" class="btn large color1">로그인</button>
						</div>
					</fieldset>
				</form>
					
				<!-- footer 시작 -->
				<%@ include file="../admin/footer.jsp" %>
				<!-- footer 끝 -->
			</main><!-- // #content -->
			<!-- 컨텐츠 끝 -->
		</div><!-- // #container -->
	</div><!-- // #wrap -->
</body>
</html>