 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>약을 쏘옥, 약속</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/yaksok.css">

<!--  js -->
<script src="https://kit.fontawesome.com/d7162d59a4.js" crossorigin="anonymous"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>

<script>
   $(function() {
      // 내비게이션 선택
      nav.current(4);
   });
</script>
</head>
<body>
	<div id="wrap" class="wrap">
		<!-- PC 컨텐츠 -->
		<%@ include file="../../common/pc_left.jsp" %>
		<!-- PC 컨텐츠 끝 -->
		
		<div id="container" class="lines">
		<!-- [D] HEADER VIEW :  no class /.lines(2) / .only-back(1) / .only-close(1) -->
			<!-- header 시각 -->
			<%@ include file="../../common/header.jsp" %>
			<!-- header 끝 -->
		
			
			<!-- 컨텐츠 시작 -->
			<!-- SID : COM000 -->
			<div id="content" class="sub"><!-- [D] main / sub-main / sub && pagd name -->
				
				<h2 class="page-title ta-c">Q&amp;A 수정</h2>
				
				<!-- 수정 폼 -->
				<form action="${path}/myQnaUpdate.do" method="post">
					<fieldset class="pack-down gap-24">
					<legend class="blind">${dto.qa_id} 후기작성폼</legend>
						<input type="hidden" name="qa_id" value="${dto.qa_id}"/>
						<input type="hidden" name="pageNum" value="${empty param.pageNum ? '1' : param.pageNum}" />
						
						<!-- 제목 -->
						<p class="pack-down gap-4">
							<span class="fc-body">제목</span>
							<input type="text" class="input-text" name="qa_title" value="${dto.qa_title}"/>
						</p>
	
						<!-- 내용 -->
						<p class="pack-down gap-4">
							<span class="fc-body">내용</span>
						  	<textarea name="qa_content" class="textarea"><c:out value="${
							    fn:trim(
							      fn:replace(
							        fn:replace(
							          fn:replace(
							            fn:replace(
							              fn:replace(dto.qa_content,'<p>',''),
							            '</p>',''),
							          '<br/>','&#10;'),
							        '<br />','&#10;'),
							      '<br>','&#10;')
							    )
						  }"/></textarea>
						</p>
				        
				        <p class="pack-left gap-40">
							<span class="fc-body" >비밀글 여부</span>
							<span class="pack-left gap-40">
								<label class="pack-left gap-4">
									<input type="radio" class="radio" name="qa_private" value="N" 
										<c:if test="${fn:trim(dto.qa_private) == 'N'}">checked="checked"</c:if> />
									  	공개
								</label>
								<label class="pack-left gap-4">
									<input type="radio" class="radio" name="qa_private" value="Y" 
										<c:if test="${fn:trim(dto.qa_private) == 'Y'}">checked="checked"</c:if> />
									  	 비밀글
								</label>
							</span>
						</p>
						
						<!-- 버튼 -->
						<div class="button-area pack-center">
							<button type="submit" class="btn black medium r-full">수정</button>
				   		</div>
					</fieldset>
			    </form>
				
			</div><!-- // #content -->
			<!-- 컨텐츠 끝 -->
		
			<!-- nav 시작 -->
			<%@ include file="../../common/nav.jsp" %>
			<!-- nav 끝 -->
		
			<!-- footer 시작 -->
			<%@ include file="../../common/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container -->
	</div><!-- // #wrap -->
	<%@ include file="../../common/chat-widget.jspf" %>
</body>
</html>