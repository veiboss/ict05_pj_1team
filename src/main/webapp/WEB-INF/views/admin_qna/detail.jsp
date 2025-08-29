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
</head>
<body>
<div class="skip-nav"><a href="#content">본문 바로가기</a></div>

<div id="wrap" class="frame">
    <%@ include file="../admin/aside.jsp" %>
    <%@ include file="../admin/header.jsp" %>
    <div id="container" class="container">
        <div class="title-bar">
            <h2 class="page-title ellipsis">전문가 Q&A</h2>
        </div>
        <main id="content">
            <h3>${dto.qa_title}</h3>
            <hr/>
            <div>${dto.qa_content}</div>
            <c:if test="${sessionScope.sessionID == dto.qa_writer_id}">
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
                <a class="btn bdr-gray medium" href="${path}/admin/qna/list">목록</a>
                <a class="btn bdr-gray medium" href="${path}/qna/write">전문가 Q&A 작성</a>
            </div>
        </main>
        <%@ include file="../admin/footer.jsp" %>
    </div>
</div>
</body>
</html>