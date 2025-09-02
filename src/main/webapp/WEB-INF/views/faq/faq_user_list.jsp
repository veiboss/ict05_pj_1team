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

			<!-- nav 시작 -->
			<%@ include file="../common/nav.jsp" %>
			<!-- nav 끝 -->
		
			<!-- footer 시작 -->
			<%@ include file="../common/footer.jsp" %>
			<!-- footer 끝 -->

	
			
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