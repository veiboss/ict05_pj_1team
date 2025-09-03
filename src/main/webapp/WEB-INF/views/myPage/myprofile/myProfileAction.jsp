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
				<div class="pack-down-center" style="gap:20px; padding:20px 0">
					<div class="img-wrap circle s120">
						<img src="https://www.palnews.co.kr/news/photo/201801/92969_25283_5321.jpg" class="centered" alt="프로필 대표 이미지">
					</div>
					<h2 class="section-title">
						${sessionScope.sessionName}<span class="fw-300"> 님</span>
					</h2>
					<p class="pack-down">
						<span>${sessionScope.sessionEmail}</span>					
					</p>
				</div>
				<hr class="out-cont section-bar">	
				<section class="pack-down" style="padding:20px 0">
					<h3 class="small-title"><span class="fc-dark-gray">프로필 수정</span></h3>
						<!-- <form name="profileInfo" id="info" action="${path}/myProfileUpdate.do" method="post"> -->
						    <div class="pack-down" style="gap:12px">
							    <p class="pack-left">
							        <span style="width: 160px">성별</span>
							        <span style="height: 48px; width: 100%; gap:24px" class="pack-left">
							            <label>
							                <input type="radio" class="radio" name="mbp_gender" value="M" disabled
							                    <c:if test="${dto.mbp_gender eq 'M'}">checked</c:if>> 남
							            </label>
							            <label>
							                <input type="radio" class="radio" name="mbp_gender" value="W" disabled
							                    <c:if test="${dto.mbp_gender eq 'W'}">checked</c:if>> 여
							            </label>
							        </span>
							    </p>
							    <p class="pack-left">
							        <span style="width: 160px">키</span>
							        <input type="text" class="input-text small" name="mbp_height" value="${dto.mbp_height}" disabled>
							    </p>
							    <p class="pack-left">
							        <span style="width: 160px">나이</span>
							        <input type="text" class="input-text" name="mbp_age" value="${dto.mbp_age}" disabled>
							    </p>
							    <p class="pack-left">
							        <span style="width: 160px">몸무게</span>
							        <input type="text" class="input-text" name="mbp_weight" value="${dto.mbp_weight}" disabled>
							    </p>
							
							    <div class="pack-down-center" style="display:flex; gap:10px;">
							            <a href="myProfileUpdate.do" class="btn bdr-blue medium" style="padding:8px 0">
							            	<span class="fs-18">수정하기</span></a>
							    </div>
							</div>
					<!-- </form> -->
						<div class="pack-down-center" style="display:flex; gap:10px;">
							<a href="#" class="btn bdr-blue medium" style="padding:8px 0"><span class="fs-18">등급요청</span></a>
							<a href="myProfileDelete.do" class="btn bdr-blue medium" style="padding:8px 0"><span class="fs-18">탈퇴하기</span></a>
						</div>
						
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