<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>영양제 검색</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/yaksok.css">
<link rel="stylesheet" href="${path}/resources/css/drug/search.css">

<!--  js -->

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
</head>
<body>
	<div id="wrap" class="wrap">
		<!-- PC 컨텐츠 -->
		<%@ include file="../common/pc_left.jsp" %>
		<!-- PC 컨텐츠 끝 -->
		
		<div id="container" class="lines">
		<!-- [D] HEADER VIEW :  no class /.lines(2) / .only-back(1) / .only-close(1) -->
			<!-- header 시각 -->
			<%@ include file="../common/header.jsp" %>
			<!-- header 끝 -->
		
			<!-- 검색창 시작 -->
			<!-- SID : PL20 -->
			<div id="content" class="pl20"><!-- [D] main / sub-main / sub && pagd name -->
				<h1 class="page-title">영양제 검색</h1>

				<div class="section list-wrap">
					<div class="search-bar">
						<!--[D] 검색폼  -->
						<form action="result.html" class="search-form">
							<fieldset>
								<legend class="blind">통합 검색</legend>
								<div class="search-box pack-both r4">
									<input type="search" class="input-text r4" placeholder="검색어를 입력해주세요" autocomplete="off">
									<button type="submit" class="btn"><strong>검색</strong></button>
								</div>
							</fieldset>
						</form>
					</div> <!-- .pack-both -->
					
				<!-- SID : PL20 -->
			<div id="content" class="pl20"><!-- [D] main / sub-main / sub && pagd name -->

				<div class="section list-wrap">
					</div><!-- .pack-both -->

					<ul class="data-list toon">
						<li>
							<a href="#" class="item thumb-left">
								<div class="img-wrap s100">
									<img src="/ict05/resources/images/drug_type/01.png" alt="분말" class="centered">
									<!--
										01	분말, 
										02	원형캡슐, 
										03	원형정제, 
										04	제피정제, 
										05	젤리, 
										06	유동성 액체, 
										07	경질캡슐
									-->
								</div>
								<div class="data-content">
									<p class="small-title">제목, 약 이름</p>
									<div class="data-wrap pack-both">
										<p>
											양쪽 중 왼쪽컨텐츠
										</p>

										<p class="pack-left">
											<button type="button" class="btn blue small r4">
												내약추가
											</button>
										</p>
									</div>
								</div>
							</a><!-- .item.thumb-left -->
						</li>
						<li>
							<a href="#" class="item thumb-left">
								<div class="img-wrap s100">
									<img src="../@resource/images/drug_type/05.png" alt="젤리" class="centered">
								</div>
								<div class="data-content">
									<p class="small-title">제목, 약 이름</p>
									<div class="data-wrap pack-both">
										<p>
											양쪽 중 왼쪽컨텐츠
										</p>

										<p class="pack-left">
											<button type="button" class="btn blue small r4">
												내약추가
											</button>
										</p>
									</div>
								</div>
							</a><!-- .item.thumb-left -->
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
					
			</div>
		</div>
	</div>
		
			<!-- 검색창 끝 -->

			<!-- nav 시작 -->
			<%@ include file="../common/nav.jsp" %>
			<!-- nav 끝 -->
		
			<!-- footer 시작 -->
			<%@ include file="../common/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container -->
	</div><!-- // #wrap -->
</body>
</html>