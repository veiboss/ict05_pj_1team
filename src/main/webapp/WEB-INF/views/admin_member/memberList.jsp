<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<title>약쏙 관리자</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/yaksokAd.css">

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/yaksokAd.js" defer></script>

</head>
<body>
	<div class="skip-nav"><a href="#content">본문 바로가기</a></div>

	<div id="wrap" class="frame">
		<!-- menu 시작 -->
		<%@ include file="../admin/aside.jsp" %>
		<!-- menu 끝 -->
		
		<!-- header 시작 -->
		<%@ include file="../admin/header.jsp" %>
		<!-- header 끝 -->
		
		<div id="container" class="container">
			<!-- 컨텐츠 시작 -->
			
			
			<div class="title-bar">
				<h2 class="page-title ellipsis">회원 관리</h2>
			</div>
			

			<main id="content">
				<div id="search" class="search box-wrap">
					<form>
						<fieldset>
							<legend class="blind">검색</legend>
							<div class="field insert">
								<select class="select medium" title="검색조건" id="searchSel">
									<option>작성자</option>
									<option>한줄후기</option>
								</select>
							</div>
							<div class="field insert">
								<input type="text" id="searchTxt" class="input-text medium" title="검색어" placeholder="검색어를 입력해 주세요" />
							</div>

							<div class="button-area pack-left">
								<button type="button" class="btn medium color1">검색</button>
								<button type="reset" class="btn medium bdr-color1">초기화</button>
							</div>
						</fieldset>
					</form>
				</div>

				<div class="box-wrap">
					
					<form name="memberList">
						<table class="data-table">
							<thead>
								<tr>
									<th>ID</th>
									<th>이름</th>
									<th>이메일</th>
									<th>등급</th>
									<th>가입일</th>
									<th>버튼</th>
								</tr>
							</thead>
							<tbody>
								<!-- 게시글이 있으면 -->
								<c:forEach var="dto" items="${list}">
									<tr>
										<td data-th="ID">${dto.mb_id}</td>
										<td data-th="이름" class="ta-l">${dto.mb_name}</td>
										<td data-th="이메일" class="ta-l">${dto.mb_email}</td>
										<td data-th="등급">${dto.mb_grade}</td>
										<td data-th="가입일">${dto.mb_reg_date}</td>
										<td data-th="버튼">
											<button type="button" class="btn small color1" onclick="window.location='${path}/memberDetailAction.ad?mbId=${dto.mb_id}&pageNum=${paging.pageNum}'">수정</button>
											
											<button type="button" class="btn small bdr-color1" onclick="window.location='${path}/memberDeleteAction.ad?mbId=${dto.mb_id}'">삭제</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
	
						<div class="pagination">
							<!-- 페이징처리 -->
							<!-- 이전 버튼 활성화 -->
							<c:if test="${paging.startPage > 5}">
								<a href="j${path}/memberList.ad?pageNum=${paging.prev}" class="btn prev">
									<svg xmlns="http://www.w3.org/2000/svg" class="svg">
										<path d="m2 6 6-4.33v8.66L2 6z" />
									</svg>
								</a>
							</c:if>
							
							<!-- 페이지 번호 활성화 -->
							<ul>
								<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
									<li class="<c:if test='${num == paging.currentPage}'>current</c:if>">
										<a href="${path}/memberList.ad?pageNum=${num}" class="btn">${num}</a>
									</li>
								</c:forEach>
							</ul>
							
							<!-- 다음 버튼 활성화 -->
							<c:if test="${paging.endPage < paging.pageCount}">
								<a href="${path}/memberList.ad?pageNum=${paging.next}" class="btn next">
									<svg xmlns="http://www.w3.org/2000/svg" class="svg">
										<path d="m2 6 6-4.33v8.66L2 6z" />
									</svg>
								</a>
							</c:if>
						</div><!-- // .pagination -->
					</form>
				</div>

			</main>
			
			<!-- 컨텐츠 끝 -->
			
			
			<!-- footer 시작 -->
			<%@ include file="../admin/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container  -->
	</div><!-- // #wrap  -->
</body>
</html>