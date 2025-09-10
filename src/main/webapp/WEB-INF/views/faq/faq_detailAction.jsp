<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="${path}/resources/ckeditor/style.css">
<link rel="stylesheet" href="${path}/resources/ckeditor/ckeditor5.css">
<script src="https://cdn.ckeditor.com/ckeditor5/41.2.1/classic/ckeditor.js"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/yaksokAd.js" defer></script>
<style>
	/* yaksokAd.css 뒤에 추가하거나 <style> 태그로 덮어쓰기 */
	.short-writer {
	  width: 150px;      /* 원하시는 폭(px, em 등으로 조정) */
	  max-width: 100%;   /* 반응형 대비 */
	}
</style>
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
				<div class="pack-left">
					<h2 class="page-title ellipsis">FAQ 상세/수정</h2>
				</div>
			</div>
			
				<main id="content">
					<div class="write-form box-wrap" style="max-width: 960px;">
						<form action="faq_update.fc" method="post">
							<input type="hidden" name="fa_id" value="${dto.fa_id}"/>
							<fieldset class="pack-down" style="gap: 20px;">
								<div class="row-2">
								<div class="field col pack-down">
									<label class="label medium required" for="writerName">작성자</label>
									<div class="insert">
										<strong><input value="${dto.fa_writer_name}"></strong>
									</div>
								</div>
								
								<div class="field col pack-down">
									<label class="label medium required" for="writerName">수정자</label>
									<div class="insert">
										<input type="text" class="input-text medium" name="fa_writer_name" id="writerName" placeholder="수정자를 입력해주세요" required>
									</div>
								</div>
								
								<div class="field col pack-down">
									<span class="label medium">회원등급</span>
									<div class="insert pack-left">
										<label class="pack-left">
											<input type="radio" class="radio" name="fa_show"value="Y" <c:if test="${dto.fa_show eq 'Y'}"> checked </c:if>>
											<span>노출</span>
										</label>
										<label class="pack-left">
											<input type="radio" class="radio" name="fa_show" value="N" <c:if test="${dto.fa_show eq 'N'}"> checked </c:if>>
											<span>비노출</span>
										</label>
									</div>
								</div>
								
								<div class="row">
								<div class="field col pack-down">
									<label class="label medium required" for="faTitle">FAQ 제목</label>
									<div class="insert">
										<input type="text" class="input-text medium" name="fa_title" id="faTitle" value="${dto.fa_title}" required>
									</div>
								</div>
							</div>
						
								<div class="row">
									<div class="field">
										<label class="label medium" for="inputSet02">FAQ 내용</label>
										<div class="insert">
											<textarea name="fa_content" class="textarea medium" rows="6" cols="50" placeholder="텍스트에리어">${fn:replace(
											    fn:replace(
											      fn:replace(
											        fn:replace(
											          fn:replace(dto.fa_content,'<p>',''),
											        '</p>',''),
											      '<br/>',''),
											    '<br />',''),
											  '<br>','')}
										   </textarea>
										</div>
									</div>
								</div>
								<div class="button-area pack-center">
									<button type="submit" class="btn large color1">수정</button>
									<a class="btn large bdr-color1" href="faq_admin_list.fc">취소</a>
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
	<!-- === Chatbot Widget === -->
	<%@ include file="../common/chat-widget.jspf"%>
</body>
</html>