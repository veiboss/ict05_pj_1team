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
 function delQna(id){
	if(confirm('해당 질문을 삭제할까요?')){
		const f = document.getElementById('delForm');
		f.qa_id.value = id;
		f.submit();
	}
}

/* $(document).ready(function(){
	
	$("#answer").click(function() {
        $.ajax({
            type: "GET",
            url: "faq_admin_ajax.fc",
            data: { keyword: $("#searchTxt").val(), pageNum: page },
            success: function(result){
                $("#searchResult").html(result);
            }
        });
    }
    
});


$("#recommendBtn").click(function() {
    var btn = $("#recommendBtn");
    var b_num = btn.data("bnum");
    
    if(${sessionScope.sessionid != null}) {
       if (!btn.hasClass("active")) {
           // 추천 추가
           $.ajax({
               url: "${path}/recommend",
               type: "POST",
               data: { b_num: b_num, click: 1 },
               success: function(result) {
                   if (parseInt(result.success) === 1) {
                       btn.addClass("active"); // 이미지 교체
                      $("#recommendTotal").text(result.b_recommend); 
                   }
               },
               error: function() {
                   alert("추천 처리 중 오류가 발생했습니다.");
               }
           }); */
</script>
<script>
	  document.addEventListener('DOMContentLoaded', function () {
	    if (window.AOS) AOS.init();
	    if (window.nav) { nav.init(); nav.current('4'); }
	    if (window.accordion) { accordion(1); }   // 아래에서 정의할 함수
	  });
	</script>
<style>
	.qna-item.pack-down{gap: 10px}
</style>
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
				<h2 class="article-title ta-c">내가 쓴 Q&A 목록</h2>
				<c:if test="${empty list}">
					<div style="padding:32px;border:1px dashed #ddd;border-radius:12px;text-align:center;color:#666">
				    작성한 Q&A가 없습니다.
				  	</div>
				</c:if>
				
				<div class="pl20"><!-- ❌ id="content" 중복 금지 -->
					<ul class="data-list">
				    	<c:forEach var="dto" items="${list}">
				      		<li class="accordion">
				       		 <!-- 앵커로 전체 감싸지 말고 div로 -->
								
								
			          			<div class="pack-down qna-item">
			          				<!-- 제목 -->
			          				<div class="pack-both" style="display:flex; gap:10px;">
			            			<p class="small-title"><c:out value="${dto.qa_title}"/></p>
			            				<span></span>
			            				<c:if test="${dto.qa_answer != null}">
							            <a id="answer"  class="btn bdr-blue small pack-both accordion-switche" style="padding:8px 5px">
							            	<span class="">답변 보기</span></a>
			            				</c:if>
							  	  	</div>
			            			
			            			<div class="pack-both" style="display:flex; gap:10px;">
          							<p class="qa-content fc-dark-gray"><c:out value="${fn:replace(fn:replace(dto.qa_content,'<p>',''),'</p>','<br/>')}"
										    escapeXml="false"/></p>
          								<span></span>
						                	<a class="btn blue small color1 r4"
						                  		href="${path}/myQnaDetail.do?qa_id=${dto.qa_id}" >수정</a>
						                        
						                	<button class="btn bdr-blue small color1 r4"
						                        onclick="delQna(${dto.qa_id})" type="button" >삭제</button>
						           </div>
						         </div>     
							      <div class="row-2">
										<div class="field col">
											<span class="label medium">비밀글 여부</span>
											<div class="insert pack-left">
												<label for="radio1" class="pack-left"><input type="radio" class="radio" name="qa_private" id="qa_private" value="Y" 
													<c:if test="${dto.qa_private eq 'Y'}">checked</c:if>>노출</label>
												<label for="radio2" class="pack-left"><input type="radio" class="radio" name="qa_private" id="qa_private" value="N" 
													<c:if test="${dto.qa_private eq 'N'}">checked</c:if>>비노출</label>
											</div>
										</div>
									</div>
									<div class="accordion-content">
										<p>${dto.qa_answer}</p>
									</div>
				            		<!-- 내용 -->
			    	        		<div class="data-wrap pack-both">
										<span>&nbsp;</span>
					              		<!-- 버튼 (앵커 밖으로 분리) -->
					              		
						            </div>
								<hr class="out-cont section-bar">
			          		</li>
			          			
			          	</c:forEach>
			          	
		          	</ul>
	        	</div><!-- /.item.thumb-left -->
			</div>
			
			<!-- 삭제(비노출) POST 폼: ❗ forEach 밖, 단 한 개만 -->
			<form id="delForm" action="${path}/myQnaDelete.do" method="post" style="display:none;">
			  <input type="hidden" name="qa_id" >
			</form>	
				
				<div class="pagination">
			    <!-- 이전 버튼 -->
			    <c:if test="${paging.startPage > 5}">
			        <a href="${path}/myQnaList.do?pageNum=${paging.prev}" class="btn prev page-link" data-page="${paging.prev}">
			            &lt;
			        </a>
			    </c:if>
			
			    <!-- 페이지 번호 -->
			    <ul>
			        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
			            <li class="${num == paging.currentPage ? 'current' : ''}">
			                <a href="${path}/myQnaList.do?pageNum=${num}" class="btn page-link" data-page="${num}">${num}</a>
			            </li>
			        </c:forEach>
			    </ul>
			
			    <!-- 다음 버튼 -->
			    <c:if test="${paging.endPage < paging.pageCount}">
			        <a href="${path}/myQnaList.do?pageNum=${paging.next}" class="btn next page-link" data-page="${paging.next}">
			            &gt;
			        </a>
			    </c:if>
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