<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../common/setting.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
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
<style>
	.list-wrap {margin-top: 40px;}
	.list-wrap .pack-left.col-3		{align-items: flex-start; flex-wrap: wrap; gap: 40px;}
	.list-wrap .pack-left.col-3 li	{width: calc((100% - 80px)/3);}

</style>
<!--  js -->

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
<script>
	$(function() {
		// 내비게이션 선택
		nav.current(4);
	});
</script>
</head>
<body>
	<div id="wrap" class="wrap">
		<!-- PC 컨텐츠 -->
		<%@ include file="../../common/pc_left.jsp" %>
		<!-- PC 컨텐츠 끝 -->
		
		<div id="container" class="lines">
		<!-- [D] HEADER VIEW :  no class /.lines(2) / .only-back(1) / .only-close(1) -->
			<!-- header 시각 -->
			<%@ include file="../../common/header.jsp" %>
			<!-- header 끝 -->
		
			<!-- 검색창 시작 -->
			<!-- SID : PL20 -->
			<div id="content" class="pl20"><!-- [D] main / sub-main / sub && pagd name -->
				<div class="header-line pack-both" style="display:flex; gap:10px;">
					<h3 class="page-title">내 약 목록</h3>

					<a href="drug_list.do" class="btn black small r-full">내 영양제 추가</a>
				</div>
				<!-- <hr class="out-cont section-bar"> -->
				<div class="list-wrap">
					<ul class="pack-left col-3 gap-40">
						<c:forEach var="dto" items="${list}">
						<li class="pack-down-center gap-12">
							<a href="${path}/drug_detailAction.do?dr_id=${dto.dr_id}" class="pack-down-center gap-12">
								<!-- 01	분말, 
								02	원형캡슐, 
								03	원형정제, 
								04	제피정제, 
								05	젤리, 
								06	유동성 액체, 
								07	경질캡슐 -->
								<div class="img-wrap s100">
									<c:choose>
									<c:when test="${fn:contains(dto.dr_sungsang, '분말')}">
										<img src="${path}/resources/images/drug_type/01.png" alt="분말">
									</c:when>
									
									<c:when test="${fn:contains(dto.dr_sungsang, '원형캡슐')}">
										<img src="${path}/resources/images/drug_type/02.png" alt="원형캡슐">
									</c:when>
									
									<c:when test="${fn:contains(dto.dr_sungsang, '원형정제')}">
										<img src="${path}/resources/images/drug_type/03.png" alt="원형정제">
									</c:when>
									
									<c:when test="${fn:contains(dto.dr_sungsang, '제피정제')}">
										<img src="${path}/resources/images/drug_type/04.png" alt="제피정제">
									</c:when>
									
									<c:when test="${fn:contains(dto.dr_sungsang, '젤리')}">
										<img src="${path}/resources/images/drug_type/05.png" alt="젤리">
									</c:when>
									
									<c:when test="${fn:contains(dto.dr_sungsang, '액상')}">
										<img src="${path}/resources/images/drug_type/06.png" alt="유동성 액체">
									</c:when>
									
									<c:when test="${fn:contains(dto.dr_sungsang, '경질캡슐')}">
										<img src="${path}/resources/images/drug_type/07.png" alt="경질캡슐">
									</c:when>
									
									<c:otherwise>
										<img src="${path}/resources/images/drug_type/03.png" alt="정제">
									</c:otherwise>
									</c:choose>
								</div>
								<div class="data-content">
									<p class="fc">${dto.mbd_drug_name}</p>
								</div>
							</a>
				
							<div class="data-wrap">
								<form method="post" action="myPageDrugDelete.do" class="pack-left">
									<input type="hidden" name="dr_id" value="${dto.dr_id}">
									<input type="hidden" name="sessionID" value="${sessionScope.sessionID}">
									<button type="submit" class="btn bdr-blue xsmall r-full">내약 삭제</button>
								</form>
							</div>
						</li>
					</c:forEach>
					</ul>
				</div><!-- .list-wrap -->
			</div>
			<!-- nav 시작 -->
			<%@ include file="../../common/nav.jsp" %>
			<!-- nav 끝 -->
		
			<!-- footer 시작 -->
			<%@ include file="../../common/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container -->
	</div><!-- // #wrap -->
	<!-- === Chatbot Widget === -->
<%@ include file="../../common/chat-widget.jspf" %>
</body>
</html>