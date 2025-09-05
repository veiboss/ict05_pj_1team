<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<!-- PC 컨텐츠 -->
		<%@ include file="../common/pc_left.jsp" %>
		<!-- PC 컨텐츠 끝 -->
		
		<div id="container" class="lines">
		<!-- [D] HEADER VIEW :  no class /.lines(2) / .only-back(1) / .only-close(1) -->
			<!-- header 시각 -->
			<%@ include file="../common/header.jsp" %>
			<!-- header 끝 -->
		
			
			<!-- 컨텐츠 시작 -->
			<!-- SID : aq10 -->
			<div id="content" class="aq10"><!-- [D] main / sub-main / sub && pagd name -->
				<h1 class="page-title">FAQ - 자주 묻는 질문</h1>
				<div class="section list-wrap">
					<ul class="data-list">
					<c:forEach items="${list}" var="dto">
						<li class="accordion">
							<div class="item normal">
								<a href="javascript:void(0);" class="pack-both accordion-switche" title="게시물 열고/닫기">
									<div class="text-wrap">
										<p class="fs-18 fw-700">${dto.fa_title}</p>
									</div>
									<i class="ico accordion"></i>
								</a>
								<div class="accordion-content fs-16 fc-dark-gray">
									${dto.fa_content}
								</div><!-- // .accordion-content -->
							</div><!-- // .item -->
						</li>
					</c:forEach>
					</ul>
					
					<div class="pagination">
						<!-- 페이징처리 -->
						<!-- 이전 버튼 활성화 -->
						<c:if test="${paging.startPage > paging.pageBlock}">
							<a href="${path}/faq_user_list.fc?pageNum=${paging.prev}" class="btn prev">
								<svg xmlns="http://www.w3.org/2000/svg" class="svg">
									<path d="m2 6 6-4.33v8.66L2 6z" />
								</svg>
							</a>
						</c:if>
						
						<!-- 페이지 번호 활성화 -->
						<ul>
							<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
								<li class="<c:if test='${num == paging.currentPage}'>current</c:if>">
									<a href="${path}/faq_user_list.fc?pageNum=${num}" class="btn">${num}</a>
								</li>
							</c:forEach>
						</ul>
						
						<!-- 다음 버튼 활성화 -->
						<c:if test="${paging.endPage < paging.pageCount}">
							<a href="${path}/faq_user_list.fc?pageNum=${paging.next}" class="btn next">
								<svg xmlns="http://www.w3.org/2000/svg" class="svg">
									<path d="m2 6 6-4.33v8.66L2 6z" />
								</svg>
							</a>
						</c:if>
					</div><!-- // .pagination -->
					
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

	<%@ include file="../common/loading.jsp" %><!-- 약속 로딩 -->

	<script>
	  document.addEventListener('DOMContentLoaded', function () {
	    if (window.AOS) AOS.init();
	    if (window.nav) { nav.init(); nav.current('4'); }
	    if (window.accordion) { accordion(1); }   // 아래에서 정의할 함수
	  });
	</script>
</body>
</html>