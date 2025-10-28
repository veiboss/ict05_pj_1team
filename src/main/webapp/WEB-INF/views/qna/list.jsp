<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common/setting.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>전문가 QnA</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${path}/resources/css/yaksok.css">
    <script src="${path}/resources/js/lib/aos.js" defer></script>
    <script src="${path}/resources/js/yaksok.js" defer></script>
	<script>
		$(function() {
			// 내비게이션 선택
			nav.current(3);
		});
	</script>
</head>
<body>
<div id="wrap" class="wrap">
    <%@ include file="../common/pc_left.jsp" %>
    <div id="container" class="lines">
        <%@ include file="../common/header.jsp" %>
        <div id="content" class="pl20">
			<div class="header-line pack-both">
				<h2 class="page-title">Q&amp;A</h2>

				<a class="btn black small r-full" href="${path}/qna/write">전문가에게 물어보기</a>
			</div>
			
			<div class="section list-wrap">
	            <div class="search-bar">
	                <form class="sign-up-form" action="" method="GET">
	                    <fieldset>
	                        <legend class="blind">통합 검색</legend>
	                        <div class="search-box pack-both r4">
	                            <select name="mode" class="select" style="width:100px;">
	                                <option value="t" ${param.mode == 't'?'selected':''}>제목</option>
	                                <option value="c" ${param.mode == 'c'?'selected':''}>내용</option>
	                            </select>
	
	                            <input type="search" class="input-text r4" name="s" value="${param.s}"
	                                   placeholder="검색어를 입력해주세요"
	                                   autocomplete="off">
	
	                            <button type="submit" class="btn"><strong>검색</strong></button>
	                        </div>
	                    </fieldset>
	                </form>
	            </div><!-- //.search-bar -->
	            
	            <ul class="data-list">
	                <c:forEach var="qna" items="${qnaList}">
	                    <li>
	                        <div class="item normal">
	                            <a href="${path}/qna/detail/${qna.qa_id}" class="pack-down gap-16">
	                                <p class="data-wrap mdot">
	                                    <i class="ico-bg blue r10"><span>Q</span></i>
	                                    <!-- [D] 답변 전 -->
	                                    <c:if test="${empty qna.qa_answer}">
	                                        <span class="q-ing">궁금해요</span>
	                                    </c:if>
	                                    <c:if test="${not empty qna.qa_answer}">
	                                        <span class="q-solved">궁금증해결</span>
	                                    </c:if>
	
	                                    <span><fmt:formatDate value="${qna.qa_reg_date}" pattern="yyyy. MM. dd"/></span>
	                                </p>
	
	                                <p class="item-title">${qna.qa_title}</p>
	
	                                <!-- [D] 약에 관한 질문일 경우 -->
	                                <div class="pack-left" style="display:none;">
	                                    <div class="item pack-left r4">
	                                        <div class="img-wrap s48">
	                                            <img src="${path}/resources/images/drug_type/01.png" alt="분말" class="centered">
	                                            <!--
	                                                01	분말,
	                                                02	원형캡슐,
	                                                03	원형정제,
	                                                04	제피정제,
	                                                05	젤리,
	                                                06	유동성 액체,
	                                                07	경질캡슐
	                                            -->
	                                        </div>
	                                        <p class="fc-dark-gray">{약이름}</p>
	                                    </div><!-- .item.thumb-left -->
	                                </div><!-- .pack-left -->
	                            </a><!-- .pack-down -->
	
	                            <div class="pack-both">
	                                <div class="pack-left">
	                                    <div class="img-wrap circle s36">
	                                        <img src="https://cdn.pixabay.com/photo/2014/11/29/19/33/bald-eagle-550804_960_720.jpg"
	                                             alt="프로필아이디" class="centered">
	                                    </div>
	                                    <div class="user">
	                                        <span class="user-name fc-body">${qna.mb_name}</span>
	                                    </div>
	                                </div>
	
	                                <!-- [D] 답변안된 질문 중, 전문가만 노출 -->
	                                <c:if test="${empty qna.qa_answer}">
	                                    <c:if test="${sessionScope.sessionGrade == 'EXPERT'}">
	                                        <button type="button" class="btn black small r-full"
	                                                onclick="location.href='${path}/qna/detail/${qna.qa_id}'">
	                                            답변등록
	                                        </button>
	                                    </c:if>
	                                </c:if>
	                            </div><!-- .pack-both -->
	                        </div><!-- .item.normal -->
	                    </li>
	                </c:forEach>
	            </ul>
	            
				<!-- 페이징처리 -->
	            <div class="pagination" >
					<!-- 이전버튼 활성화 -->
	                <c:if test="${paging.startPage > paging.pageBlock}">
						<a href="${path}/qna/list?pageNum=${paging.prev}&mode=${param.mode}&s=${param.s}" class="prev">
							<i class="ico page-arr"><span>&lt;</span></i>
						</a>
	                </c:if>
	                <ul>
	                    <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
	                        <li class="<c:if test='${num == paging.currentPage}'>current</c:if>">
	                            <a href="${path}/qna/list?pageNum=${num}&mode=${param.mode}&s=${param.s}">${num}</a>
	                        </li>
	                    </c:forEach>
	                    <!-- 페이지 번호 처리 -->
	                </ul>
	                  <!-- 다음버튼 활성화 -->
	                  <c:if test="${paging.endPage < paging.pageCount}">
	                  	<a href="${path}/qna/list?pageNum=${paging.next}&mode=${param.mode}&s=${param.s}" class="next">
		                  	<i class="ico page-arr"><span>&gt;;</span></i>
	                  	</a>
                    </c:if>
	            </div><!-- .pagination -->
	        </div><!-- .list-wrap -->

			<!-- 컨텐츠 끝 -->
			</div><!-- // #content -->
			<%@ include file="../common/nav.jsp" %>
			<%@ include file="../common/footer.jsp" %>

		</div>
		<!-- // #container -->
	</div>
	<!-- // #wrap -->
	<%@ include file="../common/chat-widget.jspf" %>
</body>
</html>