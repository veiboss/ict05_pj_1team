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
<form name="frm" id="frm" action="${path}/qna/write" method="POST">
    <div>
        <table>
            <tr>
                <td>제목</td>
                <td><input type="text" name="qa_title" value=""></td>
            </tr>
            <tr>
                <td>질문</td>
                <td><textarea name="qa_content" id="qa_content"></textarea></td>
            </tr>
            <tr>
                <td>비밀글</td>
                <td><input type="checkbox" name="qa_private" value="Y"></td>
            </tr>
            <tr>
                <td>노출여부</td>
                <td><input type="checkbox" name="qa_show" value="Y" checked></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="전송"></td>
            </tr>
        </table>
    </div>
</form>
<script>
    ClassicEditor.create(document.querySelector("#qa_content"), {
        language: "ko",
        ckfinder: {
            uploadUrl: "${path}/image/upload",
            withCredentials: true
        }
    });
</script>

</body>
</html>