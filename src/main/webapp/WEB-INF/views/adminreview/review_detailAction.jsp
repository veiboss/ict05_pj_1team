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
			<div id="container" class="container">
				<div class="title-bar">
					<h2 class="page-title ellipsis">
						페이지 제목
					</h2>
				</div>
				<main id="content">
					<div class="write-form box-wrap">
						<form action="review_modify.ad">
							<fieldset>
								<legend class="blind">기본 정보</legend>
								<div class="row-3">
									<div class="field col">
										<label class="label medium required" for="mb_name">작성자</label>
										<div class="insert">
											<input type="text" name="mb_name" id="mb_name" class="input-text medium" title="작성자" placeholder="작성자 입력" value="${dto.mb_name}">
										</div>
									</div>
									<div class="field col">
										<label class="label medium" for="rv_rating">별점</label>
										<div class="insert">
											<select name="rv_rating" id="rv_rating" class="select medium">
												<option value="">선택</option>
												<option value="1" ${dto.rv_rating == 1 ? 'selected' : ''}>1</option>
												<option value="2" ${dto.rv_rating == 2 ? 'selected' : ''}>2</option>
												<option value="3" ${dto.rv_rating == 3 ? 'selected' : ''}>3</option>
												<option value="4" ${dto.rv_rating == 4 ? 'selected' : ''}>4</option>
												<option value="5" ${dto.rv_rating == 5 ? 'selected' : ''}>5</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row-2">
									<div class="field col">
										<span class="label medium">라디오</span>
										<div class="insert pack-left">
											<label for="radio1" class="pack-left"><input type="radio" class="radio" name="rv_show" id="rv_show" value="Y" 
												<c:if test="${dto.rv_show eq 'Y'}">checked</c:if>>노출</label>
											<label for="radio2" class="pack-left"><input type="radio" class="radio" name="rv_show" id="rv_show" value="N" 
												<c:if test="${dto.rv_show eq 'N'}">checked</c:if>>비노출</label>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="field col">
										<label class="label medium required" for="dr_product">제약명</label>
										<div class="insert">
											${dto.dr_product}
										</div>
									</div>
								</div>
								<div class="row">
									<div class="field">
										<label class="label medium" for="inputSet02">후기 내용</label>
										<div class="insert">
											<textarea class="textarea medium" rows="4" cols="50" placeholder="텍스트에리어">${dto.rv_content}</textarea>
										</div>
									</div>
								</div>
								<div class="button-area pack-center">
									<button type="submit" class="btn large color1">저장</button>
									<button type="reset" class="btn large bdr-color1">초기화</button>
								</div>
							</fieldset>
						</form>
					</div><!--.write-form -->
				</main>
			</div>
			<!-- 컨텐츠 끝 -->
			<!-- footer 시작 -->
			<%@ include file="../admin/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container  -->
	</div><!-- // #wrap  -->
</body>
</html>