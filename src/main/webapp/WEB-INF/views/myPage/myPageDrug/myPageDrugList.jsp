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

<!--  js -->

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
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
					<h3 class="section-title">내 영양제 목록</h3>
					<span></span>
			            <a href="drug_list.do" class="btn linkline" style="padding:8px 0">내 영양제 추가</a>
			    </div>
			    <!-- <hr class="out-cont section-bar"> -->
				<ul class="data-list toon">
					<c:forEach var="dto" items="${list}">
					<li>
						<a href="${path}/drug_detailAction.do?dr_id=${dto.dr_id}" class="item thumb-left">
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
								
								<p class="small-title">${dto.mbd_drug_name}</p>
								
								<p class="data-wrap pack-both">
									<span class="">${dto.mbd_drug_effect}</span>
									</p>
								<%-- 	
								<div id="drug-item" class="data-wrap pack-both">
									<span> </span>
									<p class="pack-left">
										<input type="hidden" name="dr_id" value="${dto.dr_id}">
										<button type="submit" class="btn blue small r4 add-btn" data-drid="${dto.dr_id}">
											내약추가
										</button>
									</p>
								</div> --%>
							</div>
						</a><!-- .item.thumb-left -->
					</li>
			    </c:forEach>
				</ul>
			</div>
			<!-- nav 시작 -->
			<%@ include file="../../common/nav.jsp" %>
			<!-- nav 끝 -->
		
			<!-- footer 시작 -->
			<%@ include file="../../common/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container -->
	</div><!-- // #wrap -->
</body>
</html>