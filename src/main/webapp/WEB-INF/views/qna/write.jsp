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
					    <label class="label-box">
							<span class="text-label">제목</span>
							<input type="text" name="qa_tital" class="input-text" placeholder="제목을 입력해주세요">
						</label>
						<label class="label-box">
							<span class="text-label">내용</span>
							<textarea name="qa_content" id="qa_content" class="input-text"></textarea>
						</label>
						<label class="check-wrap">
							<input type="checkbox" class="checkbox" name="qa_private" value="Y" >
							<span>비밀글</span>
						</label>
						<label class="check-wrap">
							<input type="checkbox" class="checkbox" name="qa_show" checked >
							<span>노출여부</span>
						</label>
						<div>
							<button type="submit" class="btn blue medium">작성하기</button>
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

</body>
</html>