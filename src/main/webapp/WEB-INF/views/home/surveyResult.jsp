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
	
	@import url(${path}/resources/css/_colors.css);
	@import url(${path}/resources/css/_fonts.css);
	@import url(${path}/resources/css/_button.css);
	
	.card {
		background: white;
		border-radius: 20px;
		box-shadow: 0 6px 16px rgba(0,0,0,0.15);
		padding: 32px;
		max-width: 500px;
		width: 90%;
		margin: auto;
		text-align: center;
		animation: fadeIn 0.5s ease;
		align: center;
	}
	.score {
		font-size: 32px;
		font-weight: bold;
		color: var(--blue);
		margin-bottom: 16px;
	}
	.comment {
		font-size: 18px;
		line-height: 1.6;
		color: black;
	}
	.retry-btn {
		margin-top: 24px;
	}
	
	@keyframes fadeIn {
		from { opacity: 0; transform: translateY(20px); }
		to { opacity: 1; transform: translateY(0); }
	}
</style>
<script>
	const urlParams = new URLSearchParams(window.location.search);
	const score = parseInt(urlParams.get("score")) || 0;
	
	fetch("${path}/resources/json/result.json")
		.then(res => res.json())
		.then(data => {
			let comment = "결과를 찾을 수 없습니다.";
			for (let r of data.results) {
				if (score >= r.min && score <= r.max) {
					comment = r.comment;
					break;
				}
			}
			document.getElementById("score").innerText = `\${score}점`;
			document.getElementById("comment").innerText = comment;
		});
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
			
			<div class="card" id="resultCard">
				<hx class="article-title">"${sessionName}"님의 점수는 !</hx>
				<div class="score" id="score">${dto.mbs_score}</div>
				
					<div class="comment" id="comment"></div>
				
				<a class="btn blue medium" href="MA13">다시 테스트하기</a>
				<a class="btn blue medium" href="MA20">최근 설문 보기</a>
			</div>
			<div class="table-wrap">
				<table class="data-table">
					<colgroup>
						<col>
						<col>
						<col>
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">추천 영양제</th>
						</tr>
					<c:forEach var="drug_dto" items="${list}">
						<tr>
							<th scope="row">영양제</th>
						</tr>
						<tr>
							<td data-th="TH1 : ">${drug_dto.dr_product}</td>
						</tr>
						<tr>
							<th scope="row">효과</th>
						</tr>
						<tr>
							<td data-th="TH1 : ">${drug_dto.dr_main_function}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
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