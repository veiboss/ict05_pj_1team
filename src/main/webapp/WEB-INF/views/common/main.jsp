<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
<script src="${path}/resources/js/lib/jquery.waypoints.min.js" defer></script>
<script src="${path}/resources/js/lib/jquery.counterup.js" defer></script>
<script src="${path}/resources/js/lib/easy-pie-chart/jquery.easypiechart.min.js" defer></script>

<script>
	$(function() {
		// 내비게이션 선택
		nav.current(1);

		// 챠트
		$('.chart.small').easyPieChart({
			animate: 2000,
			easing: 'easeOutBounce',
			barColor: '#687FE5',
			scaleColor: false,
			trackColor: '#f1f1f1',
			lineWidth: 6,
			size: 76,
		});

		// 챠트 숫자 카운트
		$(".counter-up").counterUp({
			time: 1000,
		});
	});
</script>
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
							<p class="fs-48-32 fc-000">
								<strong>
									필요한 것만 <br>
									잘 드시고 <br>
									계신가요?
								</strong>
							</p>
							<p class="ta-c">
								<a class="btn black xlarge r-full" href="MA10"> 내 건강 점수는 ???</a>
							</p>
						</div>
					</div>
				</div>
				
				<section class="bg-pink out-cont pack-down gap-32">
					<div class="pack-both">
						<h2 class="section-title fc-000">💗약속러들의 건강 점수?</h2>
					</div>
					
					<div id="recOPH" class="swiper-container out-cont">
						<ul class="swiper-wrapper">
							<c:forEach var="recentsurvey" items="${surveyList}">
							<li class="swiper-slide">
								<div class="pack-down-center gap-12">
									<div class="chart small" data-percent="75">
										<span class="point">
											<strong class="fs-20 fc-blue counter-up">${recentsurvey.MBS_SCORE}</strong>
										</span>
									</div>
									<p class="fs-14 fw-600 fc-body">${recentsurvey.MB_NAME}</p>
								</div><!-- //.pack-down-center -->
							</li>
							</c:forEach>
						</ul>
						<div class="swiper-pagination"></div>
					</div><!-- #recOPH -->
				</section>
				
				<section class="bg-fff out-cont pack-down gap-32">
					<div class="pack-both">
						<h2 class="section-title fc-000">인기상승 영양제🔥</h2>
					</div>
					<div class="list-wrap">
						<ol class="rank-list">
							<c:forEach var="top5pill" items="${top5list}">
							<li>
								<a href="${path}/drug_detailAction.do?dr_id=${top5pill.DR_ID}" class="item rank pack-both">
									<div class="pack-left drug-wrap">
										<div class="img-wrap s68">
											<c:choose>
												<c:when test="${fn:contains(top5pill.DR_SUNGSANG, '분말')}">
													<img src="${path}/resources/images/drug_type/01.png" alt="분말">
												</c:when>
												<c:when test="${fn:contains(top5pill.DR_SUNGSANG, '원형캡슐')}">
													<img src="${path}/resources/images/drug_type/02.png" alt="원형캡슐">
												</c:when>
												<c:when test="${fn:contains(top5pill.DR_SUNGSANG, '원형정제')}">
													<img src="${path}/resources/images/drug_type/03.png" alt="원형정제">
												</c:when>
												<c:when test="${fn:contains(top5pill.DR_SUNGSANG, '제피정제')}">
													<img src="${path}/resources/images/drug_type/04.png" alt="제피정제">
												</c:when>
												<c:when test="${fn:contains(top5pill.DR_SUNGSANG, '젤리')}">
													<img src="${path}/resources/images/drug_type/05.png" alt="젤리">
												</c:when>
												<c:when test="${fn:contains(top5pill.DR_SUNGSANG, '액상')}">
													<img src="${path}/resources/images/drug_type/06.png" alt="유동성 액체">
												</c:when>
												<c:when test="${fn:contains(top5pill.DR_SUNGSANG, '경질캡슐')}">
													<img src="${path}/resources/images/drug_type/07.png" alt="경질캡슐">
												</c:when>
												<c:otherwise>
													<img src="${path}/resources/images/drug_type/03.png" alt="정제">
												</c:otherwise>
											</c:choose>
										</div>
										<p class="item-title">${top5pill.MBD_DRUG_NAME}</p>
									</div>

									<p class="pack-down-center heart-wrap">
										<i class="ico heart small active"><!-- [D] heart.active 확인 -->
											<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
												<path data-name="좋아요" d="m8919.206-76.941-1.99-2.034a4.868 4.868 0 0 1 0-6.779 4.616 4.616 0 0 1 6.634 0l1.991 2.034 1.989-2.034a4.622 4.622 0 0 1 6.636 0 4.869 4.869 0 0 1 0 6.781l-1.989 2.033-6.635 6.779z" transform="translate(-8915.842 88.66)"></path>
											</svg>
										</i>
										<span class="fc-body fw-600 counter-up">${top5pill.CNT_MEMBER}</span>
									</p>
								</a><!-- .item.rank -->
							</li>
							</c:forEach>
						</ol>
					</div><!-- //.list-wrap -->
				</section>
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
	
	<%@ include file="loading.jsp" %><!-- 약속 로딩 -->
	<!-- === Chatbot Widget === -->
	<%@ include file="chat-widget.jspf" %>

<script src="${path}/resources/js/lib/swiper-bundle.js"></script>

<script>
	var recOPH = new Swiper('#recOPH', {
		slidesPerView: 3.6,
		spaceBetween: 0,
		scrollbar: {
			el: '#recOPH .swiper-scrollbar',
			hide: true,
		},
		// Responsive breakpoints
		breakpoints: {
			// when window width is <= 640px (desk)
			475: {
				slidesPerView: 4.6
			}
		}
	});
	recOPH.init();
</script>
</body>
</html>