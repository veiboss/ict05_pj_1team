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
            <div class="table-wrap">
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
							<td style="text-align:left;"><a href="${path}/admin/qna/detail/${qna.qa_id}">${qna.qa_title}</a></td>
							<td>
								<c:if test="${empty qna.qa_answer}">N</c:if>
								<c:if test="${not empty qna.qa_answer}">Y</c:if>
							</td>
							<td>${qna.qa_private}</td>
							<td>${qna.qa_show}</td>
							<td>${qna.mb_name}</td>
							<td><fmt:formatDate value="${qna.qa_reg_date}" pattern="yyyy. MM. dd"/></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
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