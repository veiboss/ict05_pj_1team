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
<link rel="stylesheet" href="${path}/resources/css/drug/list.css">

<!--  js -->

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
 <script>
        $(document).ready(function(){
            function loadReviews(page = 1){
                $.ajax({
                    type: "GET",
                    url: "drugSearchAjax.do",
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
				<h1 class="page-title">영양제 검색</h1><br>

				<div id="searchForm" class="search-bar">
					<!--[D] 검색폼  -->
					<form action="drug_list.jsp" class="search-form">
						<fieldset>
							<legend class="blind">통합 검색</legend>
							<div class="search-box pack-both r4">
								<input type="search" id="searchTxt" class="input-text r4" placeholder="검색어를 입력해주세요" autocomplete="off">
								<button type="submit" class="btn search">검색</button>
							</div>
						</fieldset>
					</form>
				</div> <!-- .pack-both -->
				<section class="box-wrap">
			    	<div id="searchResult"></div>
				</section> 	
			</div>
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