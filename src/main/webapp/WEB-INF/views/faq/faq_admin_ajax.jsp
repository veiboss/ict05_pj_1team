<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="box-wrap">
	<table class="data-table">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
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
					<td>${dto.fa_writer_name}</td>
					<td>${dto.fa_title}</td>
					<td>${dto.fa_reg_date}</td>
					<td>${dto.fa_show}</td>
					<td data-th="버튼">
					<button class="btn small color1" onclick="location.href='faq_detail.fc?fa_id=${dto.fa_id}'" style="cursor:pointer;">상세/수정</button>
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

	<!-- 등록 버튼 영역 -->
	<div class="button-area" style="margin: 20px 0; text-align: center;">
		<a href="faq_insert.fc" class="btn large color1">글등록</a>
	</div>

	<!-- 페이징 -->
	<div class="pagination">
		<!-- 이전 버튼 -->
		<c:if test="${paging.startPage > 5}">
			<a href="#" class="btn prev page-link" data-page="${paging.prev}"> <svg
					xmlns="http://www.w3.org/2000/svg" class="svg">
                <path d="m2 6 6-4.33v8.66L2 6z" />
            </svg>
			</a>
		</c:if>

		<!-- 페이지 번호 -->
		<ul>
			<c:forEach var="num" begin="${paging.startPage}"
				end="${paging.endPage}">
				<li class="${num == paging.currentPage ? 'current' : ''}">
				<a href="#" class="btn page-link" data-page="${num}">${num}</a></li>
			</c:forEach>
		</ul>

		<!-- 다음 버튼 -->
		<c:if test="${paging.endPage < paging.pageCount}">
			<a href="#" class="btn next page-link" data-page="${paging.next}"> 
			<svg xmlns="http://www.w3.org/2000/svg" class="svg">
                <path d="m2 6 6-4.33v8.66L2 6z" />
            </svg>
			</a>
		</c:if>
	</div>
</section>