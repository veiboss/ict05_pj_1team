<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

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
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <title>약쏙 관리자</title>
    <link rel="stylesheet" href="${path}/resources/css/yaksokAd.css">
    <script src="${path}/resources/js/yaksokAd.js" defer></script>
        <link rel="stylesheet" href="${path}/resources/ckeditor/style.css">
    <link rel="stylesheet" href="${path}/resources/ckeditor/ckeditor5.css">
    <script src="https://cdn.ckeditor.com/ckeditor5/41.2.1/classic/ckeditor.js"></script>
    <style>
        .ck-editor__editable:not(.ck-editor__nested-editable) {
            height: 450px;
        }
    </style>
    
</head>
<body>
<div class="skip-nav"><a href="#content">본문 바로가기</a></div>

<div id="wrap" class="frame">
    <%@ include file="../admin/aside.jsp" %>
    <%@ include file="../admin/header.jsp" %>
		<div id="container" class="container">
			<!-- 컨텐츠 시작 -->
        <div class="title-bar">
            <h2 class="page-title ellipsis">전문가 Q&A</h2>
        </div>
        
        <main id="content">
        	<div class="write-form box-wrap" style="max-width: 960px; gap: 40px;">
            <form name="frm" id="frm" method="POST">
            <fieldset class="pack-down" style="gap: 20px;">
            	<legend class="blind">기본 정보</legend>
            	
                <input type="hidden" name="qa_id" value="${dto.qa_id}">
                <div class="row">
                    <label class="field pack-down">
                    	<span class="label medium required">제목</span>
                    	<span class="insert">
                            <input type="text" name="qa_title" class="input-text medium" value="${dto.qa_title}" placeholder="제목을 입력해주세요">
                    	</span>
                    </label>
				</div>
				<div class="row">
                    <div>
                        <textarea name="qa_content" id="qa_content">${dto.qa_content}</textarea>
                    </div>
				</div>
				<div class="row">
					<div class="insert pack-left">
                        <label class="check-wrap">
                            <input type="checkbox" class="checkbox" name="qa_private" value="Y" ${dto.qa_private == 'Y' ? 'checked' : ''}>
                            <span>비밀글</span>
                        </label>

                        <label class="check-wrap">
                            <input type="checkbox" class="checkbox" name="qa_show" ${dto.qa_show == 'Y' ? 'checked' : ''}>
                            <span>노출여부</span>
                        </label>
                    </div>

					<div class="button-area pack-center">
                        <button type="submit" class="btn large color1">수정하기</button>
                    </div>
                    
					<div class="button-area pack-both">
                        <a class="btn medium bdr-color1" href="${path}/admin/qna/list">QnA 목록</a>
                        <a class="btn medium color1" href="${path}/qna/write">전문가 QnA 등록</a>
                    </div>

                </div>
            </fieldset>
            </form>
            </div>
        </main>
        <%@ include file="../admin/footer.jsp" %>
    </div>
</div>
<script>
    ClassicEditor.create(document.querySelector("#qa_content"), {
        language: "ko",
        ckfinder: {
            uploadUrl: "${path}/image/upload",
            withCredentials: true
        }
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const form = document.getElementById("frm");

        form.addEventListener("submit", async function (e) {
            e.preventDefault(); // 기존 폼 제출 방지

            // FormData 생성
            const formData = new FormData();
            formData.append("qa_id", form.qa_id.value);
            formData.append("qa_title", form.qa_title.value);
            formData.append("qa_content", form.qa_content.value);
            formData.append("qa_private", form.qa_private.checked ? "Y" : "N");
            formData.append("qa_show", form.qa_show.checked ? "Y" : "N");

            try {
                const response = await fetch(`${path}/API/qna/modify`, {
                    method: "POST",
                    body: formData,
                    credentials: "include" // 세션 유지
                });

                const result = await response.json(); // 서버가 JSON 반환한다고 가정
                console.log(result);

                // 성공 시 처리
                if (result.status === 200) {
                    alert("QnA 수정 완료!");
                    window.location.href = `${path}/admin/qna/list`;
                } else {
                    alert("오류: " + result.message);
                }

            } catch (error) {
                console.error("Fetch Error:", error);
                alert("서버와 통신 중 오류가 발생했습니다.");
            }
        });
    });
</script>
</body>
</html>