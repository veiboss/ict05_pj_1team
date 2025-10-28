<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			<!-- 컨텐츠 시작 -->
        <div class="title-bar">
				<div class="pack-left">
            <h2 class="page-title ellipsis">전문가 Q&amp;A</h2>
            <a class="btn bdr-gray medium" href="${path}/qna/write">
            	<span class="material-symbols-outlined">chat_add_on</span>
            	<span>새 Q&amp;A</span>
            </a>
				</div>
        </div>
        
        <main id="content">
            <div class="search box-wrap">
                <form class="sign-up-form" action="" method="GET">
                    <fieldset class="pack-left">
                        <legend class="blind">통합 검색</legend>
                        <div class="field insert" style="width: 150px;">
                            <select name="mode" class="select medium">
                                <option value="t" ${param.mode == 't'?'selected':''}>제목</option>
                                <option value="c" ${param.mode == 'c'?'selected':''}>내용</option>
                            </select>
						</div>
						<div class="field insert">
                            <input type="search" class="input-text medium" name="s" value="${param.s}"
                                   placeholder="검색어를 입력해주세요"
                                   autocomplete="off">
						</div>
						<div class="button-area pack-left">
                            <button type="submit" class="btn medium color1"><strong>검색</strong></button>
						</div>
                    </fieldset>
                </form>
            </div>
            
            <div class="box-wrap">
				<table class="data-table">
					<colgroup>
						<col width="80">
						<col width="*">
						<col width="100">
						<col width="100">
						<col width="100">
						<col width="100">
						<col width="120">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">NO</th>
							<th scope="col">제목</th>
							<th scope="col">답변</th>
							<th scope="col">비밀글</th>
							<th scope="col">노출여부</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="qna" items="${qnaList}">
						<tr>
							<th scope="row">${qna.qa_id}</th>
							<td data-th="제목" class="ta-l"><a href="${path}/admin/qna/detail/${qna.qa_id}">${qna.qa_title}</a></td>
							<td data-th="답변">
								<c:if test="${empty qna.qa_answer}">N</c:if>
								<c:if test="${not empty qna.qa_answer}">Y</c:if>
							</td>
							<td data-th="비밀글">${qna.qa_private}</td>
							<td data-th="노출여부">${qna.qa_show}</td>
							<td data-th="작성자">${qna.mb_name}</td>
							<td data-th="작성일"><fmt:formatDate value="${qna.qa_reg_date}" pattern="yyyy. MM. dd"/></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>

					<div class="pagination">
                    <c:if test="${paging.startPage > paging.pageBlock}">
                            <a href="${path}/admin/qna/list?pageNum=${paging.prev}&mode=${param.mode}&s=${param.s}"
                               class="btn prev">
									<svg xmlns="http://www.w3.org/2000/svg" class="svg">
										<path d="m2 6 6-4.33v8.66L2 6z" />
									</svg>
                            </a>
                    </c:if>
					<!-- 페이지 번호 활성화 -->
					<ul>
                    <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                        <li class="<c:if test='${num == paging.currentPage}'>current</c:if>">
                            <a href="${path}/admin/qna/list?pageNum=${num}&mode=${param.mode}&s=${param.s}" class="btn">${num}</a>
                        </li>
                    </c:forEach>
					</ul>

                    <c:if test="${paging.endPage < paging.pageCount}">
                            <a href="${path}/admin/qna/list?pageNum=${paging.next}&mode=${param.mode}&s=${param.s}"
                               class="btn next">
									<svg xmlns="http://www.w3.org/2000/svg" class="svg">
										<path d="m2 6 6-4.33v8.66L2 6z" />
									</svg>
                               </a>
                    </c:if>
					</div><!-- // .pagination -->
            </div>
        </main>
        <%@ include file="../admin/footer.jsp" %>
    </div>
</div>
</body>
</html>