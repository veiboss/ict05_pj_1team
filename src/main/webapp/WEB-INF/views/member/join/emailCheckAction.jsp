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
<body class="pack-center">
	<form class="check-form" name="confirmform" action="emailCheckAction.do" method="post">
		<fieldset class="pack-down gap-20">
			<legend class="blind">이메일 중복체크</legend>
			
			<!-- id 중복일 때, id를 입력받아 다시 중복체크 -->
			<c:if test="${selectCnt == 1}">
				<div class="pack-down gap-32">
					<p class="fs-18 ta-c">
						<strong>${strEmail}</strong>는 <br>
						아이디로 사용할 수 없습니다. 
					</p>
					
					<div class="field pack-down">
						<span class="field pack-down gap-8">
							<span class="input-has-btn">
								<input type="email" class="input-text" name="mb_email" id="emailAddress" placeholder="이메일 입력">
								<button type="submit" class="btn">중복확인</button>
							</span>
						</span>
					</div>
				</div>
			</c:if>
			
			<!-- id 중복 아닐 때 확인 후 창 닫기 -->
			<c:if test="${selectCnt != 1}">
				<div class="pack-down gap-32">
					<p class="fs-18 ta-c">
						<strong >${strEmail}</strong>는 <br>
						아이디로 사용할 수 있습니다. 
					</p>
				
					<div class="button-area pack-center">
						<button type="button" class="btn blue medium r4" onclick="setUserEmail('${strEmail}')">확인</button>
					</div>
				</div>
			</c:if>
		</fieldset>
	</form>
</body>
</html>