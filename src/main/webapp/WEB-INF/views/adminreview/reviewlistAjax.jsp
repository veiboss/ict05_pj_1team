<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 검색 결과 리스트 -->
<table border="1" width="100%">
    <tr class="col box-wrap">
        <th>약 이름</th>
        <th>별점</th>
        <th>작성자</th>
        <th>노출여부</th>
    </tr>
    <c:forEach var="dto" items="${list}">
        <tr class="col box-wrap" onclick="location.href='review_detailAction.ad?rv_id=${dto.rv_id}'" style="cursor:pointer;">
            <td>${dto.dr_product}</td>
            <td>${dto.rv_rating}</td>
            <td>${dto.mb_name}</td>
            <td>${dto.rv_show}</td>
        </tr>
    </c:forEach>
    <c:if test="${empty list}">
	    <tr>
	        <td colspan="4">검색 결과가 없습니다.</td>
	    </tr>
	</c:if>
</table>

<!-- 페이징 -->
<div class="pagination">
    <!-- 이전 버튼 -->
    <c:if test="${paging.startPage > 1}">
        <a href="javascript:void(0);" class="prev page-link" data-page="${paging.startPage - 1}">
            <i class="ico page-arr"><span><</span></i>
        </a>
    </c:if>

    <ul>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
            <li class="${p == paging.currentPage ? 'current' : ''}">
                <a href="javascript:void(0);" class="page-link" data-page="${p}">${p}</a>
            </li>
        </c:forEach>
        
        <c:if test="${paging.endPage < paging.pageCount}">
            <li><span class="dot3">...</span></li>
            <li>
                <a href="javascript:void(0);" class="page-link" data-page="${paging.pageCount}">
                    ${paging.pageCount}
                </a>
            </li>
        </c:if>
    </ul>

    <!-- 다음 버튼 -->
    <c:if test="${paging.endPage < paging.pageCount}">
        <a href="javascript:void(0);" class="next page-link" data-page="${paging.endPage + 1}">
            <i class="ico page-arr"><span>></span></i>
        </a>
    </c:if>
</div>