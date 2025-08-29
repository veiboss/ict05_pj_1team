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

<script src="${path}/resources/js/lib/jquery.waypoints.min.js" defer></script>
<script src="${path}/resources/js/lib/jquery.counterup.js" defer></script>
<script src="${path}/resources/js/lib/easy-pie-chart/jquery.easypiechart.min.js" defer></script>

<style>
	
/* 
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
	 */
	#content > .bg-gray{padding: 68px 16px 16px;}
	.section.result {position: relative; padding: 50px 20px 24px; border-radius: 12px;}
	.section.result  .badge-wrap	{position: absolute; top: -12px; right: calc(50% - 30px); min-width: 186px; font-size: 14px;}
	#comment {max-width: 60%;}
	.result .chart {position: relative; display: block; margin: 0 auto;}
	.result .chart .point{position: absolute; left: 50%; top: 50%; transform: translate(-50%,-50%); line-height: 1; letter-spacing: -1px;}
	
	.list-wrap {margin-top: 40px;}
	.list-wrap .pack-left		{flex-wrap: wrap; gap: 40px;}
	.list-wrap .pack-left.col-3	{align-items: flex-start;}
	.list-wrap .pack-left.col-3 li	{width: calc((100% - 80px)/3);}
	
	/* ellipsis */
	.ellipsis		{display: block; overflow: hidden; text-overflow: ellipsis;
		-webkit-line-clamp: 2;
		display: -webkit-box; -webkit-box-orient: vertical;
	}
</style>
<script>
	$(function() {
		$('.chart').easyPieChart({
			animate: 2000,
			easing: 'easeOutBounce',
			barColor: '#687FE5',
			scaleColor: false,
			trackColor: '#f1f1f1',
			lineWidth: 16,
			size: 200,
		});
	});
	
	$(".chart span").counterUp({
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
				<div class="out-cont bg-gray">
					<div class="section result bg-white">
					
						<div class="card" id="resultCard">
							<p class="badge-wrap">
								<span class="badge ballon blue">약속에서 체크한</span>
							</p>
							
							<div class="pack-down-center gap-20">
								<h2 class="card-title fw-600">${sessionName}님의 점수는</h2>
							
								<div id="score" class="chart" data-percent="${dto.mbs_score}">
									<span class="point pack-left">
										<strong class="fs-32 fc-blue">${dto.mbs_score}</strong>
										<span class="fc-gray">점</span>
									</span>
								</div>
								
								<div class="fs-14 fc-gray fw-500" id="comment"></div>
							</div>
							
							<div class="button-area pack-center gap-12">
								<a class="btn blue medium r8" href="MA13">다시 테스트하기</a>
								<a class="btn blue medium r8" href="MA20">최근 설문 보기</a>
							</div>
							
						</div>
						
						<div class="list-wrap">
							<ul class="pack-left col-3">
								<c:forEach var="drug_dto" items="${list}">
									<li>
										<a href="#" class="pack-down gap-20">
											<div class="img-wrap">
												<img src="${path}/resources/images/drug_type/01.png" alt="분말">
											</div>
											
											<p class="fs-16 ellipsis">${drug_dto.dr_product}</p>
										</a>
									</li>
								</c:forEach>
							</ul>
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