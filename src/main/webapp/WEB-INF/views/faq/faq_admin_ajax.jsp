<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<table class="data-table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>공개여부</th>
				<th>버튼</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.fa_id}</td>
					<td data-th="제목" class="ta-l">${dto.fa_title}</td>
					<td data-th="작성일">${dto.fa_reg_date}</td>
					<td data-th="공개여부">${dto.fa_show}</td>
					<td data-th="버튼">
						<button class="btn small color1" onclick="location.href='faq_detail.fc?fa_id=${dto.fa_id}'">수정</button>
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

	<div class="pagination">
		<!-- 페이징처리 -->
		<!-- 이전 버튼 활성화 -->
		<c:if test="${paging.startPage > paging.pageBlock}">
			<a href="#" class="btn prev" data-page="${paging.prev}">
				<svg xmlns="http://www.w3.org/2000/svg" class="svg">
					<path d="m2 6 6-4.33v8.66L2 6z" />
				</svg>
			</a>
		</c:if>
		
		<!-- 페이지 번호 활성화 -->
		<ul>
			<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
				<li class="${num == paging.currentPage ? 'current' : ''}">
					<a href="#" class="btn" data-page="${num}">${num}</a>
				</li>
			</c:forEach>
		</ul>
		
		<!-- 다음 버튼 활성화 -->
		<c:if test="${paging.endPage < paging.pageCount}">
			<a href="#" class="btn next" data-page="${paging.next}">
				<svg xmlns="http://www.w3.org/2000/svg" class="svg">
					<path d="m2 6 6-4.33v8.66L2 6z" />
				</svg>
			</a>
		</c:if>
	</div><!-- // .pagination -->
	
</section>