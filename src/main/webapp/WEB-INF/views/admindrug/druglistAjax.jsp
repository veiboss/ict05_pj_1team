<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 검색 결과 리스트 -->
	<table class="data-table">
		<thead>
		    <tr>
		    	<th>번호</th>
		        <th>제품명</th>
		        <th>업체명</th>
		        <th>품목번호</th>
		        <th>등록일자</th>
		        <th>유통기한</th>
				<th>공개여부</th>
				<th>버튼</th>
		    </tr>
	    </thead>
	    <tbody>
	    <c:forEach var="dto" items="${list}">
	        <tr>
	        	<td class="fs-14">${dto.dr_id}</td>
	            <td data-th="제품명" class="ta-l">${dto.dr_product}</td>
	            <td data-th="업체명" class="fs-14">${dto.dr_enterprise}</td>
	            <td data-th="품목번호" class="fs-14">${dto.dr_statement_id}</td>
	            <td data-th="등록일자">${dto.dr_regist_date}</td>
	            <td data-th="유통기한" class="ta-l fs-14">${dto.dr_expiration_date}</td>
	            <td data-th="공개여부">${dto.dr_show}</td>
	            <td data-th="버튼">
					<button class="btn small color1" onclick="location.href='drugDetail.ad/?dr_id=${dto.dr_id}'">수정</button>
				</td>
	        </tr>
	    </c:forEach>
	    <c:if test="${empty list}">
		    <tr>
		        <td colspan="7">검색 결과가 없습니다.</td>
		    </tr>
		</c:if>
		</tbody>
	</table>
<!-- 리스트 끝 -->
<!-- 페이징 -->
<div class="pagination">
    <!-- 이전 버튼 -->
    <c:if test="${paging.startPage > paging.pageBlock}">
        <a href="${path}/drug.ad?page=${paging.prev}" class="btn prev page-link" data-page="${paging.prev}">
            <svg xmlns="http://www.w3.org/2000/svg" class="svg">
                <path d="m2 6 6-4.33v8.66L2 6z" />
            </svg>
        </a>
    </c:if>

    <!-- 페이지 번호 -->
    <ul>
        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
            <li class="${num == paging.currentPage ? 'current' : ''}">
                <a href="${path}/drug.ad?page=${num}" class="btn page-link" data-page="${num}">${num}</a>
            </li>
        </c:forEach>
    </ul>

    <!-- 다음 버튼 -->
    <c:if test="${paging.endPage < paging.pageCount}">
        <a href="${path}/drug.ad?page=${paging.next}" class="btn next page-link" data-page="${paging.next}">
            <svg xmlns="http://www.w3.org/2000/svg" class="svg">
                <path d="m2 6 6-4.33v8.66L2 6z" />
            </svg>
        </a>
    </c:if>
</div>