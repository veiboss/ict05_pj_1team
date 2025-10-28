<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/setting.jsp"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<title>약쏙 관리자</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/yaksokAd.css">

<link rel="stylesheet" href="${path}/resources/ckeditor/style.css">
<link rel="stylesheet" href="${path}/resources/ckeditor/ckeditor5.css">
<script
	src="https://cdn.ckeditor.com/ckeditor5/41.2.1/classic/ckeditor.js"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/yaksokAd.js" defer></script>
<script>window.APP_CTX='${path}';</script>
<style>
.ck-editor__editable:not(.ck-editor__nested-editable) {
	height: 450px;
}

.label-box .input-text[name="fa_writer_name"] {
	width: 200px; /* 원하시는 픽셀로 조정 */
	max-width: 100%;
	flex: 0 0 200px; /* flex로 늘어나지 않게 고정 */
}
/* 라벨과 입력칸을 나란히 보이게 (필요 시) */
.label-box.writer {
	display: inline-flex;
	align-items: center;
	gap: 8px;
}

.label-box .text-label {
	white-space: nowrap;
}
</style>
</head>
<body>
	<div class="skip-nav">
		<a href="#content">본문 바로가기</a>
	</div>

	<div id="wrap" class="frame">
		<!-- menu 시작 -->
		<%@ include file="../admin/aside.jsp"%>
		<!-- menu 끝 -->

		<!-- header 시작 -->
		<%@ include file="../admin/header.jsp"%>
		<!-- header 끝 -->

		<div id="container" class="container">
			<!-- 컨텐츠 시작 -->

			<div class="title-bar">
				<div class="pack-left">
					<h2 class="page-title ellipsis">FAQ 등록</h2>
				</div>
			</div>

			<main id="content">
				<div class="write-form box-wrap" style="max-width: 960px;">
					<form name="insertForm" id="frm"
						action="${path}/faq_insertAction.fc" method="POST">
						<fieldset class="pack-down" style="gap: 20px;">
							<div class="row-2">
								<div class="field col pack-down">
									<label class="label medium required" for="writerName">작성자</label>
									<div class="insert">
										<input type="text" class="input-text medium"
											name="fa_writer_name" id="writerName"
											placeholder="작성자를 입력해주세요" required>
									</div>
								</div>

								<div class="field col pack-down">
									<span class="label medium">노출/비노출 여부</span>
									<div class="insert pack-left">
										<label for="radio1" class="pack-left"><input
											type="radio" class="radio" name="fa_show" id="fa_show"
											value="Y" <c:if test="${dto.fa_show eq 'Y'}">checked</c:if>>노출</label>
										<label for="radio2" class="pack-left"><input
											type="radio" class="radio" name="fa_show" id="fa_show"
											value="N" <c:if test="${dto.fa_show eq 'N'}">checked</c:if>>비노출</label>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="field col-2 pack-down">
									<label class="label medium required" for="faTitle">제목</label>
									<div class="insert">
										<input type="text" class="input-text medium" name="fa_title"
											id="faTitle" placeholder="제목을 입력해주세요" required>
									</div>
								</div>
							</div>

							<div class="row">
								<textarea name="fa_content" id="fa_content" maxlength="4000"
									class="textarea medium">
								</textarea>
							</div>

							<div class="button-area pack-center">
								<button type="submit" class="btn large color1">FAQ 등록</button>
							</div>
						</fieldset>
					</form>
				</div>
				<!--.write-form -->
			</main>

			<!-- 컨텐츠 끝 -->


			<!-- footer 시작 -->
			<%@ include file="../admin/footer.jsp"%>
			<!-- footer 끝 -->
		</div>
		<!-- // #container  -->
	</div>
	<!-- // #wrap  -->

	<script>
  let faEditor = null;

  ClassicEditor.create(document.querySelector("#fa_content"), {
      language: "ko"
  }).then(editor => {
      faEditor = editor;

      document.getElementById("frm").addEventListener("submit", function (e) {
          const title = document.querySelector('input[name="fa_title"]').value.trim();
          const content = faEditor.getData().trim(); // 단순히 내용 유무만 체크

          if (title === "") {
              alert("제목을 입력하세요!!!");
              e.preventDefault();
              return;
          }

          if (content === "") {
              alert("내용을 입력하세요!!!");
              e.preventDefault();
              return;
          }
      });
  });
</script>
	<!-- === Chatbot Widget === -->
	<%@ include file="../common/chat-widget.jspf"%>
</body>
</html>