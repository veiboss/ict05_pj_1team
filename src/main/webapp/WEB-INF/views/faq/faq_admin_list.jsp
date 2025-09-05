<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="${path}/resources/css/yaksokAd.css">

<!-- css -->
<link rel="icon" href="${path}/resources/images/logo/favi_ad.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/yaksokAd.css">

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/jquery-3.2.1.min.js"></script>
<script src="${path}/resources/js/yaksokAd.js" defer></script>
<script>
        $(document).ready(function(){
            function loadReviews(page = 1){
                $.ajax({
                    type: "GET",
                    url: "faq_admin_ajax.fc",
                    data: { keyword: $("#searchTxt").val(), pageNum: page },
                    success: function(result){
                        $("#searchResult").html(result);
                    }
                });
            }

            // 초기 로딩 시 전체 목록
            loadReviews();

            // 검색 폼 제출
            $("#searchForm").submit(function(e){
                e.preventDefault();
                loadReviews(1);
            });

            // 페이지 이동
            $(document).on("click", ".page-link", function(e){
                e.preventDefault();
                let page = $(this).data("page");
                loadReviews(page);
            });
        });
</script>
</head>
<body class="">
	<div class="skip-nav"><a href="#content">본문 바로가기</a></div>

	<div id="wrap" class="frame">
		<!-- menu 시작 -->
		<%@ include file="../admin/aside.jsp"%>
		<!-- menu 끝 -->

		<!-- header 시작 -->
		<%@ include file="../admin/header.jsp"%>
		<!-- header 끝 -->

		<div id="container" class="container">	
			<!-- 컨텐츠 시작 -->
			<div class="title-bar">
				<div class="pack-left">
					<h2 class="page-title ellipsis">FAQ 관리</h2>
					<a href="${path}/faq_insert.fc" class="btn medium color1">
						<span class="material-symbols-outlined">playlist_add</span>
						<span>새글등록</span>
					</a>
				</div>
			</div>

			<main id="content">
				<div id="searchForm" class="search box-wrap">
					<form>
						<fieldset>
							<legend class="blind">검색</legend>
							<div class="field insert">
								<input type="text" id="searchTxt" class="input-text medium"
									title="검색어" placeholder="검색어를 입력해 주세요">
							</div>
							<div class="button-area pack-left">
								<button type="submit" class="btn medium color1">검색</button>
								<button type="reset" class="btn medium bdr-color1">초기화</button>
							</div>
						</fieldset>
					</form>
				</div>

				<!-- 검색 결과 들어올 div -->
				<section class="box-wrap">
					<div id="searchResult"></div>
				</section>
			</main>
			<!-- 컨텐츠 끝 -->

			<!-- footer 시작 -->
			<%@ include file="../admin/footer.jsp" %>
			<!-- footer 끝 -->
		</div>
		<!-- // #container  -->
	</div>
	<!-- // #wrap  -->

</body>
</html>