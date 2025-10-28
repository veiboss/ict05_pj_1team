<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/yaksokAd.js" defer></script>
<script src="${path}/resources/js/member/join.js" defer></script>
<script>window.APP_CTX='${path}';</script>
</head>
<body>
	<div class="skip-nav"><a href="#content">본문 바로가기</a></div>

	<div id="wrap" class="frame">
		<!-- menu 시작 -->
		<%@ include file="../admin/aside.jsp" %>
		<!-- menu 끝 -->
		
		<!-- header 시작 -->
		<%@ include file="../admin/header.jsp" %>
		<!-- header 끝 -->
		
		<div id="container" class="container">
			<!-- 컨텐츠 시작 -->
			
			<div class="title-bar">
				<div class="pack-left">
					<h2 class="page-title ellipsis">회원 등록</h2>
				</div>
			</div>
			
			<main id="content">
				<div class="write-form box-wrap" style="max-width: 960px;">
					<form name="joinform" action="memberInsertAction.ad" method="post" onsubmit="return signUpCheck()">
						<fieldset class="pack-down" style="gap: 20px;">
							<legend class="blind">기본 정보</legend>
							
							<!-- 중복 확인 버튼 안 눌렸을 때 0으로 설정-->
							<input type="hidden" name="hidden_mb_email" value="0">
							
							<!-- 아이디 등록 관리자 아이디 -->
							<input type="hidden" name="mb_writer_id" value="${sessionID}">
							
							<div class="row">
								<div class="field col-2 pack-down">
									<label class="label medium required" for="emailAddress">이메일주소</label>
									<div class="insert input-has-btn">
										<input type="email" class="input-text medium" name="mb_email" id="emailAddress" placeholder="이메일 입력" required>
										<button type="button" class="btn medium color1" name="btnChk" onclick="confirmId()">중복확인</button>
									</div>
								</div>
							</div>
							<div class="row-2">
								<div class="field col pack-down">
									<label class="label medium required" for="userName">이름</label>
									<div class="insert">
										<input type="text" class="input-text medium" name="mb_name" id="userName" placeholder="이름 입력" required>
									</div>
								</div>
								
								<div class="field col pack-down">
									<label class="label medium required" for="passWord">비밀번호</label>
									<div class="insert">
										<input type="text" class="input-text medium" name="mb_password" id="passWord" placeholder="영문, 숫자, 특수문자 포함 8자 이상 입력" required>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="field col pack-down">
									<span class="label medium">회원등급</span>
									<div class="insert pack-left">
										<label for="radio1" class="pack-left">
											<input type="radio" class="radio" name="mb_grade" value="ORDINARY">
											<span>일반회원</span>
										</label>
										<label for="radio2" class="pack-left">
											<input type="radio" class="radio" name="mb_grade" value="EXPERT">
											<span>전문가</span>
										</label>
										<label for="radio3" class="pack-left">
											<input type="radio" class="radio" name="mb_grade" value="ADMIN">
											<span>관리자</span>
										</label>
									</div>
								</div>
							</div>
	
							<div class="button-area pack-center">
								<button type="submit" class="btn large color1">회원 등록</button>
								<button type="reset" class="btn large bdr-color1">초기화</button>
							</div>
						</fieldset>
					</form>
				</div><!--.write-form -->
			</main>
			
			<!-- 컨텐츠 끝 -->
			
			
			<!-- footer 시작 -->
			<%@ include file="../admin/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container  -->
	</div><!-- // #wrap  -->
</body>
</html>