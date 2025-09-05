<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 반응형 웹 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>약을 쏘옥, 약속</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/yaksok.css">

<!--  js -->
<script src="https://kit.fontawesome.com/d7162d59a4.js"
	crossorigin="anonymous"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
<style>
.my-home .pack-down-center.bg-blue.out-cont {
	margin-top: 80px;
	padding: 0 40px 40px;
	gap: 40px;
}

.my-home .my-info {
	width: 100%;
	gap: 16px;
}
.my-home .my-info + .my-info{}
.my-home .my-info .pack-down-left{gap: 0} 

.my-home .img-wrap.circle {
	margin-top: -60px;
}
.section.pack-down{padding: 40px calc(40px - 16px) 20px;}
.section.pack-down .btn.transparent{width: 100%; padding: 8px 0; display: block; text-align: left;}
</style>
</head>
<body>
	<div id="wrap" class="wrap">
		<!-- PC 컨텐츠 -->
		<%@ include file="../common/pc_left.jsp"%>
		<!-- PC 컨텐츠 끝 -->

		<div id="container" class="myPage">
			<!-- [D] HEADER VIEW :  no class /.lines(2) / .only-back(1) / .only-close(1) -->
			<!-- header 시각 -->
			<%@ include file="../common/header.jsp"%>
			<!-- header 끝 -->


			<!-- 컨텐츠 시작 -->
			<!-- SID : COM000 -->
			<div id="content" class="sub my my-home">
				<h2 class="blind">마이페이지</h2>
				<!-- [D] main / sub-main / sub && pagd name -->
				<div class="pack-down-center bg-blue out-cont">
					<div class="img-wrap circle s120">
						<img
							src="https://www.palnews.co.kr/news/photo/201801/92969_25283_5321.jpg"
							class="centered" alt="프로필 대표 이미지">
					</div>
					<div class="pack-down my-info">
						<div class="pack-both-top my-info">
							<p class="pack-down-left">
								<span class="pack-left">
									<strong class="fs-18">${sessionScope.sessionName}</strong>
									<span class="fw-300"> 님</span>
									<span class="op38">
									(${dto.mbp_gender == 'M' ? '남' : (dto.mbp_gender == 'W' ? '여' : '-')}, ${dto.mbp_age}세)
									</span>
								</span>
								<span>${sessionScope.sessionEmail}</span>
							</p>
						</div>
						
						<hr class="line op25">
						
						<div class="pack-both-top my-info">
							<div class="pack-down-left">
								<p class="pack-left has-bar">
									<span>키 </span>
									<span>${dto.mbp_height}</span>
								</p>
								<p class="pack-left has-bar">
									<span>체중 </span>
									<span>${dto.mbp_weight}</span>
								</p>
							</div>
							
							<a class="btn small black r-full" href="myProfileUpdate.do">
								프로필 수정
							</a>
						</div>
					</div>
				</div>
				
				<hr class="out-cont section-bar">
				
				<!-- 여기까지가 마이프로필 수정 -->
				<section class="section pack-down">
					<h3 class="small-title">
						<span class="fc-dark-gray">나의 활동</span>
					</h3>
					<div class="pack-down">
						<a href="MA20" class="btn transparent">
							<span class="fs-18">내설문목록</span>
						</a>
						<a href="myPageDrugList.do" class="btn transparent">
							<span class="fs-18">내약목록</span>
						</a>
						<a href="myReviewList.do" class="btn transparent">
							<span class="fs-18">내가쓴후기목록</span>
						</a>
						<a href="myQnaList.do" class="btn transparent">
							<span class="fs-18">내가쓴qna</span>
						</a>

					</div>
				</section>
				
				<hr class="out-cont section-bar">
				
				<section class="section pack-down">
					<div class="pack-down">
						<a href="logout.do" class="btn transparent">
							<span class="fs-18 fc-dark-gray">로그아웃</span>
						</a>
						<a href="mailto:admin@admin.com" class="btn transparent">
							<span class="fs-18 fc-dark-gray">전문가 등급 요청</span>
						</a>
					</div>
					<div class="pack-both">
						<span></span>
						<a href="myProfileDelete.do" class="btn linkline">회원탈퇴</a>
					</div>
				</section>
				
				
			<!-- 컨텐츠 끝 -->
			</div><!-- // #content -->
			<!-- nav 시작 -->


			<%@ include file="../common/nav.jsp"%>
			<!-- nav 끝 -->

			<!-- footer 시작 -->
			<%@ include file="../common/footer.jsp"%>
			<!-- footer 끝 -->

		</div>
		<!-- // #container -->
	</div>
	<!-- // #wrap -->
</body>
</html>