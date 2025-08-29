<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="https://kit.fontawesome.com/d7162d59a4.js" crossorigin="anonymous"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
</head>
<body>
	<div id="wrap" class="wrap">
		<!-- PC 컨텐츠 -->
		<%@ include file="pc_left.jsp" %>
		<!-- PC 컨텐츠 끝 -->
		
		<div id="container" class="lines">
		<!-- [D] HEADER VIEW :  no class /.lines(2) / .only-back(1) / .only-close(1) -->
			<!-- header 시각 -->
			<%@ include file="header.jsp" %>
			<!-- header 끝 -->
		
			
			<!-- 컨텐츠 시작 -->
			<!-- SID : COM000 -->
			<div id="content" class="sub"><!-- [D] main / sub-main / sub && pagd name -->
			
				<h1 class="page-title">페이지 제목</h1>
				<p>
				<br>
				<br>
				<br>
				</p>

				<!-- 회색바 -->
				<hr class="out-cont section-bar">

				<section class="section">
					<h2 class="section-title">섹션제목</h2>
					<p>내용</p>
				</section>

				<hr class="out-cont section-bar">

				<section class="section list-wrap">
					<h2 class="section-title">검색바 + 목록</h2>
					<p>&nbsp;</p>
					
					<div class="search-bar">
						<!--[D] 검색폼  -->
						<form action="result.html" class="search-form">
							<fieldset>
								<legend class="blind">통합 검색</legend>
								<div class="search-box pack-both r4">
									<select class="select">
										<option value="" disabled selected>조건 선택</option>
										<option>조건1</option>
										<option>조건2</option>
									</select>

									<input type="search" class="input-text r4" placeholder="검색어를 입력해주세요" autocomplete="off">
									
									<div class="autocomplete r4">
										<ul>
											<li>
												<a href="javascript:void(0);" class="item"><span class="keyword-match">생활</span>꿀팁</a>
											</li>
											<li>
												<a href="javascript:void(0);" class="item">#서핑동호회</a>
											</li>
											<li>
												<a href="javascript:void(0);" class="item">#추천해시태그</a>
											</li>
										</ul>
									</div>
									<button type="submit" class="btn"><strong>검색</strong></button>
								</div>
							</fieldset>
						</form>
					</div><!-- .pack-both -->

					<ul class="data-list">
						<li>
							<div class="item normal">
								<a href="qna_view.html" class="pack-down">
									<p class="data-wrap mdot">
										<i class="ico-bg blue r10"><span>Q</span></i>
										<!-- [D] 답변 전 -->
										<span class="q-ing">궁금해요</span>
										<!-- <span class="q-solved">궁금증해결</span> -->

										<span>2025. 08. 27</span>
									</p>

									<p class="item-title">질문 제목 길어도 다 노출하는게 좋겠죠? 질문 제목 길어도 다 노출하는게 좋겠죠?질문 제목 길어도 다 노출하는게 좋겠죠?질문 제목 길어도 다 노출하는게 좋겠죠?</p>

									<!-- [D] 약에 관한 질문일 경우 -->
									<div class="pack-left">
										<div class="item pack-left r10">
											<div class="img-wrap s48">
												<img src="${path}/resources/images/drug_type/01.png" alt="분말" class="centered">
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
												<p class="fs-14">제목, 약 이름이 얼마나 길줄 모르겠네요요요 </p>
											</div>
										</div><!-- .item.thumb-left -->
									</div><!-- .pack-left -->
								</a><!-- .pack-down -->

								<div class="pack-both">
									<div class="pack-left">
										<div class="img-wrap circle s36">
											<img src="https://cdn.pixabay.com/photo/2014/11/29/19/33/bald-eagle-550804_960_720.jpg" alt="프로필아이디" class="centered">
										</div>
										<div class="user">
											<span class="user-name">김모모</span>
										</div>
									</div>

									<!-- [D] 답변안된 질문 중, 전문가만 노출 -->
									<button type="button" class="btn bdr-blue small r4" onclick="modalOpen('#popAnswer')">답변등록</button>
								</div><!-- .pack-both -->
							</div><!-- .item.normal -->
						</li>
						<li>
							<div class="item normal">
								<a href="qna_view.html" class="pack-down">
									<p class="data-wrap mdot">
										<i class="ico-bg blue r10"><span>Q</span></i>
										<!-- [D] 답변 전 -->
										<!-- <span class="q-ing">궁금해요</span> -->
										<!-- [D] 답변 완료 -->
										<span class="q-solved">궁금증해결</span>

										<span>2025. 08. 27</span>
									</p>

									<p class="item-title">질문 제목 길어도 다 노출하는게 좋겠죠? 질문 제목 길어도 다 노출하는게 좋겠죠?질문 제목 길어도 다 노출하는게 좋겠죠?질문 제목 길어도 다 노출하는게 좋겠죠?</p>


									<!-- [D] 약에 관한 질문일 경우 -->
									<div class="pack-left">
										<div class="item pack-left r10">
											<div class="img-wrap s48">
												<img src="${path}/resources/images/drug_type/01.png" alt="분말" class="centered">
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
												<p class="fs-14">제목, 약 이름이 얼마나 길줄 모르겠네요요요 </p>
											</div>
										</div><!-- .item.thumb-left -->
									</div><!-- .pack-left -->
								</a><!-- .pack-down -->

								<div class="pack-both">
									<div class="pack-left">
										<div class="img-wrap circle s36">
											<img src="https://cdn.pixabay.com/photo/2014/11/29/19/33/bald-eagle-550804_960_720.jpg" alt="프로필아이디" class="centered">
										</div>
										<div class="user">
											<span class="user-name">김모모</span>
										</div>
									</div>
							</div><!-- .item.normal -->
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
				</section><!-- .section.list-wrap -->

				<hr class="out-cont section-bar">

				<section class="section list-wrap">
					<h2 class="section-title">약목록 + 상단 양쪽정렬</h2>
					<p>&nbsp;</p>
					
					<div class="pack-both">
						<div class="pack-left">
							<select class="select">
								<option selected>모든 시리즈</option>
								<option>시리즈명</option>
								<option>시리즈명</option>
							</select>
							<span>버튼자리</span>
						</div>

						<div class="pack-left">
							<span>버튼자리</span>

							<select class="select">
								<option selected>모든 시리즈</option>
								<option>시리즈명</option>
								<option>시리즈명</option>
							</select>
						</div>
					</div><!-- .pack-both -->

					<ul class="data-list toon">
						<li>
							<a href="#" class="item thumb-left">
								<div class="img-wrap s100">
									<img src="${path}/resources/images/drug_type/01.png" alt="분말" class="centered">
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
									<p class="data-wrap flex-wrap">
										<span class="article-type">카테고리</span>
										<span>서브텍스트</span>
									</p>
									<p class="small-title">제목, 약 이름</p>
									<div class="data-wrap pack-both">
										<p>
											양쪽 중 왼쪽컨텐츠
										</p>

										<p class="pack-left">
											<button type="button" class="btn blue small r4">
												버튼명
											</button>
											<button type="button" class="btn bdr-blue small r4">
												버튼명
											</button>
										</p>
									</div>
								</div>
							</a><!-- .item.thumb-left -->
						</li>
						<li>
							<a href="#" class="item thumb-left">
								<div class="img-wrap s100">
									<img src="${path}/resources/images/drug_type/05.png" alt="젤리" class="centered">
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
				</section><!-- .section.list-wrap -->

				<hr class="out-cont section-bar">

				<section class="section">
					<h2 class="section-title">로딩</h2>
					<p class="button-area ta-c">
						<button type="button" class="btn bdr-gray medium" onclick="loadingActive()">로딩 열기</button>
					</p>
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
</body>
</html>