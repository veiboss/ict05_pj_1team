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
        
            <form name="insertForm" id="frm" action="${path}/faq_insertAction.fc" method="POST">
                <div>
                    <div>
                        <label class="label-box">
                            <span class="text-label">제목</span>
                            <input type="text" name="fa_title" class="input-text" placeholder="제목을 입력해주세요">
                        </label>
                    </div>
                    <div style="margin-top:10px;">
                        <textarea name="fa_content" id="fa_content"></textarea>
                    </div>
                    
                    <div class="insert pack-left">
						<label for="radio1" class="pack-left"><input type="radio" class="radio" name="fa_show" id="fa_show" value="Y" checked>노출</label>
						<label for="radio2" class="pack-left"><input type="radio" class="radio" name="fa_show" id="fa_show" value="N" >비노출</label>
					</div>
                 
                    </div>
					
					<div style="text-align: center; margin-top: 20px;">
						<button type="submit" class="btn blue medium">등록하기</button>
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
</body>
</html>