 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>약을 쏘옥, 약속</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/yaksok.css">

<!--  js -->
<script src="https://kit.fontawesome.com/d7162d59a4.js" crossorigin="anonymous"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>

</head>
<body>
	<div id="wrap" class="wrap">
		<!-- PC 컨텐츠 -->
		<%@ include file="../../common/pc_left.jsp" %>
		<!-- PC 컨텐츠 끝 -->
		
		<div id="container" class="">
		<!-- [D] HEADER VIEW :  no class /.lines(2) / .only-back(1) / .only-close(1) -->
			<!-- header 시각 -->
			<%@ include file="../../common/header.jsp" %>
			<!-- header 끝 -->
		
			
			<!-- 컨텐츠 시작 -->
			<!-- SID : COM000 -->
			<div id="content" class="sub"><!-- [D] main / sub-main / sub && pagd name -->
				
				<h2 class="article-title ta-c">후기 수정</h2>
				
				<!-- 수정 폼 -->
				<form action="${path}/myReviewUpdate.do" method="post">
					<input type="hidden" name="rv_id" value="${dto.rv_id}"/>
					
					<!-- 별점 -->
			        <div class="rating r4">
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
			        <div class="">
			            <textarea name="rv_content" class="textarea"><c:out value="${dto.rv_content}"/></textarea>
			        </div>
			
					<!-- 버튼 -->
					<div class="button-area pack-center">
						<button type="submit" class="btn blue medium">저장</button>
						<a class="btn bdr-blue medium" href="myReviewList.do">목록</a>
			   		</div>
			    </form>
			    
				
				
			</div><!-- // #content -->
			<!-- 컨텐츠 끝 -->
		
			<!-- nav 시작 -->
			<%@ include file="../../common/nav.jsp" %>
			<!-- nav 끝 -->
		
			<!-- footer 시작 -->
			<%@ include file="../../common/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container -->
	</div><!-- // #wrap -->
</body>
</html>