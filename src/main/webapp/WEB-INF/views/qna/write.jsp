<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common/setting.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>전문가 QnA</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${path}/resources/css/yaksok.css">
	<script src="${path}/resources/js/lib/aos.js" defer></script>
	<script src="${path}/resources/js/yaksok.js" defer></script>
	<script src="${path}/resources/js/common/request.js"></script>
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

</body>
</html>