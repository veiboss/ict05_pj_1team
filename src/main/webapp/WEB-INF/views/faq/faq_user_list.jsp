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
<title>FAQ 회원 목록</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/yaksok.css">

<!--  js -->
<script src="https://kit.fontawesome.com/d7162d59a4.js"
	crossorigin="anonymous"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/jquery-3.2.1.min.js" defer></script>
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>


</head>
<body>
	<div class="skip-nav">
		<a href="#nav">내비게이션 바로가기</a>
		<a href="#content">본문 바로가기</a>
		<a href="#header">헤더 바로가기</a>
	</div>

	<div id="wrap" class="wrap">
		<div class="pc-content">
			<div class="typing-wrap" data-aos="fade-right">
				<p class="typing-fix">
					약을 쏘옥,<br>
					약속
				</p>
				<p class="typing">
					<span id="pcTyping">믿음까지 쏘옥 담아</span>
					<span id="pcTyping2">약속할께요</span>
				</p>
			</div>
		</div>

		<div id="container" class="lines"><!-- [D] HEADER VIEW :  no class /.lines(2) / .only-back(1) / .only-close(1) -->
			<header id="header">
				<h1>
					<a href="index.html"><span class="logo"><span class="blind">약을 쏘옥</span></span></a>
				</h1>

				<div class="btns">

				</div>

				<div class="detail-line">
					<button type="button" class="btn back">
						<i class="ico back"><span>뒤로</span></i>
					</button>

					<button type="button" class="btn close">
						<i class="ico close"><span>닫기</span></i>
					</button>
				</div>
			</header>


			<!-- SID : AQ10 -->
			<div id="content" class="aq10"><!-- [D] main / sub-main / sub && pagd name -->
				<h1 class="page-title">FAQ 회원 게시판</h1>
				<div class="section list-wrap">
					<ul class="data-list">
						<li class="accordion">
							<div class="item normal">
								<a href="javascript:void(0);" class="pack-both accordion-switche" title="게시물 열고/닫기">
									<div class="text-wrap">
										<p class="article-type">서비스 이용</p>
										<p class="item-title">이 게시물을 다른 사람에게 공유하고 싶어요.</p>
									</div>
									<i class="ico accordion"></i>
								</a>

								<div class="accordion-content">
									<p>
										게시물 우측 하단의 '공유하기' 버튼 클릭 시 해당 게시물의 링크복사 또는 기타 앱을 통해 바로 공유가 가능합니다.
										</p>
								</div><!-- // .accordion-content -->
							</div><!-- // .item -->
						</li>
						
						<li class="accordion">
							<div class="item normal">
								<a href="javascript:void(0);" class="pack-both accordion-switche" title="게시물 열고/닫기">
									<div class="text-wrap">
										<p class="article-type">회원 관련</p>
										<p class="item-title">계정이 정지되었어요.</p>
									</div>
									<i class="ico accordion"></i>
								</a>

								<div class="accordion-content">
									<p>
									서비스에서 적절하지 않은 활동을 하였을 경우, 계정이 일시적으로 정지될 수 있습니다.<br>
									이의 신청은 [마이 &gt; 서비스 이용 '문의하기']를 통해 진행해 주세요.
										</p>
								</div><!-- // .accordion-content -->
							</div><!-- // .item -->
						</li>
						
						<li class="accordion">
							<div class="item normal">
								<a href="javascript:void(0);" class="pack-both accordion-switche" title="게시물 열고/닫기">
									<div class="text-wrap">
										<p class="article-type">회원 관련</p>
										<p class="item-title">휴대폰 인증 문자가 오지 않습니다.</p>
										<p class="data-wrap"></p>
									</div>
									<i class="ico accordion"></i>
								</a>

								<div class="accordion-content">
									<p>
									인증번호는 휴대폰 SMS 또는 카카오 알림톡으로 발송됩니다.<br>
									인증 문자가 도착하지 않은 경우 [마이 &gt; 서비스 이용 '문의하기']를 통해 문의해주세요.
										</p>
								</div><!-- // .accordion-content -->
							</div><!-- // .item -->
						</li>
						<li class="accordion">
							<div class="item normal">
								<a href="javascript:void(0);" class="pack-both accordion-switche" title="게시물 열고/닫기">
									<div class="text-wrap">
										<p class="article-type">서비스 관련</p>
								<p class="item-title">서비스를 매번 검색해서 들어오기 불편해요. 앱은 따로 없나요?</p>
								<p class="data-wrap"></p>
									</div>
									<i class="ico accordion"></i>
								</a>

								<div class="accordion-content">
									<p>
									'독립은 처음이라'는 현재 웹 페이지로 운영되고 있습니다.<br>
									웹페이지를 모바일 홈 화면에 추가할 경우 더욱 빠르게 접속이 가능합니다. 서비스 이용가이드(링크) 내 '독립은 처음이라'를 홈 화면에 추가하는 법(링크)을 참고해주세요!
									</p>
								</div><!-- // .accordion-content -->
							</div><!-- // .item -->
						</li>
						<li class="accordion">
							<div class="item normal">
								<a href="javascript:void(0);" class="pack-both accordion-switche" title="게시물 열고/닫기">
									<div class="text-wrap">
										<p class="article-type">서비스 관련</p>
								<p class="item-title">서비스 운영 정책에 대해 알고싶어요.</p>
									</div>
									<i class="ico accordion"></i>
								</a>

								<div class="accordion-content">
									<p>
									서비스의 기본 운영 방침 및 분류 별 상세 정책은 <strong>서비스 운영정책(링크)</strong>를 참고해주세요!
									</p>
								</div><!-- // .accordion-content -->
							</div><!-- // .item -->
						</li>
						<li class="accordion">
							<div class="item normal">
								<a href="javascript:void(0);" class="pack-both accordion-switche" title="게시물 열고/닫기">
									<div class="text-wrap">
										<p class="article-type">서비스 관련</p>
								<p class="item-title">'독립은 처음이라'는 어떤 서비스인가요?</p>
									</div>
									<i class="ico accordion"></i>
								</a>

								<div class="accordion-content">
									<p>
									독립을 하고있는, 독립을 준비 중인, 독립에 관심있는 사람이라면 누구나 즐길 수 있는 커뮤니티 서비스입니다.<br>
									'독립은 처음이라'를 더 자세히 알고 싶으시다면 <strong>브랜드 스토리</strong>와 서비스 <strong>이용가이드</strong>를 참고해주세요!
									</p>
								</div><!-- // .accordion-content -->
							</div><!-- // .item -->
						</li>
					</ul>
					
					<div class="pagination">
						<a href="javascript:void(0);" class="prev"><i class="ico page-arr"><span>&lt;</span></i></a>
						<ul>
							<li><a href="javascript:void(0);">1</a></li>
							<li><a href="javascript:void(0);">2</a></li>
							<li class="current"><a href="javascript:void(0);">3</a></li>
							<li><a href="javascript:void(0);">4</a></li>
							<li><a href="javascript:void(0);">5</a></li>
						</ul>
						<a href="javascript:void(0);" class="next"><i class="ico page-arr"><span>&gt;</span></i></a>
					</div><!-- .pagination -->
				</div><!-- .section.list-wrap -->

			</div><!-- // #content -->

			<nav id="nav" class="nav">
				<ul>
					<li>
						<a href="/#">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
								<path d="M225.3 2492.374v6.247a4.691 4.691 0 0 1-4.689 4.684H218v-4.686a2.6 2.6 0 0 0-5.21 0v4.686h-2.6a4.692 4.692 0 0 1-4.689-4.684v-6.247a4.667 4.667 0 0 1 1.748-3.65l5.21-4.189a4.722 4.722 0 0 1 5.88 0l5.21 4.189a4.664 4.664 0 0 1 1.751 3.65z" transform="translate(-205.396 -2483.404)" />
							</svg>
							<span>홈</span>
						</a>
					</li>
					<li>
						<a href="#">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
								<path d="M13.5361 15.3037L10.6748 18.1631C9.54326 19.2971 7.97959 20 6.25 20C2.79781 20 0 17.2022 0 13.75C2.63599e-05 12.0204 0.702974 10.4567 1.83691 9.3252L4.69629 6.46387L13.5361 15.3037ZM13.75 0C17.2022 0 20 2.79781 20 6.25C20 7.95156 19.3156 9.49263 18.2119 10.6191L18.2178 10.625L15.3037 13.5361L6.46387 4.69629L9.375 1.78223L9.38184 1.78809C10.5083 0.684593 12.0474 2.6072e-05 13.75 0Z" />
							</svg>
							<span>영양제</span>
						</a>
					</li>
					<li>
						<a href="#">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
								<path d="M513.5 2780.447v10.526a.515.515 0 0 1-.326.485.461.461 0 0 1-.2.042.533.533 0 0 1-.379-.158l-1.905-1.948h-9.295a3.688 3.688 0 0 1-3.684-3.684h7.895a5.265 5.265 0 0 0 5.263-5.263v-3.527a3.692 3.692 0 0 1 2.631 3.527zm-4.211 0v-5.263a3.688 3.688 0 0 0-3.684-3.684h-8.421a3.688 3.688 0 0 0-3.684 3.684v10.526a.514.514 0 0 0 .326.484.458.458 0 0 0 .2.042.534.534 0 0 0 .379-.158l1.905-1.947h9.295a3.689 3.689 0 0 0 3.684-3.684z" transform="translate(-493.5 -2771.5)" />
							</svg>
							<span>Q&amp;A</span>
						</a>
					</li>
					<li>
						<a href="#">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
								<path d="M690.153 2704.763a5.349 5.349 0 1 1 5.348 5.263 5.312 5.312 0 0 1-5.348-5.263zm11.73 6.391a10.678 10.678 0 0 0-3.765.229 5.475 5.475 0 0 1-5.234 0 10.768 10.768 0 0 0-3.765-.229 4.759 4.759 0 0 0-3.618 4.626v1.064a3.676 3.676 0 0 0 .527 1.9 1.606 1.606 0 0 0 1.374.755h16.2a1.6 1.6 0 0 0 1.374-.756 3.67 3.67 0 0 0 .527-1.9v-1.064a4.757 4.757 0 0 0-3.62-4.626z" transform="translate(-685.5 -2699.5)" />
							</svg>
							<span>마이</span>
						</a>
					</li>
				</ul>

				<a id="btnTop" class="btn bdr-blue medium circle shadow" href="#content">
					<i class="ico top"><span>처음으로</span></i>
				</a>
			</nav>

		<!-- footer -->
			<footer id="footer" class="footer">
				<div class="footer-menu">
					<a href="../etc/brand.html" class="btn transparent">약속 소개</a>
					<a href="../cs/faq.html" class="btn transparent">FAQ</a>
				</div>
				<div class="com-info">
					<p>YAKSOK</p>
					<p>
						서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)
					</p>
					<p>대표 김민우 · 정연우 · 최민진</p>
					<p>김주연 · 박미리 · 이경욱 · 옥채은 · 김동관</p>
					<p>문의 <a href="mailto:finalbossveigar1@gmail.com">finalbossveigar1@gmail.com</a></p>
				</div>
				<p class="copyright">
					Copyright 2025. ICT05TEAMONE Inc.<br>
					All Rights Reserved.
				</p>
			</footer>
			
		</div><!-- // #container -->
	</div><!-- // #wrap -->

	<div id="loading" class="loading">
		<img src="../@resource/images/common/loading.svg" alt="loading">
	</div><!-- // #loading -->

	<script>
	  document.addEventListener('DOMContentLoaded', function () {
	    if (window.AOS) AOS.init();
	    if (window.nav) { nav.init(); nav.current('4'); }
	    if (window.accordion) { accordion(1); }   // 아래에서 정의할 함수
	  });
	</script>
</body>
</html>