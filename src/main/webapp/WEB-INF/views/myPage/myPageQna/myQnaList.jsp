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
 function delQna(id){
	if(confirm('해당 질문을 삭제할까요?')){
		const f = document.getElementById('delForm');
		f.qa_id.value = id;
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

<style>
  /* 저장 후 포커스 항목 하이라이트 */
  .flash { animation: flash-bg 1.2s ease-in-out 1; }
  @keyframes flash-bg {
    0% { background: #fff8c4; }
    100% { background: transparent; }
  }
</style>

<script>
  // 답변 수정
  // 인라인 편집 토글
	function answerUpdate(id){
    	document.getElementById('ans-text-'+id).style.display = 'none';
    	document.getElementById('ans-edit-'+id).style.display = 'block';
    	
    	document.getElementById('ans-open-'+id).style.display = 'none';
    	document.getElementById('ans-close-'+id).style.display = 'block';
  	}
  	function cancelAnswer(id){
    	document.getElementById('ans-text-'+id).style.display = 'block';
    	document.getElementById('ans-edit-'+id).style.display = 'none';
    	
    	document.getElementById('ans-open-'+id).style.display = 'block';
    	document.getElementById('ans-close-'+id).style.display = 'none';
  	}

  	// 폼 제출(페이지 리다이렉트로 목록 유지 + 갱신)
  	function saveAnswer(id){
	    const ta = document.getElementById('ans-ta-'+id);
	    const form = document.getElementById('ansForm');
	    form.qa_id.value = id;
	    document.getElementById('ansFormAnswer').value = ta.value;
	    form.submit(); // ← 일반 submit (JSON 아님)
  	}

  	// 리다이렉트 후 focusId로 해당 항목 위치로 스크롤 + 하이라이트
  	(function(){
	    const params = new URLSearchParams(location.search);
	    const fid = params.get('focusId');
	    if (!fid) return;
	    const target = document.getElementById('qa-'+fid);
	    if (target){
			target.scrollIntoView({behavior:'instant', block:'start'});
			target.classList.add('flash');
			setTimeout(()=>target.classList.remove('flash'), 1500);
	    }
  	})();
</script>

<script>
	// 답변 삭제
    function deleteAnswer(id){
    	if(!confirm('이 답변을 삭제할까요?')) return;
    	const f = document.getElementById('ansDelForm');
    	f.qa_id.value = id;
    	f.submit(); 
  	}

    // redirect 후 focusId로 해당 항목으로 스크롤/하이라이트
    (function(){
    	const p = new URLSearchParams(location.search);
    	const fid = p.get('focusId');
    	if(!fid) return;
   	 	const target = document.getElementById('qa-'+fid); 
   	 	if(target){
      		target.scrollIntoView({behavior:'instant', block:'start'});
      		target.classList.add('flash');
      		setTimeout(()=>target.classList.remove('flash'), 1500);
	   }
  	})();
</script>



<style>
	.item.normal{border-color: var(--light-gray);}
	.expert-wrap{margin-top: 16px; padding-top: 16px; border-top: 1px dotted var(--light-violet)}
	.expert-edit-wrap{width: 100%;}
	
</style>
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
				<h2 class="page-title">내가 쓴 Q&amp;A</h2>
				
				<c:if test="${not empty list}">
				<p class="total fc-body fw-500">
					총
					<c:if test="${total > 0}"> 
						<span class="count fc-blue">${total}</span>
					 </c:if> 
				</p>
				</c:if>

				<c:if test="${empty list}">
					<div class="nodata-box">
						작성한 Q&amp;A가 없습니다.
					</div>
				</c:if>
				
				<c:if test="${not empty list}">
					<div class="list-wrap">
						<ul class="data-list">
							<c:forEach var="dto" items="${list}">
							<li>
							<!-- 앵커로 전체 감싸지 말고 div로 -->
							<div class="item normal">
								<div class="pack-down">
									<!-- 제목 -->
									<p class="item-title">
										<c:if test="${fn:trim(dto.qa_private) == 'Y'}"><span class="fc-gray">비밀글</span></c:if>
			            				<c:out value="${dto.qa_title}"/>
			            			</p>
			            			
		       						<p class="qa-content fc-dark-gray">
		       							<c:out value="${
									      fn:replace(
									        fn:replace(
									          fn:replace(
									            fn:replace(fn:replace(dto.qa_content,'<p>',''),'</p>',''),
									          '<br/>',''),
									        '<br />',''),
									      '<br>','')}"/>
							 		</p>
		
									<p class="pack-left">
										<a class="btn blue xsmall r4"
					                  		href="${path}/myQnaDetail.do?qa_id=${dto.qa_id}" >수정</a>
					                	<button type="button" class="btn bdr-blue xsmall r4"
					                		onclick="delQna(${dto.qa_id})">삭제</button>
									</p>
								</div><!-- 내 QnA 끝 -->
								
								<!-- 전문가 답변 시작 -->
								<div class="pack-down-right expert-wrap">
									<p id="ans-text-${dto.qa_id}" class="fc-body fs-16">
										<c:out value="${
									      fn:replace(
									        fn:replace(
									          fn:replace(
									            fn:replace(fn:replace(dto.qa_answer,'<p>',''),'</p>',''),
									          '<br/>',''),
									        '<br />',''),
									      '<br>','')}"/>
							 		</p>
									
									<!-- 수정 버튼: sessionGrade가 expert일 때만 보임 -->
									<c:if test="${not empty sessionScope.sessionGrade 
									             and fn:toLowerCase(fn:trim(sessionScope.sessionGrade)) eq 'expert' 
									             and not empty dto.qa_answer}">
									             
										<p class="btns pack-left">
											<button type="button" class="btn blue xsmall r4"
										           id="ans-open-${dto.qa_id}" onclick="answerUpdate(${dto.qa_id})">수정열기</button>
										    <button type="button" class="btn bdr-blue xsmall r4"
										           id="ans-close-${dto.qa_id}" onclick="cancelAnswer(${dto.qa_id})" style="display:none;">수정닫기</button>
										</p>
										
										<div id="ans-edit-${dto.qa_id}" class="expert-edit-wrap pack-down-right" style="display:none;">
											<div  class="pack-down">
												<textarea id="ans-ta-${dto.qa_id}" rows="6" class="textarea"><c:out value="${fn:trim(
													  fn:replace(
													    fn:replace(
													      fn:replace(
													        fn:replace(
													          fn:replace(dto.qa_answer,'<p>',''),
													        '</p>',''),
													      '<br/>','&#10;'),
													    '<br />','&#10;'),
													  '<br>','&#10;')
													)}"/></textarea>
												
												<div class="pack-center">
													<button type="button" class="btn black small r-full"
													        onclick="saveAnswer(${dto.qa_id})">수정하기</button>
													<button type="button" class="btn bdr-gray small r-full"
													        onclick="deleteAnswer(${dto.qa_id})">삭제</button>
												</div>
											</div>
										</div>
									</c:if>
								</div><!-- //.expert-wrap -->
							</div><!-- //.item.normal -->
				          	</li>
				          </c:forEach>
			          	</ul>
			          	
			          	<div class="pagination">
						    <!-- 이전 버튼 -->
						    <c:if test="${paging.startPage > paging.pageBlock}">
						        <a href="${path}/myQnaList.do?pageNum=${paging.prev}" class="btn prev page-link" data-page="${paging.prev}">
						            <i class="ico page-arr"><span>&lt;</span></i>
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
						            <i class="ico page-arr"><span>&gt;;</span></i>
						        </a>
						    </c:if>
						</div><!-- .pagination -->
		        	</div><!-- /.list-wrap -->
		        </c:if>
			</div>
			
			<!-- 답변 수정  (공용 1개) -->
			<form id="ansForm" action="${path}/myQnaAnswerUpdate.do" method="post" style="display:none;">
				<input type="hidden" name="qa_id">
				<input type="hidden" name="pageNum" value="${paging.currentPage}">
					<!-- 답변 본문은 개행이 많을 수 있어서 textarea로 -->
					<textarea name="qa_answer" id="ansFormAnswer"></textarea>
			</form>
			
			<!-- 답변 삭제 -->
			<form id="ansDelForm" action="${path}/myQnaAnswerDelete.do" method="post" style="display:none;">
				<input type="hidden" name="qa_id">
				<input type="hidden" name="pageNum" value="${paging.currentPage}">
			</form>
			
						
			
			<!-- 삭제(비노출) POST 폼: ❗ forEach 밖, 단 한 개만 -->
			<form id="delForm" action="${path}/myQnaDelete.do" method="post" style="display:none;">
			  <input type="hidden" name="qa_id" >
			</form>
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