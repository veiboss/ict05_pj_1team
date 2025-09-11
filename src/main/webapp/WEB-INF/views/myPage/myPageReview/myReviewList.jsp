<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>약을 쏘옥, 약속</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/yaksok.css">

<!--  js -->
<script src="https://kit.fontawesome.com/d7162d59a4.js" crossorigin="anonymous"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
<script>
function delReview(id){
	if(confirm('이 후기를 삭제할까요?')){
		const f = document.getElementById('delForm');
		f.rv_id.value = id;
		f.submit();
	}
}
</script>

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
		
			
			<!-- 컨텐츠 시작 -->
			<!-- SID : COM000 -->
			<div id="content" class="sub"><!-- [D] main / sub-main / sub && pagd name -->
				<h1 class="page-title">내가 쓴 후기</h1>
				
				<p class="total fc-body fw-500">
					총
				 	<c:if test="${total > 0}"> 
						<span class="count fc-blue">${total}</span>
					 </c:if> 
				</p>
				
				<c:if test="${empty list}">
					<div class="nodata-box">
						작성한 후기가 없습니다.
					</div>
				</c:if>
				
				<c:if test="${not empty list}">
					<div class="list-wrap">
						<ul class="data-list toon">
							<c:forEach var="dto" items="${list}">
								<li>
									<input type="hidden" name="rv_id" value="${dto.rv_id}">
									<!-- 앵커로 전체 감싸지 말고 div로 -->
									<div class="item thumb-left">
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
										</div><!-- //.img-wrap -->
										
										<div class="data-content pack-down">
											<!-- 상품명 -->
											<p class="small-title"><c:out value="${dto.dr_product}"/></p>
											
											<!-- 별점 (여분의 > 제거) -->
											<p class="pack-left" aria-label="별점">
												<span class="star-score">
													<c:forEach begin="1" end="${dto.rv_rating}">
								                		<i class="ico star small active"><span>★</span></i>
								                	</c:forEach>
								                	<c:forEach begin="1" end="${5 - dto.rv_rating}">
								                		<i class="ico star small"><span>☆</span></i>
								                	</c:forEach>
							                	</span>
							                </p>
							            
								            <!-- 내용 -->
											<p class="fc-dark-gray ">
												<c:out value="${
												      fn:replace(
												        fn:replace(
												          fn:replace(
												            fn:replace(fn:replace(dto.rv_content,'<p>',''),'</p>',''),
												          '<br/>',''),
												        '<br />',''),
												      '<br>','') }"/>
											</p>
												
											<!-- 버튼 (앵커 밖으로 분리) -->
											<p class="pack-both">
												<span></span>
												<span>
													<a class="btn blue small color1 r4"
														href="${path}/myReviewDetail.do?rv_id=${dto.rv_id}">
														수정
													</a>
													<button type="button" class="btn bdr-blue small color1 r4"
														onclick="delReview(${dto.rv_id})">
														삭제
													</button>
												</span>
											</p>
										</div><!-- //.data-wrap -->
									</div><!-- /.item.thumb-left -->
								</li>
							</c:forEach>
						</ul>
						
						
						<div class="pagination">
						    <!-- 이전 버튼 -->
						    <c:if test="${paging.startPage > paging.pageBlock}">
						        <a href="${path}/myReviewList.do?pageNum=${paging.prev}" class="btn prev page-link" data-page="${paging.prev}">
						            <i class="ico page-arr"><span>&lt;</span></i>
						        </a>
						    </c:if>
						
						    <!-- 페이지 번호 -->
						    <ul>
						        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
						            <li class="${num == paging.currentPage ? 'current' : ''}">
						                <a href="${path}/myReviewList.do?pageNum=${num}" class="btn page-link" data-page="${num}">${num}</a>
						            </li>
						        </c:forEach>
						    </ul>
						
						    <!-- 다음 버튼 -->
						    <c:if test="${paging.endPage < paging.pageCount}">
						        <a href="${path}/myReviewList.do?pageNum=${paging.next}" class="btn next page-link" data-page="${paging.next}">
						            <i class="ico page-arr"><span>&gt;;</span></i>
						        </a>
						    </c:if>
						</div><!-- //.pagination -->
					</div><!-- //.list-wrap -->
				</c:if>
				
				<!-- 삭제(비노출) POST 폼: ❗ forEach 밖, 단 한 개만 -->
				<form id="delForm" action="${path}/myReviewDelete.do" method="post" style="display:none;">
					<input type="hidden" name="rv_id">
				</form>	
			</div><!-- .section.list-wrap -->
			
		       
				
				
			
			<!-- 컨텐츠 끝 -->
		
			<!-- nav 시작 -->
			<%@ include file="../../common/nav.jsp" %>
			<!-- nav 끝 -->
		
			<!-- footer 시작 -->
			<%@ include file="../../common/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container -->
	</div><!-- // #wrap -->
	<%@ include file="../../common/chat-widget.jspf" %>
</body>
</html>