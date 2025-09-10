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
    	#frm,
    	#frm textarea,
    	.ck.ck-editor{width: 100%;}
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
        <div id="content" class="sub detail">
			<h2 class="blind">Q&amp;A</h2>
			<article class="article">
				<div class="article-header">
                    <p class="data-wrap mdot">
                        <i class="ico-bg blue r10"><span>Q</span></i>
                        <!-- [D] 답변 전 -->
                        <c:if test="${empty dto.qa_answer}">
                            <span class="q-ing">궁금해요</span>
                        </c:if>
                        <c:if test="${not empty dto.qa_answer}">
                            <span class="q-solved">궁금증해결</span>
                        </c:if>
                    </p>
	
					<h3 class="article-title">${dto.qa_title}</h3>
	
					<div class="pack-both">
                        <div class="pack-left">
                            <div class="img-wrap circle s36">
                                <img src="https://cdn.pixabay.com/photo/2014/11/29/19/33/bald-eagle-550804_960_720.jpg"
                                     alt="프로필아이디" class="centered">
                            </div>
                            <div class="user">
                                <span class="user-name fc-dark-gray">${dto.qa_id} 작성자 이름이 오는게 좋을 것 같아요~</span>
                            </div>
                        </div>
	
						<p class="data-wrap">
							<fmt:formatDate value="${dto.qa_reg_date}" pattern="yyyy. MM. dd"/>
						</p>
					</div>
				</div>
            <div class="article-body ta-c fc-body">${dto.qa_content}</div>
            <c:if test="${sessionScope.sessionID == dto.qa_writer_id}">
                <div style="margin-top:10px;text-align:right">
                    <a class="btn bdr-gray medium" href="${path}/qna/modify/${dto.qa_id}">수정</a>
                </div>
            </c:if>
			</article>
            <hr class="out-cont section-bar">
            <section class="section answer pack-down-right gap-20">
            <c:if test="${empty dto.qa_answer}">
                <div class="nodata-box fc-dark-gray">답변이 아직 등록되지 않았습니다.</div>
            </c:if>
            <c:if test="${not empty dto.qa_answer}">
            	<p class="data-wrap mdot">
            		<span>전문가 <span>{전문가 닉네임}</span>의 답변</span>
                	<i class="ico-bg blue r10"><span>A</span></i>
                </p>
                <div class="fs-16 ta-r fc-body" style="padding-left: 48px;">${dto.qa_answer}</div>
            </c:if>
            <c:if test="${sessionScope.sessionGrade == 'EXPERT'}">
                <c:if test="${empty dto.qa_answer}">
                    <form name="frm" id="frm" action="${path}/qna/answer" method="POST">
                        <input type="hidden" name="qa_id" value="${qa_id}">
                        <div class="pack-down">
                            <textarea name="qa_answer" id="qa_answer">${dto.qa_answer}</textarea>
                        	
                        	<div class="button-area pack-center">
                            	<button type="submit" class="btn black large r-full">답변등록</button>
                        	</div>
                        </div>
                    </form>
                </c:if>
            </c:if>
            </section>
            <div class="button-area pack-both">
                <a class="btn bdr-blue medium r-full" href="${path}/qna/list">목록</a>
                <a class="btn blue medium r-full" href="${path}/qna/write">전문가에게 물어보기</a>
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
<%@ include file="../common/chat-widget.jspf" %>
</body>
</html>