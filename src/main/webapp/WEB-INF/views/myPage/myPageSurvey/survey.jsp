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
<link rel="stylesheet" href="${path}/resources/css/survey/survey.css">

<!--  js -->
<script src="https://kit.fontawesome.com/d7162d59a4.js" crossorigin="anonymous"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
<style></style>
<script>
	let questions = [];
	let currentIndex = 0;
	let answers = {};
	
	fetch("${path}/resources/json/survey.json")
		.then(res => res.json())
		.then(data => {
		console.log("불러온 데이터:", data);
		questions = data.questions;
		console.log("questions 배열:", questions);
		showQuestion(currentIndex);
	});
	
	function showQuestion(index) {
		const q = questions[index];
		if (!q) return;
		
		document.getElementById("question").innerHTML = `<p>\${q.id}. \${q.text}</p>`;
		
		let optionsHTML = "";
		q.options.forEach(opt => {
			optionsHTML += `
				<label class="btn bdr-gray medium">
					<input type="radio" name="q\${q.id}" value="\${opt.score}" 
						onchange="selectAnswer(\${q.id}, \${opt.score})">
					<strong class="fs-18">\${opt.text}</strong>
				</label>
			`;
		});
		document.getElementById("options").innerHTML = optionsHTML;
		document.getElementById("progress").innerText = `\${index+1} / \${questions.length}`;
	}
	
	function selectAnswer(qid, score) {
		answers[qid] = score;
		setTimeout(() => {
			if (currentIndex < questions.length - 1) {
				currentIndex++;
				showQuestion(currentIndex);
			} else {
				calculateScore();
			}
		}, 300); // 약간의 딜레이 후 자동 넘어감
	}
	
	function calculateScore() {
		let total = 0;
		Object.values(answers).forEach(v => total += parseInt(v));
		window.location.href = `MA14?score=\${total}`;
	}
</script>
</head>
<body>
	<div id="wrap" class="wrap">
		<!-- PC 컨텐츠 -->
		<%@ include file="../../common/pc_left.jsp" %>
		<!-- PC 컨텐츠 끝 -->
		
		<div id="container" class="">
		<!-- [D] HEADER VIEW :  no class /.lines(2) / .only-back(1) / .only-close(1) -->
			<!-- header 시각 -->
			<%@ include file="../../common/header.jsp" %>
			<!-- header 끝 -->
		
			
			<!-- 컨텐츠 시작 -->
			<!-- SID : COM000 -->
			<div id="content" class="sub"><!-- [D] main / sub-main / sub && pagd name -->
				<div class="bg-gray out-cont">
					<div class="article card acitve">
						<div id="surveyCard">
							<div class="article-header ta-c">
								<h2 class="article-title">내 건강 점수는?</h2>
							</div>
							<div class="pack-down-center gap-20">
								<div id="question" class=""></div>
								<div id="options" class="select-options pack-down-center gap-12"></div>
								<div id="progress"></div>
							</div>
						</div>
					</div><!-- //.article.card -->
				</div><!-- //.bg-gray -->
				
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
	
	<%@ include file="../../common/loading.jsp" %><!-- 약속 로딩 -->
	<!-- === Chatbot Widget === -->
	<%@ include file="../../common/chat-widget.jspf" %>
</body>
</html>