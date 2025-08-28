<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common/setting.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>전문가 QnA</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${path}/resources/css/yaksok.css">
    <script src="${path}/resources/js/lib/aos.js" defer></script>
    <script src="${path}/resources/js/yaksok.js" defer></script>
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
<div id="wrap" class="wrap">
    <%@ include file="../common/pc_left.jsp" %>
    <div id="container" class="lines">
        <%@ include file="../common/header.jsp" %>
        <div id="content" class="sub si20">
            <form name="frm" id="frm" method="POST">
                <div>
                    <div>
                        <label class="label-box">
                            <span class="text-label">제목</span>
                            <input type="text" name="qa_title" class="input-text" placeholder="제목을 입력해주세요">
                        </label>
                    </div>
                    <div style="margin-top:10px;">
                        <textarea name="qa_content" id="qa_content"></textarea>
                    </div>
                    <div style="margin:10px 0">
                        <label class="check-wrap">
                            <input type="checkbox" class="checkbox" name="qa_private" value="Y">
                            <span>비밀글</span>
                        </label>
                    </div>
                    <div style="margin:10px 0">
                        <label class="check-wrap">
                            <input type="checkbox" class="checkbox" name="qa_show" checked>
                            <span>노출여부</span>
                        </label>
                    </div>
                    <div>
                        <button type="submit" class="btn blue medium">작성하기</button>
                    </div>
                    <div style="margin-top:10px;text-align:right">
                        <a class="btn bdr-gray medium" href="${path}/qna/list">목록</a>
                        <a class="btn bdr-gray medium" href="${path}/qna/write">전문가 QnA 작성</a>
                    </div>

                </div>
            </form>
        </div>

        <%@ include file="../common/nav.jsp" %>
        <%@ include file="../common/footer.jsp" %>
    </div>
</div>
<div id="alertSignIn" class="overlay not-close">
    <div id="emailCheckWrap" class="alert"></div>
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
document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("frm");

    form.addEventListener("submit", async function(e) {
        e.preventDefault(); // 기존 폼 제출 방지

        // FormData 생성
        const formData = new FormData();
        formData.append("qa_title", form.qa_title.value);
    	formData.append("qa_content", form.qa_content.value);
        formData.append("qa_private", form.qa_private.checked ? "Y" : "N");
        formData.append("qa_show", form.qa_show.checked ? "Y" : "N");

        try {
            const response = await fetch(`${path}/API/qna/write`, {
                method: "POST",
                body: formData,
                credentials: "include" // 세션 유지
            });

            const result = await response.json(); // 서버가 JSON 반환한다고 가정
            console.log(result);

            // 성공 시 처리
            if (result.status === 200) {
                alert("QnA 작성 완료!");
                window.location.href = `${path}/qna/list`;
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