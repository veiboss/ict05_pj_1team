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
            <h3>${dto.qa_title}</h3>
            <div>${dto.qa_content}</div>
            <c:if test="${sessionScope.sessionId == dto.qa_writer_id}">
            <div style="margin-top:10px;text-align:right">
                <a class="btn bdr-gray medium" href="${path}/qna/modify/${dto.qa_id}">수정</a>
            </div>
            </c:if>
            <hr/>
            <c:if test="${empty dto.qa_answer}">
                <div style="margin-top:10px;text-align:center;">답변이 아직 등록되지 않았습니다.</div>
            </c:if>
            <c:if test="${not empty dto.qa_answer}">
                <div>${dto.qa_answer}</div>
                <hr/>
            </c:if>
            <c:if test="${sessionScope.sessionGrade == 'EXPERT'}">
	            <c:if test="${empty dto.qa_answer}">
	                <form name="frm" id="frm" action="${path}/qna/answer" method="POST">
	                    <input type="hidden" name="qa_id" value="${qa_id}">
	                    <div>
	                        <textarea name="qa_answer" id="qa_answer">${dto.qa_answer}</textarea>
	                    </div>
	                    <div style="text-align:right;margin-top:10px;">
	                        <button type="submit" class="btn blue medium">답변등록</button>
	                    </div>
	                </form>
	            </c:if>
            </c:if>
            <div style="margin-top:10px;text-align:right">
                <a class="btn bdr-gray medium" href="${path}/qna/list">목록</a>
                <a class="btn bdr-gray medium" href="${path}/qna/write">전문가 Q&A 작성</a>
            </div>

        </div>

        <%@ include file="../common/nav.jsp" %>
        <%@ include file="../common/footer.jsp" %>
    </div>
</div>
<div id="alertSignIn" class="overlay not-close">
    <div id="emailCheckWrap" class="alert"></div>
</div>
<script>
    ClassicEditor.create(document.querySelector("#qa_answer"), {
        language: "ko",
        ckfinder: {
            uploadUrl: "${path}/image/upload",
            withCredentials: true
        }
    });
</script>

</body>
</html>