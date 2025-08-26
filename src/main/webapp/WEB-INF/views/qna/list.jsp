<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<form action="" method="GET">
    <table>
        <tr>
            <td>
                <select name="mode">
                    <option value="t" ${param.mode == 't'?'selected':''}>제목</option>
                    <option value="c" ${param.mode == 'c'?'selected':''}>내용</option>
                </select>
            </td>
            <td>
                <input type="text" name="s" value="${param.s}" />
            </td>
            <td>
                <input type="submit" value="검색" />
            </td>
        </tr>
    </table>
</form>
<table>
    <tr>
        <td>ID</td>
        <td>제목</td>
    </tr>
    <c:forEach var="qna" items="${qnaList}">
        <tr>
            <td>${qna.qa_id}</td>
            <td><a href="${path}/qna/detail/${qna.qa_id}">${qna.qa_title}</a></td>
        </tr>
    </c:forEach>
</table>
<ul class="pagination">
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
</body>
</html>