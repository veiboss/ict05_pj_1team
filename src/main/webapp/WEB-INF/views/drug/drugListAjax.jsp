<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $(".add-btn").click(function(e) {
    	e.preventDefault();
    	
        var dr_id = $(this).data("drid"); // 버튼의 data-drid 가져오기

        $.ajax({
            url: '${path}/drug_addAction.do',
            type: 'POST',
            data: { dr_id: dr_id },       // 객체로 보내면 application/x-www-form-urlencoded로 전송
            dataType: 'json',             // JSON 응답 받기
            success: function(response) {
                alert(response.msg);       // Service에서 보낸 메시지 표시
                
                if (response.redirect) {
                    // redirect 경로가 응답에 포함돼 있다면 이동
                    window.location.href = response.redirect;
                }
            },
            error: function(xhr, status, error) {
                console.error("에러 상태 :", status);
                console.error("에러 내용 :", error);
                alert("서버 오류가 발생했습니다.");
            }
        });
    });
});
</script>

<div>
	<p class="total"><br>
		<c:if test="${total > 0}">
			<span class="count">총 ${total}</span>
		</c:if>
	</p>
	
	<div class="section list-wrap">
		<ul class="data-list toon">
			<c:forEach var="dto" items="${list}">
			<li>
				<a href="${path}/drug_detailAction.do?dr_id=${dto.dr_id}" class="item thumb-left">
					<!-- 01	분말, 
					02	원형캡슐, 
					03	원형정제, 
					04	제피정제, 
					05	젤리, 
					06	유동성 액체, 
					07	경질캡슐 -->
					<div class="img-wrap s100">
					        <c:choose>
					            <c:when test="${fn:contains(dto.dr_sungsang, '분말')}">
					                <img src="${path}/resources/images/drug_type/01.png" alt="분말">
					            </c:when>
					
					            <c:when test="${fn:contains(dto.dr_sungsang, '원형캡슐')}">
					                <img src="${path}/resources/images/drug_type/02.png" alt="원형캡슐">
					            </c:when>
					
					            <c:when test="${fn:contains(dto.dr_sungsang, '원형정제')}">
					                <img src="${path}/resources/images/drug_type/03.png" alt="원형정제">
					            </c:when>
					
					            <c:when test="${fn:contains(dto.dr_sungsang, '제피정제')}">
					                <img src="${path}/resources/images/drug_type/04.png" alt="제피정제">
					            </c:when>
					            
					            <c:when test="${fn:contains(dto.dr_sungsang, '젤리')}">
					                <img src="${path}/resources/images/drug_type/05.png" alt="젤리">
					            </c:when>
					            
					            <c:when test="${fn:contains(dto.dr_sungsang, '액상')}">
					                <img src="${path}/resources/images/drug_type/06.png" alt="유동성 액체">
					            </c:when>
					            
					            <c:when test="${fn:contains(dto.dr_sungsang, '경질캡슐')}">
					                <img src="${path}/resources/images/drug_type/07.png" alt="경질캡슐">
					            </c:when>
					
					            <c:otherwise>
					                <img src="${path}/resources/images/drug_type/03.png" alt="정제">
					            </c:otherwise>
					        </c:choose>
					</div>
				
					<div class="data-content">
						
						<p class="small-title">${dto.dr_product}</p>
						
						<p class="data-wrap flex-wrap">
							<span class="article-type">${dto.dr_serve_use}</span>
							</p>
							
						<div id="drug-item" class="data-wrap pack-both">
							<span> </span>
							<p class="pack-left">
								<%-- <input type="hidden" name="dr_id" value="${dto.dr_id}"> --%>
								<button type="submit" class="btn blue small r4 add-btn" data-drid="${dto.dr_id}">
									내약추가
								</button>
							</p>
						</div>
					</div>
				</a><!-- .item.thumb-left -->
			</li>
	    </c:forEach>
		</ul>
		
			<div class="pagination">
			    <!-- 이전 버튼 -->
			    <c:if test="${paging.startPage > 5}">
			        <a href="${path}/drug_list.do?pageNum=${paging.prev}" class="btn prev page-link" data-page="${paging.prev}">
			            &lt;
			        </a>
			    </c:if>
			
			    <!-- 페이지 번호 -->
			    <ul>
			        <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
			            <li class="${num == paging.currentPage ? 'current' : ''}">
			                <a href="${path}/drug_list.do?pageNum=${num}" class="btn page-link" data-page="${num}">${num}</a>
			            </li>
			        </c:forEach>
			    </ul>
			
			    <!-- 다음 버튼 -->
			    <c:if test="${paging.endPage < paging.pageCount}">
			        <a href="${path}/drug_list.do?pageNum=${paging.next}" class="btn next page-link" data-page="${paging.next}">
			            &gt;
			        </a>
			    </c:if>
			</div>
		</div><!-- .section.list-wrap -->
	</div>






