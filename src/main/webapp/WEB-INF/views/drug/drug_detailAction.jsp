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
<title>영양제 상세 페이지</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/yaksok.css">
<link rel="stylesheet" href="${path}/resources/css/drug/list.css">

<!--  js -->

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
<style>
.drug-txt{margin-top: 40px; }
dl.pack-left-top{gap: 0; text-align: left; }
dl.pack-left-top dt{width: 80px; }
dl.pack-left-top dd{width: 100%;}
.review-title{margin-top: 60px; }
</style>
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
		
			<!-- 상세 내용 시작 -->
			<div id="content" class="pl20">
				<h1 class="page-title">영양제 상세 정보</h1>
				<div class="pack-down drug-txt" style="gap: 30px">
					<dl class="pack-left-top">
						<dt>업체명</dt>
						<dd>${dto.dr_enterprise}</dd>
					</dl>
					
					<dl class="pack-left-top">
						<dt>제품명</dt>
						<dd>${dto.dr_product}</dd>
					</dl>
					
					<dl class="pack-left-top">
						<dt>품목번호</dt>
						<dd>${dto.dr_statement_id}</dd>
					</dl>
					
					<dl class="pack-left-top">
						<dt>등록일자</dt>
						<dd>${dto.dr_regist_date}</dd>
					</dl>
					
					<dl class="pack-left-top">
						<dt>유통기한</dt>
						<dd>${dto.dr_expiration_date}</dd>
					</dl>
					
					<dl class="pack-left-top">
						<dt>성상</dt>
						<dd>${dto.dr_sungsang}</dd>
					</dl>
					
					<dl class="pack-left-top">
						<dt>용도</dt>
						<dd>${dto.dr_serve_use}</dd>
					</dl>
					
					<dl class="pack-left-top">
						<dt>주의사항</dt>
						<dd>${dto.dr_intake_hint}</dd>
					</dl>
					
					<dl class="pack-left-top">
						<dt>기능</dt>
						<dd>${dto.dr_main_function}</dd>
					</dl>
					
					<dl class="pack-left-top">
						<dt>보관법</dt>
						<dd>${dto.dr_preservation}</dd>
					</dl>
					
					<dl class="pack-left-top">
						<dt>규격</dt>
						<dd>${dto.dr_base_standard}</dd>
					</dl>
				</div>
				
				<!-- 후기 게시판 -->
				<div id="content" class="pl20">
					<h1 class="page-title review-title">후기 게시판</h1>
					<div class="section list-wrap">
						<ul class="data-list toon">
							<c:forEach var="dto" items="${list}">
							<li>
								<%-- <a href="${path}/drug_detailAction.do?dr_id=${dto.dr_id}" class="item thumb-left"> --%>
								<div class="data-content">
									<p class="small-title">${dto.dr_product}</p>
									<p>${dto.rv_rating}</p>
									<p class="data-wrap flex-wrap">
										<span class="article-type">${dto.rv_content}</span>
									</p>
										
									
								</div>
								<!-- </a>.item.thumb-left -->
							</li>
					    </c:forEach>
						</ul>
						
							<div class="pagination">
							    <!-- 이전 버튼 -->
							    <c:if test="${paging.startPage > 5}">
							        <a href="${path}/drug_reviewList.do?pageNum=${paging.prev}" class="btn prev page-link" data-page="${paging.prev}">
							            &lt;
							        </a>
							    </c:if>
							
							    <!-- 페이지 번호 -->
							    <ul>
							        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
							            <li class="${num == paging.currentPage ? 'current' : ''}">
							                <a href="${path}/drug_reviewList.do?pageNum=${num}" class="btn page-link" data-page="${num}">${num}</a>
							            </li>
							        </c:forEach>
							    </ul>
							
							    <!-- 다음 버튼 -->
							    <c:if test="${paging.endPage < paging.pageCount}">
							        <a href="${path}/drug_reviewList.do?pageNum=${paging.next}" class="btn next page-link" data-page="${paging.next}">
							            &gt;
							        </a>
							    </c:if>
							</div>
						</div><!-- .section.list-wrap -->
					</div>
				</div>
			<!-- 상세 내용 끝 -->

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