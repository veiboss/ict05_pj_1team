<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 검색 결과 리스트 -->
<div>
	<table class="data-table">
		<thead>
		    <tr>
		    	<th>번호</th>
		        <th>제약명</th>
		        <th>별점</th>
		        <th>작성자</th>
		        <th>등록일</th>
		        <th>공개여부</th>
				<th>버튼</th>
		    </tr>
	    </thead>
	    <tbody>
	    <c:forEach var="dto" items="${list}">
	        <tr>
	        	<td data-th="번호">${dto.rv_id}</td>
	            <td data-th="제약명">${dto.dr_product}</td>
	            <td data-th="별점">${dto.rv_rating}</td>
	            <td data-th="작성자">${dto.mb_name}</td>
	            <td data-th="등록일">${dto.rv_reg_date}</td>
	            <td data-th="공개여부">${dto.rv_show}</td>
	            <td data-th="버튼">
					<button class="btn small color1" onclick="location.href='review_detailAction.ad?rv_id=${dto.rv_id}'" style="cursor:pointer;">상세/수정</button>
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
</div>
<!-- 리스트 끝 -->
<!-- 페이징 -->
<div class="pagination">
    <!-- 이전 버튼 -->
    <c:if test="${paging.startPage > 5}">
        <a href="javascript:void(0);" class="btn prev page-link" data-page="${paging.prev}">
            <svg xmlns="http://www.w3.org/2000/svg" class="svg">
                <path d="m2 6 6-4.33v8.66L2 6z" />
            </svg>
        </a>
    </c:if>

    <!-- 페이지 번호 -->
    <ul>
        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
            <li class="${num == paging.currentPage ? 'current' : ''}">
                <a href="javascript:void(0);" class="btn page-link" data-page="${num}">${num}</a>
            </li>
        </c:forEach>
    </ul>

    <!-- 다음 버튼 -->
    <c:if test="${paging.endPage < paging.pageCount}">
        <a href="javascript:void(0);" class="btn next page-link" data-page="${paging.next}">
            <svg xmlns="http://www.w3.org/2000/svg" class="svg">
                <path d="m2 6 6-4.33v8.66L2 6z" />
            </svg>
        </a>
    </c:if>
</div>