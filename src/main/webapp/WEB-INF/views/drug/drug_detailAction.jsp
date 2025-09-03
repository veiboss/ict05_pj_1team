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
<script>
$(document).ready(function() {
    $(".add-btn").click(function() {
        var dr_id = $(this).data("drid"); // 버튼의 data-drid 가져오기

        $.ajax({
            url: '${path}/drug_addAction.do',
            type: 'POST',
            data: { dr_id: dr_id },       // 객체로 보내면 application/x-www-form-urlencoded로 전송
            dataType: 'json',             // JSON 응답 받기
            success: function(response) {
                alert(response.msg);       // Service에서 보낸 메시지 표시
            },
            error: function(xhr, status, error) {
                console.error("에러 상태 :", status);
                console.error("에러 내용 :", error);
                alert("서버 오류가 발생했습니다.");
            }
        });
    });
});
</script>
<style>
.drug-txt{margin-top: 40px; }
dl.pack-left-top{gap: 0; text-align: left; }
dl.pack-left-top dt{width: 80px; }
dl.pack-left-top dd{width: 100%;}
.review-title{margin-top: 60px; }
.data-content{padding: 40px;}
.small-title, .article-type{margin-top:15px;}
.rv-name{margin-top:30; color:grey;}
.img-wrap.s100{width: 100%; max-width: 375px; margin: 0 auto;}
.rv-list{padding: 20px;}
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
				<input type="hidden" name="dr_id" value="${dto.dr_id}"/>
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
				<div class="pack-both">
					<span></span>
					<button type="button" class="btn blue large r4 add-btn" data-drid="${dto.dr_id}">
						내약추가
					</button>
				</div>
				
				<ul class="tabs line out-cont">
					<li class="current"><a href="#tabAll">상세 정보</a></li>
					<li><a href="#tabLife">후기</a></li>
				</ul>
				
				<div id="tabAll" class="tab-content active">
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
				</div>
				
				<!-- 후기 게시판 -->
				<div id="tabLife" class="tab-content">
					<div class="section list-wrap">
						<div class="pack-both" style="display:flex; gap:10px;">
							<span></span>
					            <a href="${path}/drug_reviewInsert.do?dr_id=${dto.dr_id}" class="btn bdr-blue small" style="padding:10px 5px">
					            	<span class="">후기 작성</span></a>
					    </div>
					   <%--  <form id="reviewForm" action="${path}/drug_reviewInsert.do" method="post">
						    <input type="hidden" name="dr_id" value="${dto.dr_id}">
						    <button type="submit" class="btn bdr-blue small" style="padding:10px 5px">
						        후기 작성
						    </button> 
						</form>	--%>
						<ul class="data-list toon">
							
							<c:forEach var="dto" items="${list}">
							<li>
								<%-- <a href="${path}/drug_detailAction.do?dr_id=${dto.dr_id}" class="item thumb-left"> --%>
								<div class="data-content rv-list">
									<p class="data-wrap flex-wrap">
										<!-- <span class="article-type">카테고리</span> -->
										<div class="star-score">
											<div class="star-score">
											    <c:forEach begin="1" end="${dto.rv_rating}" var="i">
											        <i class="ico star small active"><span>★</span></i>
											    </c:forEach>
											
											    <c:forEach begin="1" end="${5 - dto.rv_rating}" var="i">
											        <i class="ico star small"><span>☆</span></i>
											    </c:forEach>
											
											    <span>${dto.rv_rating}</span>
											</div>
										</div>
									</p>
									<p class="small-title">${dto.dr_product}</p>
									<p class="data-wrap flex-wrap">
										<span class="article-type">${dto.rv_content}</span>
									</p>
									<p class="rv-name">${dto.mb_name}</p>
										
									
								</div>
								<!-- </a>.item.thumb-left -->
							</li>
					   		</c:forEach>
						</ul>
						
						<div class="pagination">
						    <!-- 이전 버튼 -->
						    <input type="hidden" name="hiddenPageNum" value="${pageNum}">
						    <c:if test="${paging.startPage > 5}">
						        <a href="${path}/drug_detailAction.do?pageNum=${paging.prev}&dr_id=${dto.dr_id}" class="btn prev page-link" data-page="${paging.prev}">
						            &lt;
						        </a>
						    </c:if>
						
						    <!-- 페이지 번호 -->
						    <ul>
						        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
						            <li class="${num == paging.currentPage ? 'current' : ''}">
						                <a href="${path}/drug_detailAction.do?pageNum=${num}&dr_id=${dto.dr_id}" class="btn page-link" data-page="${num}">${num}</a>
						            </li>
						        </c:forEach>
						    </ul>
						
						    <!-- 다음 버튼 -->
						    <c:if test="${paging.endPage < paging.pageCount}">
						        <a href="${path}/drug_detailAction.do?pageNum=${paging.next}&dr_id=${dto.dr_id}" class="btn next page-link" data-page="${paging.next}">
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