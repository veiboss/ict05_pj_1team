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
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>

<script src="${path}/resources/js/lib/jquery.waypoints.min.js" defer></script>
<script src="${path}/resources/js/lib/jquery.counterup.js" defer></script>
<script src="${path}/resources/js/lib/easy-pie-chart/jquery.easypiechart.min.js" defer></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
<script>
	$(function() {
		$('.chart:not(.small)').easyPieChart({
			animate: 2000,
			easing: 'easeOutBounce',
			barColor: '#687FE5',
			scaleColor: false,
			trackColor: '#f1f1f1',
			lineWidth: 16,
			size: 200,
		});
	});
	
	$(function() {
		$('.chart.small').easyPieChart({
			animate: 2000,
			easing: 'easeOutBounce',
			barColor: '#687FE5',
			scaleColor: false,
			trackColor: '#f1f1f1',
			lineWidth: 6,
			size: 52,
		});
	});
	
	$(".chart .fc-blue").counterUp({
		time: 1000,
	});
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
			document.getElementById("score").innerText = `\${score}`;
			document.getElementById("comment").innerText = comment;
		});
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
				<div class="out-cont bg-gray">
					<div class="section result bg-white">
						<div class="card" id="resultCard">
							<p class="badge-wrap">
								<span class="badge ballon blue">약속에서 체크한</span>
							</p>
							<div class="pack-down-center gap-20">
								<h2 class="card-title fw-600">${sessionName}님의 최근 점수는</h2>
								<div id="score" class="chart" data-percent="${dto.mbs_score}">
									<span class="point pack-left gap-4">
										<strong class="fs-40 fc-blue">${dto.mbs_score}</strong>
										<span class="fc-gray">점</span>
									</span>
								</div>
								<div class="fs-14 fc-gray fw-500" id="comment"></div>
							</div>
							<div class="button-area pack-center gap-12">
								<a class="btn black large r-full" href="MA13">다시 테스트하기</a>
							</div>
						</div>
						
						<div class="section list-wrap">
							<ul class="data-list toon">
								<c:forEach var="dto" items="${list}">
									<li>
										<a class="pack-both gap-40">
											<span class="fs-14 fc-dark-gray">${dto.mbs_servey_date}</span>
											<span class="pack-left gap-16">
												<span class="point pack-left gap-4">
													<strong class="fs-20 fc-blue">${dto.mbs_score}</strong>
													<span class="fc-dark-gray">점</span>
												</span>
												<span class="chart small" data-percent="${dto.mbs_score}"></span>
											</span>
										</a><!-- .item.thumb-left -->
									</li>
								</c:forEach>
							</ul>
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
</body>
</html>