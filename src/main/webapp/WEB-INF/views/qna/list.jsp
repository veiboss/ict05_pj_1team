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
</head>
<body>
<div id="wrap" class="wrap">
    <%@ include file="../common/pc_left.jsp" %>
    <div id="container" class="lines">
        <%@ include file="../common/header.jsp" %>
        <div id="content" class="sub si20">
            <form class="sign-up-form" action="" method="GET">
                <div class="table-wrap">
                    <table class="data-table">
                        <tbody>
                        <tr>
                            <td>
                                <div class="select-options r4">
                                    <label>
                                        <input type="radio" name="mode" value="t" ${param.mode == 't'?'checked':''}>
                                        <span class="btn medium r4">제목</span>
                                    </label>

                                    <label>
                                        <input type="radio" name="mode" value="c" ${param.mode == 'c'?'checked':''}>
                                        <span class="btn medium r4">내용</span>
                                    </label>
                                </div>
                            </td>
                            <td>
                                <input type="search" name="s" class="input-text" value="${param.s}"
                                       placeholder="검색어를 입력해주세요">
                            </td>
                            <td>
                                <button type="submit" class="btn black medium r4" style="width:60px;">검색</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </form>
            <div class="table=wrap" style="margin-top:10px;">
                <table class="data-table">
                    <colgroup>
                        <col>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col">NO</th>
                        <th scope="col">제목</th>
                        <th scope="col">Read</th>
                        <th scope="col">등록일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="qna" items="${qnaList}">
                        <tr>
                            <td scope="row">${qna.qa_id}</td>
                            <td style="text-align:left;"><a href="${path}/qna/detail/${qna.qa_id}">${qna.qa_title}</a>
                            </td>
                            <td>${qna.qa_readcount}</td>
                            <td><fmt:formatDate value="${qna.qa_reg_date}" pattern="yyyy.MM.dd"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="pagination" style="margin-top:10px;">
                <ul>
                    <!-- 페이징처리 -->
                    <!-- 이전버튼 활성화 -->
                    <c:if test="${paging.startPage > 10}">
                        <li>
                            <a href="${path}/qna/list?pageNum=${paging.prev}" class="prevPage"> [이전] </a>
                        </li>
                    </c:if>

                    <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                        <li>
                            <a href="${path}/qna/list?pageNum=${num}"
                               class="<c:if test='${num == paging.currentPage}'>active</c:if>">${num}</a>
                        </li>
                    </c:forEach>

                    <!-- 페이지 번호 처리 -->
                    <!-- 다음버튼 활성화 -->
                    <c:if test="${paging.startPage < paging.pageCount}">
                        <li>
                            <a href="${path}/qna/list?pageNum=${paging.next}" class="nextPage"> [다음] </a>
                        </li>
                    </c:if>
                </ul>
            </div>
            <div style="margin-top:10px;text-align:right">
                <a class="btn bdr-gray medium" href="${path}/qna/write">전문가 Q&A 작성</a>
            </div>
        </div>
        <%@ include file="../common/nav.jsp" %>
        <%@ include file="../common/footer.jsp" %>
    </div>
</div>
<div id="alertSignIn" class="overlay not-close">
    <div id="emailCheckWrap" class="alert"></div>
</div>
</body>
</html>