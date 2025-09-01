<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<!-- menu 시작 -->
		<%@ include file="../admin/aside.jsp" %>
		<!-- menu 끝 -->
		
		<!-- header 시작 -->
		<%@ include file="../admin/header.jsp" %>
		<!-- header 끝 -->

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
							<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.fa_id}</td>
									<td>${dto.fa_writer_id}</td>
									<td>${dto.fa_title}</td>
									<td>${dto.fa_reg_date}</td>
									<td>${dto.fa_show}</td>
									<td data-th="버튼" style="text-align:center;"><a
									href="${path}/faq/edit/${dto.fa_id}" class="btn small normal"
									style="margin: 10px 0;">수정</a>
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

					<!-- 등록 버튼 영역 -->
					<div class="button-area"
						style="margin: 20px 0; text-align: center;">
						<a href="faq_insert.fc" class="btn large color1">글등록</a>
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