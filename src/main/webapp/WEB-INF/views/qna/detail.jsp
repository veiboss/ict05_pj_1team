<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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
<h3>${dto.qa_title}</h3>
<div>${dto.qa_content}</div>
<hr/>
<div>${dto.qa_answer}</div>
<hr/>
<form name="frm" id="frm" action="${path}/qna/answer" method="POST">
    <input type="hidden" name="qa_id" value="${qa_id}">
    <div>
        <table>
            <tr>
                <td>답변</td>
                <td><textarea name="qa_answer" id="qa_answer">${dto.qa_answer}</textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="전송"></td>
            </tr>
        </table>
    </div>
</form>
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