<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>FAQ 관리자 목록</title>

<!-- css -->
<link rel="icon" href="${path}/resources/images/logo/favi_ad.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/yaksokAd.css">

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/jquery-3.2.1.min.js"></script>
<script src="${path}/resources/js/yaksokAd.js" defer></script>
</head>
<body class="">
		<div class="skip-nav"><a href="#content">본문 바로가기</a></div>

		<div id="wrap" class="frame">
		<aside id="aside" class="aside">
			<h1><img src="../@resource/images/logo/finger@2x.png" class="logo" alt="TeamOne"></h1>
			<nav id="nav" class="aside-nav">
				<ul>
					<!-- 단일 메뉴  -->
					<li>
						<a href="javascript:void(0);">
							<span class="material-symbols-outlined">pill</span>
							<span>영양제</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0);">
							<span class="material-symbols-outlined">user_attributes</span>
							<span>회원</span>
						</a>
					</li>
					<!-- 서브 메뉴가 있을 경우  -->
					<li>
						<a href="javascript:void(0);" class="toggle-sub">
							<span class="material-symbols-outlined">view_list</span>
							<span>게시판</span>
						</a>
						<ul>
							<li>
								<a href="javascript:void(0);"><span>QnA</span></a>
							</li>
							<li>
								<a href="javascript:void(0);"><span>FAQ</span></a>
							</li>
							<li>
								<a href="javascript:void(0);"><span>후기</span></a>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
		</aside>

		<header id="header" class="header">
			<div>
				<button type="button" class="btn toggle-nav">
					<span class="material-symbols-outlined">
						arrow_circle_left
					</span>
				</button>
			</div><!-- #header > div : left-->

			<div>
				<div class="user">
					<ul>

						<li>
							<button type="button" class="btn btn-toggle">
								<img src="https://img.imbc.com/adams/Program/20237/133342330004430266.jpg" alt="{user name}" class="img profile">
							</button>
							<div class="toggle-cont">
								<ul>
									<li>
										<div class="item pack-left">
											<img src="https://img.imbc.com/adams/Program/20237/133342330004430266.jpg" alt="{user name}" class="img profile">
											<div>
												<p>Hong Gil Dong</p>
												<p class="fs-s">admin</p>
											</div>
										</div>
									</li>
									<li>
										<a href="javascript:void(0);" class="btn">
											<span class="material-symbols-outlined">
												account_circle
											</span>
											<span>계정 관리</span>
										</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="btn">
											<span class="material-symbols-outlined">
											logout
											</span>
											<span>로그아웃</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div><!-- #header > div : right-->
		</header>

		<div id="container" class="container">
			<div class="title-bar">
				<h2 class="page-title ellipsis">FAQ 관리자 게시판</h2>
			</div>

			<main id="content">
				<div id="search" class="search box-wrap">
					<form>
						<fieldset>
							<legend class="blind">검색</legend>
							<div class="field insert">
								<input type="text" id="searchTxt" class="input-text medium"
									title="검색어" placeholder="검색어를 입력해 주세요">
							</div>

							<div class="button-area pack-left">
								<button type="button" class="btn medium color1">검색</button>
							</div>
						</fieldset>
					</form>
				</div>

				<section class="box-wrap">
					<table class="data-table">
						<thead>
							<tr>
								<th>번호</th>
								<th>작성자</th>
								<th>제목</th>
								<th>작성일</th>
								<th>공개여부</th>
								<th>버튼</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td data-th="번호">101</td>
								<td data-th="성명">박미리</td>
								<td data-th="제목">비밀번호 변경은 어떻게 하나요?</td>
								<td data-th="등록일">2017-04-26 16:50</td>
								<td data-th="공개여부"><select class="select small">
										<option value="1" selected="">공개</option>
										<option value="0">비공개</option>
								</select></td>
								<td data-th="버튼">
									<button class="btn small normal">수정</button>
									<button class="btn small accent">삭제</button>
								</td>
							</tr>

							<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.pdNo}</td>
									<td>${dto.pdName}</td>
									<td>${dto.pdBrand}</td>

									<!-- upload 폴더를 새로고침, 브라우저도 새로고침해야 깨진 이미지가 제대로 보임 -->
									<td><img src="${dto.pdImg}" width="100px"></td>
									<td>${dto.pdCategory}</td>
									<td>${dto.pdPrice}</td>
									<td>${dto.pdQuantity}</td>
									<td>${dto.pdContent}</td>
									<td>${dto.pdStatus}</td>
									<td>${dto.pdIndate}</td>
									<td>
										<center>
											<input class="inputButton" type="button" value="수정"
												onclick="window.location='${path}/ad_product_detailAction.pd?pdNo=${dto.pdNo}&pageNum=${paging.pageNum}'">
										</center>
									</td>

									<td>
										<center>
											<input class="inputButton" type="button" value="삭제"
												onclick="window.location='${path}/ad_product_deleteAction.pd?pdNo=${dto.pdNo}'">
										</center>
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

					<!-- 등록 버튼 영역 -->
					<div class="button-area"
						style="margin: 20px 0; text-align: center;">
						<a href="${path}/faq/write" class="btn large color1">글등록</a>
					</div>



					<div class="pagination">
							<a href="javascript:void(0);" class="btn prev">
								<svg xmlns="http://www.w3.org/2000/svg" class="svg">
									<path d="m2 6 6-4.33v8.66L2 6z"></path>
								</svg>
							</a>
							<ul>
								<li class="current"><a href="javascript:void(0);" class="btn">1</a></li>
								<li><a href="javascript:void(0);" class="btn">2</a></li>
								<li><a href="javascript:void(0);" class="btn">3</a></li>
								<li><a href="javascript:void(0);" class="btn">4</a></li>
								<li><a href="javascript:void(0);" class="btn">5</a></li>
							</ul>
							<a href="javascript:void(0);" class="btn next">
								<svg xmlns="http://www.w3.org/2000/svg" class="svg">
									<path d="m2 6 6-4.33v8.66L2 6z"></path>
								</svg>
							</a>
						</div>
				</section>
			</main>

			<!-- .section.list-wrap -->

		<footer id="footer">
					<address class="copyright">©TeamOne</address>
					<p>허가없는 해당 사이트의 접근은 민.형사상 처벌을 받을 수 있습니다.</p>
				</footer>
			</div><!-- // #container  -->
		</div><!-- // #wrap  -->
	

</body>
</html>