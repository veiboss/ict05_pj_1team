<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/setting.jsp" %>
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
<style>
	@charset "UTF-8";
	/* ICT TeamONE _ 약을 쏘옥, 약속 _ KimJuyeon _ 20250818 */
	/* 
	@import url(${path}/resources/css/_colors.css);
	@import url(${path}/resources/css/_fonts.css);
	
	.card {
		background: white;
		border-radius: 16px;
		box-shadow: 0 4px 10px rgba(0,0,0,0.1);
		padding: 24px;
		max-width: 400px;
		width: 100%;
		margin: auto;
		text-align: center;
		animation: fadeIn 0.4s ease;
	}
	#question {
		font-size: 16px;
		font-weight: bold;
		color: black;
		margin-bottom: 16px;
	}
	
	#question p {
		color: black;
		font-size: 16px;
		font-weight: bold;
	}
	
	.options label span {
		color: black;
		font-size: 14px;
	}
	
	#options input:checked + span {
		font-weight: bold;
		color: var(--blue);
	}
	.options label {
		color: black;
		display: block;
		margin: 12px 0;
		padding: 12px;
		border-radius: 10px;
		border: 1px solid var(--light-gray);
		cursor: pointer;
		transition: all 0.2s ease;
	}
	.options input {
		display: none;
	}
	.options label:hover {
		background: #f0f4ff; 
		border-color: var(--blue);
	}
	#options input:checked + span {
		font-weight: bold;
		color: var(--blue);
	}
	@keyframes fadeIn {
		from { opacity: 0; transform: translateY(20px); }
		to { opacity: 1; transform: translateY(0); }
	}
	#progress {
		margin-top: 16px;
		font-size: 14px;
		color: var(--very-dark-gray);
	}
 */
 
	.article.card .card:not(.active){display:none;}
	.article-header + .pack-down-center {padding-top: 20px;}
	.article.card .btn{ border-radius: 100px;}
	
	.article.card .select-options {height: fit-content;}
	.article.card .select-options:before{display: none;} 
	.article.card .select-options .btn{padding: 12px 16px 12px; min-width: 50%; font-size: 18px;}
	
	.article.card .input-text.large	{width: 50%; height: var(--large); line-height: var(--large); text-align:center; font-size: 18px; font-weight: bold;}
	
	.article.card .card > .button-area{margin: 0 auto; padding: 40px 0; width: 80%; text-align:center;}
	
	.btn.bdr-gray:has(input:checked){border: solid 1px var(--blue);}
	
	.article.card .button-area .btn.large {width: 50%; text-align: center;}
	
	#survey-container .article-type {padding: 20px 0; text-align: right;}
	
	#surveyCard{position: relative;}
	#question {font-size: 20px; font-weight: bold; line-height: 1.35; letter-spacing: -0.6px;}
	#progress {position: absolute; top: 72px; right: 0; font-weight: bold; color: var(--blue);}
 </style>
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
		<%@ include file="../common/pc_left.jsp" %>
		<!-- PC 컨텐츠 끝 -->
		
		<div id="container" class="">
		<!-- [D] HEADER VIEW :  no class /.lines(2) / .only-back(1) / .only-close(1) -->
			<!-- header 시각 -->
			<%@ include file="../common/header.jsp" %>
			<!-- header 끝 -->
		
			
			<!-- 컨텐츠 시작 -->
			<!-- SID : COM000 -->
			<div id="content" class="sub"><!-- [D] main / sub-main / sub && pagd name -->

				<div class="bg-gray">
					<div class="article card acitve">
						<div class="card active" id="surveyCard">
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
			<%@ include file="../common/nav.jsp" %>
			<!-- nav 끝 -->
		
			<!-- footer 시작 -->
			<%@ include file="../common/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container -->
	</div><!-- // #wrap -->
</body>
</html>