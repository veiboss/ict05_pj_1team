<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../common/setting.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
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
  	}
  	function cancelAnswer(id){
    	document.getElementById('ans-edit-'+id).style.display = 'none';
    	document.getElementById('ans-text-'+id).style.display = 'block';
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
					  	  	</div>
	            			
	            			<div class="pack-both" style="display:flex; gap:10px;">
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
				           </div>
				       </div>     
					    <div class="row-2">
						    <div class="field col">
									
						    	<div class="insert pack-left">
									<label>
										<input type="radio" class="radio"
										      name="qa_private_${dto.qa_id}" value="N" disabled
											<c:if test="${fn:trim(dto.qa_private) == 'N'}">checked="checked"</c:if> />
										  	공개
									</label>
									<label>
										 <input type="radio" class="radio"
										        name="qa_private_${dto.qa_id}" value="Y" disabled
										 	<c:if test="${fn:trim(dto.qa_private) == 'Y'}">checked="checked"</c:if> />
											비밀글
									</label>
								</div>
								<span></span>
			                	<a class="btn blue small color1 r4"
			                  		href="${path}/myQnaDetail.do?qa_id=${dto.qa_id}" >수정</a>
			                        
			                	<button class="btn bdr-blue small color1 r4"
			                        onclick="delQna(${dto.qa_id})" type="button" >삭제</button>
							</div>
						</div>
						<!-- 내 QnA 끝 -->
						
						<!-- 전문가 답변 시작 -->
						<div class="">
							<p id="ans-text-${dto.qa_id}" align=left>
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
								<button type="button" class="btn blue small r4"
							          onclick="answerUpdate(${dto.qa_id})">수정</button>
							</c:if>
							<!-- 숨김 편집 박스(전문가만 사용) -->
							<c:if test="${not empty sessionScope.sessionGrade 
											and fn:toLowerCase(fn:trim(sessionScope.sessionGrade)) eq 'expert' 
											and not empty dto.qa_answer}">
								<div id="ans-edit-${dto.qa_id}" style="display:none; margin-top:8px;">
									<textarea id="ans-ta-${dto.qa_id}" rows="6" class="textarea" style="width:100%; text-align:left;">
										<c:out value="${fn:trim(
										  fn:replace(
										    fn:replace(
										      fn:replace(
										        fn:replace(
										          fn:replace(dto.qa_answer,'<p>',''),
										        '</p>',''),
										      '<br/>','&#10;'),
										    '<br />','&#10;'),
										  '<br>','&#10;')
										)}"/>
									</textarea>
									<div >
										<button type="button" class="btn blue small r4"
										        onclick="saveAnswer(${dto.qa_id})">수정하기</button>
										<button type="button" class="btn bdr-blue small r4"
										        onclick="deleteAnswer(${dto.qa_id})">삭제</button>
									</div>
								</div>
							</c:if>
	            		</div> 
						<hr class="out-cont section-bar">
			          	</li>
			          			
			          </c:forEach>
		          	</ul>
	        	</div><!-- /.item.thumb-left -->
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
	<%@ include file="../../common/chat-widget.jspf" %>
</body>
</html>