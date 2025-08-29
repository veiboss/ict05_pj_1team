<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../common/setting.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
	<div id="wrap" class="wrap">
		<!-- PC 컨텐츠 -->
		<%@ include file="../../common/pc_left.jsp" %>
		<!-- PC 컨텐츠 끝 -->
		
		<div id="container" class="">
		<!-- [D] HEADER VIEW :  no class /.lines(2) / .only-back(1) / .only-close(1) -->
			<!-- header 시각 -->
			<%@ include file="../../common/header.jsp" %>
			<!-- header 끝 -->
		
			
			<!-- 컨텐츠 시작 -->
			<!-- SID : COM000 -->
			<div id="content" class="sub"><!-- [D] main / sub-main / sub && pagd name -->
				<h2 class="article-title ta-c">내가 쓴 후기 목록</h2>
				<c:if test="${empty list}">
				  <div style="padding:32px;border:1px dashed #ddd;border-radius:12px;text-align:center;color:#666">
				    작성한 후기가 없습니다.
				  </div>
				</c:if>
				
				<div class="pl20"><!-- ❌ id="content" 중복 금지 -->
				  <ul class="data-list toon">
				    <c:forEach var="dto" items="${list}">
				      <li>
				        <!-- 앵커로 전체 감싸지 말고 div로 -->
				        <div class="item thumb-left">
				          <div class="img-wrap s100">
				            <img src="${path}/resources/images/drug_type/01.png" alt="분말" class="centered">
				          </div>
				
				          <div class="data-content">
				            <!-- 상품명 -->
				            <p class="small-title"><c:out value="${dto.dr_product}"/></p>
				
				            <!-- 별점 (여분의 > 제거) -->
				            <p class="data-wrap flex-wrap" aria-label="별점">
				              <span class="article-type" style="margin-right:8px;">별점</span>
				              <span>
				                <c:forEach begin="1" end="${dto.rv_rating}">★</c:forEach>
				                <c:forEach begin="1" end="${5 - dto.rv_rating}">☆</c:forEach>
				              </span>
				            </p>
				
				            <!-- 내용 -->
				            <div class="data-wrap pack-both">
				              <p><c:out value="${dto.rv_content}"/></p>
				
				              <!-- 버튼 (앵커 밖으로 분리) -->
				              <p class="pack-left">
				                <a class="btn blue small color1 r4"
				                   href="${path}/myReviewDetail.do?rv_id=${dto.rv_id}"
				                   style="cursor:pointer;">수정</a>
				
				                <button class="btn bdr-blue small color1 r4"
				                        onclick="delReview(${dto.rv_id})"
				                        type="button" style="cursor:pointer;">삭제</button>
				              </p>
				            </div>
				          </div>
				        </div><!-- /.item.thumb-left -->
				      </li>
				    </c:forEach>
				  </ul>
				</div>
				
				<!-- 삭제(비노출) POST 폼: ❗ forEach 밖, 단 한 개만 -->
				<form id="delForm" action="${path}/myReviewDelete.do" method="post" style="display:none;">
				  <input type="hidden" name="rv_id" value="">
				</form>	
					
					<div class="pagination">
						<a href="javascript:void(0);" class="prev"><i class="ico page-arr"><span>&lt;</span></i></a>
						<ul>
							<li><a href="javascript:void(0);">1</a></li>
							<li><a href="javascript:void(0);">2</a></li>
							<li class="current"><a href="javascript:void(0);">3</a></li>
							<li><a href="javascript:void(0);">4</a></li>
							<li><a href="javascript:void(0);">5</a></li>
						</ul>
						<a href="javascript:void(0);" class="next"><i class="ico page-arr"><span>&gt;;</span></i></a>
					</div><!-- .pagination -->
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
</body>
</html>