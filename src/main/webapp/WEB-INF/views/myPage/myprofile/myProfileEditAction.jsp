<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../common/setting.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div id="content" class="sub my my-home">
				<!-- [D] main / sub-main / sub && pagd name -->
					
				<section class="pack-down" style="padding:20px 0">
					<h3 class="page-title">프로필 수정</h3>
						<form name="profileInfo" id="info" action="${path}/myProfileUpdateAction.do" method="post">
							<div class="pack-down" style="gap:12px">
								<p class="pack-left">
									<span style="width: 160px">성별</span>
									<span style="height: 48px; width: 100%; gap:36px" class="pack-left">
										<label class="pack-left gap-0">
											<input type="radio" class="radio" name="mbp_gender" value="M" <c:if test="${dto.mbp_gender eq 'M'}">checked</c:if>>
											<span>남</span>
										</label>
										<label class="pack-left gap-0">
											<input type="radio" class="radio" name="mbp_gender" value="W" <c:if test="${dto.mbp_gender eq 'W'}">checked</c:if>>
											<span>여</span>
										</label>
							        </span>
							    </p>
							    <p class="pack-left">
							        <span style="width: 160px">키</span>
							        <input type="text" class="input-text small" name="mbp_height" value="${dto.mbp_height}">
							    </p>
							    <p class="pack-left">
							        <span style="width: 160px">나이</span>
							        <input type="text" class="input-text" name="mbp_age" value="${dto.mbp_age}">
							    </p>
							    <p class="pack-left">
							        <span style="width: 160px">몸무게</span>
							        <input type="text" class="input-text" name="mbp_weight" value="${dto.mbp_weight}">
							    </p>
							
							    <div class="button-area pack-center">
							        <button type="submit" class="btn black medium r-full" style="padding:8px 0">
							            <span class="fs-18">수정하기</span>
							        </button>
							    </div>
							</div>
						</form>
						
				</section>
				<!-- // #content -->
				<!-- 컨텐츠 끝 -->
				</div>
			<!-- 컨텐츠 끝 -->
		
			<!-- nav 시작 -->
			<%@ include file="../../common/nav.jsp" %>
			<!-- nav 끝 -->
		
			<!-- footer 시작 -->
			<%@ include file="../../common/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container -->
	</div><!-- // #wrap -->
</body>
</html>