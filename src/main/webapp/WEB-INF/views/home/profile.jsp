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
<link rel="stylesheet" href="${path}/resources/css/survey/survey.css">

<!--  js -->
<script src="https://kit.fontawesome.com/d7162d59a4.js" crossorigin="anonymous"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/lib/aos.js" defer></script>
<script src="${path}/resources/js/yaksok.js" defer></script>
<script>
	// 다음 프로필 입력으로
	function nextStep(current) {
		// step validation
		if (current === 1) { // 성별
			if (!document.querySelector('input[name="gender"]:checked')) {
				alert("성별을 선택하세요!");
				return;
			}
		}
		if (current === 2) { // 나이
			const age = document.getElementById("age").value.trim();
			if (age === "" || isNaN(age)) {
				alert("나이를 숫자로 입력하세요!");
				return;
			}
		}
		if (current === 3) { // 키
			const height = document.getElementById("height").value.trim();
			if (height === "" || isNaN(height)) {
				alert("키를 숫자로 입력하세요!");
				return;
			}
		}
		if (current === 4) { // 몸무게
			const weight = document.getElementById("weight").value.trim();
			if (weight === "" || isNaN(weight)) {
				alert("몸무게를 숫자로 입력하세요!");
				return;
			}
		}

		document.getElementById("step" + current).classList.remove("active");
		document.getElementById("step" + (current + 1)).classList.add("active");
	}
	
	let selectedInterests = []; 
	let surveyData = {};       
	let currentSurveyIndex = 0;	

	// step5 완료시 선택항목 저장 + step6 설문 불러오기
	function goToSurvey() {
		selectedInterests = [...document.querySelectorAll('#step5 input:checked')].map(el => el.value);
		
		if (selectedInterests.length === 0) {
			alert("관심 영양제를 1개 이상 선택하세요!");
			return;
		}
		
		fetch("${path}/resources/json/profile.json")
			.then(res => res.json())
			.then(data => {
				surveyData = data;
				currentSurveyIndex = 0; 
				renderSurveyStep();
				nextStep(5); // step5 -> step6 이동
		  })
		  .catch(err => console.error("설문 JSON 로드 실패:", err));
	}

	// step6 설문 렌더링
	function renderSurveyStep() {
		const container = document.getElementById("survey-container");
		container.innerHTML = "";
		
		const interest = selectedInterests[currentSurveyIndex];
		if (surveyData[interest]) {
			const section = document.createElement("div");
			
			const title = document.createElement("h3");
			title.classList.add("article-type");
			title.textContent = interest;
			section.appendChild(title);
			
			const optionsDiv = document.createElement("div");
			optionsDiv.classList.add("select-options", "pack-down-center", "gap-12");
			
			surveyData[interest].forEach(item => {
				const label = document.createElement("label");
				const input = document.createElement("input");
				label.classList.add("btn", "bdr-gray", "medium");
				input.type = "checkbox";
				input.name = item.id;
				input.value = item.score;
				
				const span = document.createElement("strong");
				span.classList.add("fs-18");
				span.textContent = item.question;
				
				label.appendChild(input);
				label.appendChild(span);
				optionsDiv.appendChild(label);
			});
			
			section.appendChild(optionsDiv);
			container.appendChild(section);
			
			addCheckboxListener(interest);
		}
		
		const nextBtn = document.querySelector("#step6 button");
		if (currentSurveyIndex < selectedInterests.length - 1) {
			nextBtn.textContent = "다음";
		} else {
			nextBtn.textContent = "다음";
		}
	}

	function nextSurveyOrStep7() {
		if (currentSurveyIndex < selectedInterests.length - 1) {
			currentSurveyIndex++;
			renderSurveyStep();
		} else {
			nextStep(6); // 설문 끝 → step7
		}
	}

	// 점수 저장용 객체
	let surveyScores = {};
	let totalScore = 0;

	function addCheckboxListener(interest) {
		document.querySelectorAll(`#survey-container input[type="checkbox"]`)
			.forEach(input => {
				input.addEventListener("change", () => {
					if (!surveyScores[interest]) surveyScores[interest] = 0;
					
					if (input.checked) {
						surveyScores[interest] += parseInt(input.value);
						totalScore += parseInt(input.value);
					} else {
						surveyScores[interest] -= parseInt(input.value);
						totalScore -= parseInt(input.value);
				 }
			 });
		 });
	}

	function submitForm() {
		const profileDTO = {
			gender: document.querySelector('input[name="gender"]:checked')?.value,
			age: document.getElementById("age").value,
			height: document.getElementById("height").value,
			weight: document.getElementById("weight").value,
			interests: selectedInterests,
			surveyScores,   
			totalScore,     
			diseases: [...document.querySelectorAll('#step7 input:checked')].map(el => el.value)
		};
		
		// hidden input에 값 채우기
		document.getElementById("genderInput").value = profileDTO.gender;
		document.getElementById("ageInput").value = profileDTO.age;
		document.getElementById("heightInput").value = profileDTO.height;
		document.getElementById("weightInput").value = profileDTO.weight;
		document.getElementById("interestsInput").value = profileDTO.interests.join(",");
		document.getElementById("surveyScoresInput").value = JSON.stringify(profileDTO.surveyScores);
		document.getElementById("totalScoreInput").value = profileDTO.totalScore;
		document.getElementById("diseasesInput").value = profileDTO.diseases.join(",");
		
		document.querySelector("form").submit();
	}
	
	$(function() {
		var $all = $('#step7 .dis_chk');                // 모든 체크박스
		if ($all.length === 0) return;
		
		var $none = $all.filter('[value="none"]').first(); // '없음' 체크박스
		var $others = $all.not($none);                     // 나머지 체크박스
		
		// '없음' 변경 처리
		$none.on('change', function() {
			var checked = $(this).prop('checked');
			
			if (checked) {
				// 다른 항목이 이미 체크되어 있으면 경고 + '없음' 체크 취소
				if ($others.is(':checked')) {
					alert("다른 항목이 선택되어 있습니다. '없음'을 선택하려면 다른 항목의 선택을 먼저 해제하세요.");
					$(this).prop('checked', false);
					return;
				}
				// 다른 항목 비활성화
				$others.prop('disabled', true).closest('label').addClass('disabled');
				// (선택) 배경 등 시각처리: .css 사용 가능
				$others.closest('label').find('input').css('background', '#f5f5f5');
			} else {
				// none 해제 -> others 활성화
				$others.prop('disabled', false).closest('label').removeClass('disabled');
				$others.closest('label').find('input').css('background', 'none');
			}
		});
		
		// 다른 항목 변경 처리
		$others.on('change', function() {
			var anyChecked = $others.is(':checked');
			if (anyChecked) {
				// 하나라도 체크되면 '없음' 비활성화
				$none.prop('checked', false).prop('disabled', true).closest('label').addClass('disabled');
			} else {
				// 모두 해제되면 '없음' 활성화
				$none.prop('disabled', false).closest('label').removeClass('disabled');
			}
		});
		
		// 초기 상태 보정
		$none.trigger('change');
		$others.trigger('change');
		
		// 선택값 수집: ['없음'] 또는 체크된 값 배열 반환
		window.collectDiseases = function() {
			if ($none.prop('checked')) return ['없음'];
			return $others.filter(':checked').map(function(){ return $(this).val(); }).get();
		};
		
		// 제출 전 검증 + hidden 채우기 + submitForm() 호출
		window.validateStep7BeforeSubmit = function() {
			var noneChecked = $none.prop('checked');
			var anyOtherChecked = $others.is(':checked');
			
			// 안전검사: 동시 선택이면 차단
			if (noneChecked && anyOtherChecked) {
				alert("'없음'과 다른 항목이 동시에 선택되어 있습니다. 다른 항목의 선택을 해제해주세요.");
				return;
			}
			
			var diseases = collectDiseases();
			
			if (diseases.length === 0) {
			    // 원치 않으면 이 확인을 제거하세요 (현재는 사용자에게 확인을 요구)
				if (!confirm("기저질환이 선택되지 않았습니다. 계속 진행하시겠습니까?")) return;
			}
			
			// hidden input에 값 채우기 (콤마 구분)
			$('#diseasesInput').val(diseases.join(','));
			
			// 기존 submitForm() 있으면 호출, 없으면 가장 첫 <form>을 submit
			if (typeof submitForm === 'function') {
				submitForm();
			} else {
				var $form = $('form').first();
				if ($form.length) $form.submit();
				else alert('submitForm 함수 또는 form 요소가 없습니다.');
			}
		};
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
			<!-- SID : MA10 -->
			<div id="content" class="MA10"><!-- [D] main / sub-main / sub && pagd name -->
				<div class="bg-gray out-cont">
					<div class="article card acitve">
						<c:if test="${checkCnt != 0}">
							<script type="text/javascript">
								setTimeout(function(){
									alert("이미 프로필을 등록하였습니다. 설문 페이지로 이동합니다.")
									window.location="${path}/MA13";
								}, 1000);
							</script>
						</c:if>
						
						<!-- Step 1: 성별 -->
						<div class="card active" id="step1">
							<div class="article-header ta-c">
								<h2 class="article-title">성별을 선택하세요</h2>
							</div>
							
							<div class="select-options pack-down-center gap-12">
								<label class="btn bdr-gray medium">
									<input type="radio" name="gender" value="M">
									<strong class="fs-18">남</strong>
								</label> 
								<label class="btn bdr-gray medium">
									<input type="radio" name="gender" value="W">
									<strong class="fs-18">여</strong>
								</label>
							</div>
							
							<div class="button-area">
								<button type="button" class="btn black large" onclick="nextStep(1)">다음</button>
							</div>
						</div><!-- //.card -->
		
						<!-- Step 2: 나이 입력 -->
						<div class="card" id="step2">
							<div class="article-header ta-c">
								<h2 class="article-title">나이를 입력하세요</h2>
							</div>
							
							<label class="pack-down-center">
								<input type="text" id="age" placeholder="숫자만 입력해주세요" oninput="this.value=this.value.replace(/[^0-9]/g,'')" class="input-text large" required>
							</label>
							
							<div class="button-area">
								<button type="button" class="btn black large" onclick="nextStep(2)">다음</button>
							</div>
						</div><!-- //.card -->
		
						<!-- Step 3: 키 입력 -->
						<div class="card" id="step3">
							<div class="article-header ta-c">
								<h2 class="article-title">키를 입력하세요 (cm)</h2>
							</div>
							<label class="pack-down-center">
								<input type="text" id="height" placeholder="숫자만 입력해주세요"
									oninput="this.value=this.value.replace(/[^0-9]/g,'')" class="input-text large" required>
							</label>
							<div class="button-area">
								<button type="button" class="btn black large" onclick="nextStep(3)">다음</button>
							</div>
						</div>
		
						<!-- Step 4: 몸무게 입력 -->
						<div class="card" id="step4">
							<div class="article-header ta-c">
								<h2 class="article-title">몸무게를 입력하세요 (kg)</h2>
							</div>
							<label class="pack-down-center">
								<input type="text" id="weight" placeholder="숫자만 입력해주세요"
									oninput="this.value=this.value.replace(/[^0-9]/g,'')" class="input-text large" required>
							</label>
							<div class="button-area">
								<button type="button" class="btn black large" onclick="nextStep(4)">다음</button>
							</div>
						</div>
		
						<!-- Step 5: 관심 영양제 선택 -->
						<div class="card" id="step5">
							<div class="article-header ta-c">
								<h2 class="article-title">관심 영양제를 선택하세요</h2>
							</div>
							
							<div class="select-options pack-down-center gap-12">
								<label class="btn bdr-gray medium">
									<input type="checkbox" value="피로/간"> 
									<strong class="fs-18">피로/간</strong>
								</label> 
								<label class="btn bdr-gray medium">
									<input type="checkbox" value="체지방/혈당"> 
									<strong class="fs-18">체지방/혈당</strong>
								</label> 
								<label class="btn bdr-gray medium">
									<input type="checkbox" value="눈"> 
									<strong class="fs-18">눈</strong>
								</label> 
								<label class="btn bdr-gray medium">
									<input type="checkbox" value="뼈">
									<strong class="fs-18">뼈</strong>
								</label>
							</div>
							
							<div class="button-area">
								<button type="button" class="btn black large" onclick="goToSurvey()">다음</button>
							</div>
						</div>
		
						<!-- Step 6: 설문조사 -->
						<div class="card" id="step6">
							<div class="article-header ta-c">
								<h2 class="article-title">관심 영양제 관련 설문조사</h2>
							</div>

							<div id="survey-container">
							
							</div>
							
							<div class="button-area">
								<button type="button" class="btn black large" onclick="nextSurveyOrStep7()">다음</button>
							</div>
						</div>
		
						<!-- Step 7: 기저질환 -->
						<div class="card" id="step7">
							<div class="article-header ta-c">
						        <h2 class="article-title">기저질환을 선택하세요</h2>
						    </div>
							<div class="select-options pack-down-center gap-12">
								<label class="btn bdr-gray medium">
									<input type="checkbox" class="dis_chk" name="chk1" value="고혈압/심혈관">
									<strong class="fs-18">고혈압/심혈관</strong>
								</label>
								<label class="btn bdr-gray medium">
									<input type="checkbox" class="dis_chk" name="chk2" value="당뇨">
									<strong class="fs-18">당뇨</strong>
								</label>
								<label class="btn bdr-gray medium">
									<input type="checkbox" class="dis_chk" name="chk3" value="골다공증/관절">
									<strong class="fs-18">골다공증/관절</strong>
								</label>
								<label class="btn bdr-gray medium">
									<input type="checkbox" class="dis_chk" name="chk4" value="위장질환">
									<strong class="fs-18">위장질환</strong>
								</label>
								<label class="btn bdr-gray medium">
									<input type="checkbox" class="dis_chk" name="chk5" value="none">
									<strong class="fs-18">없음</strong>
								</label>
							</div>
							<div class="button-area">
						        <button type="button" class="btn black large" onclick="submitForm()">다음</button>
						    </div>
						</div>
						
						<!-- 프로필 입력 받은값들 JS에서 받아와서 넘기기 -->
						<form id="profileForm" action="MA11" method="post">
							<input type="hidden" name="gender" id="genderInput">
							<input type="hidden" name="age" id="ageInput">
							<input type="hidden" name="height" id="heightInput">
							<input type="hidden" name="weight" id="weightInput">
							<input type="hidden" name="interests" id="interestsInput">
							<input type="hidden" name="surveyScores" id="surveyScoresInput">
							<input type="hidden" name="totalScore" id="totalScoreInput">
							<input type="hidden" name="diseases" id="diseasesInput">
						</form>
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
	
	<%@ include file="../common/loading.jsp" %><!-- 약속 로딩 -->
	<!-- === Chatbot Widget === -->
	<%@ include file="../common/chat-widget.jspf" %>
</body>
</html>