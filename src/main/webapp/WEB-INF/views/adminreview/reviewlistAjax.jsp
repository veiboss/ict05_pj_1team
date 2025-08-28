<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 검색 결과 리스트 -->
<div class="search box-wrap">
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
					<button class="btn small normal" onclick="location.href='review_detailAction.ad?rv_id=${dto.rv_id}'" style="cursor:pointer;">상세/수정</button>
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