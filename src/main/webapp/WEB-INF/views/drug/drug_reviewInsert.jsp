<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>영양제 검색</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/yaksok.css">

<!--  js -->

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
</head>
<body>
	<div id="wrap" class="wrap">
		<!-- PC 컨텐츠 -->
		<%@ include file="../common/pc_left.jsp" %>
		<!-- PC 컨텐츠 끝 -->
		
		<div id="container" class="lines">
		<!-- [D] HEADER VIEW :  no class /.lines(2) / .only-back(1) / .only-close(1) -->
			<!-- header 시각 -->
			<%@ include file="../common/header.jsp" %>
			<!-- header 끝 -->
		
			<!-- 검색창 시작 -->
			<!-- SID : PL20 -->
			<div id="content" class="pl20"><!-- [D] main / sub-main / sub && pagd name -->
				<div class="pack-down-center gap-20">
					<h2 class="page-title ta-c">후기 작성</h2>
					
					<a href="${path}/drug_detailAction.do?dr_id=${dto.dr_id}" class="item pack-left r4">
						<div class="img-wrap s48">
							<img src="${path}/resources/images/drug_type/01.png" alt="분말">
						</div>
					
						<p class="fc-dark-gray">약이름</p>
					</a><!-- .item.pack-left -->
				</div>
				<!-- 등록 폼 -->
				<form action="${path}/drug_reviewInsertAction.do" method="post">
					<fieldset class="pack-down gap-16">
					<legend class="blind">${dto.dr_id} 후기작성폼</legend>
					<input type="hidden" name="rv_id" value="${dto.rv_id}"/>
					<input type="hidden" name="mb_name" value="${sessionScope.sessionName}"/>
					<input type="hidden" name="dr_id" value="${dto.dr_id}">
					
					<!-- 별점 -->
			        <div class="rating">
		            	<input type="radio" name="rv_rating" id="rating5" value="5" <c:if test="${dto.rv_rating == 5}">checked</c:if> />
						<label for="rating5"></label>
						<input type="radio" name="rv_rating" id="rating4" value="4" <c:if test="${dto.rv_rating == 4}">checked</c:if> />
						<label for="rating4"></label>
						<input type="radio" name="rv_rating" id="rating3" value="3" <c:if test="${dto.rv_rating == 3}">checked</c:if> />
						<label for="rating3"></label>
						<input type="radio" name="rv_rating" id="rating2" value="2" <c:if test="${dto.rv_rating == 2}">checked</c:if> />
						<label for="rating2"></label>
						<input type="radio" name="rv_rating" id="rating1" value="1" <c:if test="${dto.rv_rating == 1}">checked</c:if> />
						<label for="rating1"></label>
			        </div>

					<!-- 내용 -->
					<textarea name="rv_content" class="textarea"><c:out value="${dto.rv_content}"/></textarea>
			
					<!-- 버튼 -->
					<div class="button-area pack-center">
						<button type="submit" class="btn black medium r-full">저장</button>
			   		</div>
			    </fieldset>
			    </form>
			</div>
			<!-- nav 시작 -->
			<%@ include file="../common/nav.jsp" %>
			<!-- nav 끝 -->
		
			<!-- footer 시작 -->
			<%@ include file="../common/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container -->
	</div><!-- // #wrap -->
</body>
</html>