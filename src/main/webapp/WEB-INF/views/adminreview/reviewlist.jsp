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
<title>약쏙 관리자</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/yaksokAd.css">

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/yaksokAd.js" defer></script>
 <script>
        $(document).ready(function(){
            function loadReviews(page = 1){
                $.ajax({
                    type: "GET",
                    url: "reviewAjax.ad",
                    data: { keyword: $("#keyword").val(), pageNum: page },
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
<body>
	<div class="skip-nav"><a href="#content">본문 바로가기</a></div>

	<div id="wrap" class="frame">
		<!-- menu 시작 -->
		<%@ include file="../admin/aside.jsp" %>
		<!-- menu 끝 -->
		
		<!-- header 시작 -->
		<%@ include file="../admin/header.jsp" %>
		<!-- header 끝 -->
		
		<div id="container" class="container">
			<!-- 컨텐츠 시작 -->
			
			
			<div class="title-bar">
				<h2 class="page-title ellipsis">영양제 후기 관리</h2>
			</div>
			

			<main id="content">
				 <form id="searchForm">
			        <input type="text" name="keyword" id="keyword" placeholder="검색어 입력">
			        <button type="submit">검색</button>
			    </form>
			
			    <!-- 검색 결과 들어올 div -->
			    <div id="searchResult"></div>
			    
				
			</main>
			
			<!-- 컨텐츠 끝 -->
			
			
			<!-- footer 시작 -->
			<%@ include file="../admin/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container  -->
	</div><!-- // #wrap  -->
</body>
</html>