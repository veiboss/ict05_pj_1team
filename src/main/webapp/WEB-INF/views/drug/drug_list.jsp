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

					<div class="search-bar">
						<!--[D] 검색폼  -->
						<form action="drug_list.jsp" class="search-form">
							<fieldset>
								<legend class="blind">통합 검색</legend>
								<div class="search-box pack-both r4">
									<input type="search" class="input-text r4" placeholder="검색어를 입력해주세요" autocomplete="off">
									<button type="submit" class="btn"><strong>검색</strong></button>
								</div>
							</fieldset>
						</form>
					</div> <!-- .pack-both -->
					
					<p class="total"><br>
						<c:if test="${total > 0}">
							<span class="count">총 ${total}</span>
						</c:if>
					</p>
					
					<div class="section list-wrap">
						<ul class="data-list toon">
							<c:forEach var="dto" items="${list}">
							<li>
								<a href="#" class="item thumb-left">
									<%-- <c:if test=""> --%>
									<!-- <div class="img-wrap s100">
										<img src="/ict05/resources/images/drug_type/01.png" alt="분말" class="centered">
										
											01	분말, 
											02	원형캡슐, 
											03	원형정제, 
											04	제피정제, 
											05	젤리, 
											06	유동성 액체, 
											07	경질캡슐
										
									</div> -->
									<%-- </c:if> --%>
									
									<div class="img-wrap s100">
									    <c:forEach var="item" items="${list}">
									        <c:choose>
									            <c:when test="${fn:contains(item.dr_serve_use, '분말')}">
									                <img src="/ict05/resources/images/drug_type/01.png" alt="분말">
									            </c:when>
									
									            <c:when test="${fn:contains(item.dr_serve_use, '원형캡슐')}">
									                <img src="/ict05/resources/images/drug_type/02.png" alt="원형캡슐">
									            </c:when>
									
									            <c:when test="${fn:contains(item.dr_serve_use, '원형정제')}">
									                <img src="/ict05/resources/images/drug_type/03.png" alt="원형정제">
									            </c:when>
									
									            <c:when test="${fn:contains(item.dr_serve_use, '제피정제')}">
									                <img src="/ict05/resources/images/drug_type/04.png" alt="제피정제">
									            </c:when>
									            
									            <c:when test="${fn:contains(item.dr_serve_use, '젤리')}">
									                <img src="/ict05/resources/images/drug_type/04.png" alt="젤리">
									            </c:when>
									            
									            <c:when test="${fn:contains(item.dr_serve_use, '유동성 액체')}">
									                <img src="/ict05/resources/images/drug_type/04.png" alt="유동성 액체">
									            </c:when>
									            
									            <c:when test="${fn:contains(item.dr_serve_use, '경질캡슐')}">
									                <img src="/ict05/resources/images/drug_type/04.png" alt="경질캡슐">
									            </c:when>
									
									            <c:otherwise>
									                <img src="/ict05/resources/images/drug_type/03.png" alt="정제">
									            </c:otherwise>
									        </c:choose>
									    </c:forEach>
									</div>
									
									<div class="data-content">
										
										<p class="small-title">${dto.dr_product}</p>
										
										<p class="data-wrap flex-wrap">
											<span class="article-type">${dto.dr_serve_use}</span>
											</p>
											
										<div class="data-wrap pack-both">
											<span> </span>
											<p class="pack-left">
												<button type="button" class="btn blue small r4">
													내약추가
												</button>
											</p>
										</div>
									</div>
								</a><!-- .item.thumb-left -->
							</li>
							</c:forEach>
						</ul>
					
					<div class="pagination">
						<c:if test="${paging.startPage > 10}">
						<a href="${path}/drug_list.do?pageNum=${paging.prev}" class="prev"><i class="ico page-arr"><span><</span></i></a>
						</c:if>
						<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
						<ul>
							<li><a href="${path}/drug_list.do?pageNum=${num}" 
										class="<c:if test='${num == paging.currentPage}'>active</c:if>">${num}</a></li>
						</ul>
						</c:forEach>
						<c:if test="${paging.endPage < paging.pageCount}">
						<a href="${path}/drug_list.do?pageNum=${paging.next}" class="next"><i class="ico page-arr"><span>></span></i></a>
						</c:if>
					</div>
				</div><!-- .section.list-wrap -->
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