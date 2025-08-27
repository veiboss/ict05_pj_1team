<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/setting.jsp" %>
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

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
<script src="${path}/resources/js/common/request.js"></script>
<script src="${path}/resources/js/member/join.js" defer></script>
</head>
<body>
	<div id="wrap" class="wrap">
		<!-- PC 컨텐츠 -->
		<%@ include file="../../common/pc_left.jsp" %>
		<!-- PC 컨텐츠 끝 -->
		
		<div id="container" class="lines">
		<!-- [D] HEADER VIEW :  no class /.lines(2) / .only-back(1) / .only-close(1) -->
			<!-- header 시각 -->
			<%@ include file="../../common/header.jsp" %>
			<!-- header 끝 -->
			
			<!-- 컨텐츠 시작 -->
			<!-- SID : SI20 -->
			<div id="content" class="sub si20"><!-- [D] main / sub-main / sub && pagd name -->
			
				<form class="join-form" name="joinform" action="joinAction.do" method="post" onsubmit="return signUpCheck()">
					<fieldset class="pack-down-center">
						<legend class="article-title">회원가입</legend>
						<!-- 2-1. 중복 확인 버튼 안 눌렸을 때 0으로 설정-->
						<input type="hidden" name="hidden_mb_email" value="0">

						<div class="field pack-down">
							<span class="label-box">
								<label class="text-label" for="emailAddress">이메일주소 <i class="required">*</i></label>
								<span class="input-has-btn">
									<input type="email" class="input-text" name="mb_email" id="emailAddress" placeholder="이메일 입력" required>
									<button type="button" class="btn" name="btnChk" onclick="confirmId()">중복확인</button>
								</span>
							</span>
						</div>

						<div class="field">
							<label class="label-box" for="passWord">
								<span class="text-label">비밀번호 <i class="required">*</i></span>
								<input type="password" class="input-text" name="mb_password" id="passWord" placeholder="영문, 숫자, 특수문자 포함 8자 이상 입력" required>
							</label>
						</div>

						<div class="field">
							<label class="label-box" for="passwordRe">
								<span class="text-label">비밀번호 확인<i class="required">*</i></span>
								<input type="password" class="input-text" name="mb_password_re" id="passwordRe" placeholder="비밀번호 재입력" required>
							</label>
						</div>

						<div class="field">
							<label class="label-box">
								<span class="text-label">이름 <i class="required">*</i></span>
								<input type="text" class="input-text" name="mb_name" id="passwordChk" placeholder="이름 입력" required>
							</label>
						</div>

						<div class="button-area flex-center">
							<input type="submit" class="btn black medium r4" value="가입">
						</div>
					</fieldset>
				</form>
			</div><!-- // #content -->
			<!-- 컨텐츠 끝 -->
		
			<!-- nav 시작 -->
			<%@ include file="../../common/nav.jsp" %>
			<!-- nav 끝 -->
		
			<!-- footer 시작 -->
			<%@ include file="../../common/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container -->
	</div><!-- // #wrap -->
	
	<div id="alertSignIn" class="overlay not-close">
		<div id="emailCheckWrap" class="alert">
			
		</div>
	</div><!-- // #alertSignIn -->
</body>
</html>