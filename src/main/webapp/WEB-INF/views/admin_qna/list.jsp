<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="robots" content="noindex">
    <meta name="googlebot" content="noindex">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <title>약쏙 관리자</title>
    <link rel="stylesheet" href="${path}/resources/css/yaksokAd.css">
    <script src="${path}/resources/js/yaksokAd.js" defer></script>
</head>
<body>
<div class="skip-nav"><a href="#content">본문 바로가기</a></div>

<div id="wrap" class="frame">
    <%@ include file="../admin/aside.jsp" %>
    <%@ include file="../admin/header.jsp" %>
    <div id="container" class="container">
        <div class="title-bar">
            <h2 class="page-title ellipsis">전문가 Q&A</h2>
        </div>
        <main id="content">
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
            </div>
            <ul class="data-list">
                <c:forEach var="qna" items="${qnaList}">
                    <li>
                        <div class="item normal">
                            <a href="${path}/admin/qna/detail/${qna.qa_id}" class="pack-down">
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
                                    <div class="item thumb-left r10">
                                        <div class="img-wrap s48">
                                            <img src="../@resource/images/drug_type/01.png" alt="분말" class="centered">
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
                                        <div class="data-content">
                                            <p class="fs-14">제목, 약 이름이 얼마나 길줄 모르겠네요요요 </p>
                                        </div>
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
                                        <span class="user-name">${qna.mb_name}</span>
                                    </div>
                                </div>

                                <!-- [D] 답변안된 질문 중, 전문가만 노출 -->
                                <c:if test="${empty qna.qa_answer}">
                                    <c:if test="${sessionScope.sessionGrade == 'EXPERT'}">
                                        <button type="button" class="btn bdr-blue small r4"
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
            <div class="pagination" style="margin-top:10px;">
                <ul>
                    <c:if test="${paging.startPage > 10}">
                        <li>
                            <a href="${path}/admin/qna/list?pageNum=${paging.prev}&mode=${param.mode}&s=${param.s}"
                               class="prevPage"> [이전] </a>
                        </li>
                    </c:if>

                    <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                        <li>
                            <a href="${path}/admin/qna/list?pageNum=${num}&mode=${param.mode}&s=${param.s}"
                               class="<c:if test='${num == paging.currentPage}'>active</c:if>">${num}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${paging.startPage < paging.pageCount}">
                        <li>
                            <a href="${path}/admin/qna/list?pageNum=${paging.next}&mode=${param.mode}&s=${param.s}"
                               class="nextPage"> [다음] </a>
                        </li>
                    </c:if>
                </ul>
            </div>
            <div style="margin-top:10px;text-align:right">
                <a class="btn bdr-gray medium" href="${path}/qna/write">전문가 Q&A 작성</a>
            </div>
        </main>
        <%@ include file="../admin/footer.jsp" %>
    </div>
</div>
</body>
</html>