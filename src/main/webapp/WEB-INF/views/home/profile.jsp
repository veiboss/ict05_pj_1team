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
		width: 480px;
		background: white;
		border-radius: 16px;
		box-shadow: 0 4px 12px rgba(0,0,0,0.1);
		padding: 24px;
		text-align: center;
		display: none;
		margin: auto;
		max-width: 90%;  /* 반응형 대응 */
	}
	.card.active {
		display: block;
	}
	h2 {
		font-size: 20px;
		margin-bottom: 20px;
	}
	.options {
		display: flex;
		flex-direction: column;
		gap: 10px;
	}
	.options label {
		display: block;
		background: var(--mostly-white);
		padding: 10px;
		border-radius: 8px;
		cursor: pointer;
		transition: 0.2s;
	}
	.options label:hover {
		background: #e3e6eb; /* This color is not in the variables */
	}
	button {
		margin: auto;
	}
	
/* 	#survey-container label {
		display: block;
		margin: 6px 0;
		background: var(--mostly-white);
		padding: 8px;
		border-radius: 6px;
		text-align: left;
		color: black;
		font-size: 14px;
		line-height: 1.4;
		white-space: normal;
		word-break: keep-all;
		overflow-wrap: break-word;
	}
	#survey-container input[type="checkbox"] {
		margin-right: 8px;
	}
	#survey-container h3 {
		margin: 15px 0 10px;
		font-size: 16px;
		font-weight: bold;
		color: black;
	} */
</style>
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
			title.textContent = interest;
			section.appendChild(title);
			
			const optionsDiv = document.createElement("div");
			optionsDiv.classList.add("select-options", "r4");
			
			surveyData[interest].forEach(item => {
				const label = document.createElement("label");
				const input = document.createElement("input");
				input.type = "checkbox";
				input.name = item.id;
				input.value = item.score;
				
				const span = document.createElement("span");
				span.classList.add("btn", "medium", "r4");
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
					<h2>성별을 선택하세요</h2>
					<div class="select-options r4">
						<label>
							<input type="radio" name="gender" value="M">
								<span class="btn medium r4">남</span>
						</label> 
						<label><input type="radio" name="gender" value="W">
								<span class="btn medium r4">여</span>
						</label>
					</div>
					<br>
					<button type="button" class="btn blue medium" onclick="nextStep(1)">다음</button>
				</div>

				<!-- Step 2: 나이 입력 -->
				<div class="card" id="step2">
					<h2>나이를 입력하세요</h2>
					<label class="textarea">
						<input type="text" id="age" placeholder="숫자만 입력해주세요"
							oninput="this.value=this.value.replace(/[^0-9]/g,'')" required>
					</label>
					<br>
					<button type="button" class="btn blue medium" onclick="nextStep(2)">다음</button>
				</div>

				<!-- Step 3: 키 입력 -->
				<div class="card" id="step3">
					<h2>키를 입력하세요 (cm)</h2>
					<label class="textarea">
						<input type="text" id="height" placeholder="소수점은 빼고 입력해주세요"
							oninput="this.value=this.value.replace(/[^0-9]/g,'')" required>
					</label>
					<br>
					<button type="button" class="btn blue medium" onclick="nextStep(3)">다음</button>
				</div>

				<!-- Step 4: 몸무게 입력 -->
				<div class="card" id="step4">
					<h2>몸무게를 입력하세요 (kg)</h2>
					<label class="textarea">
						<input type="text" id="weight" placeholder="몸무게를 입력하세요 (kg)"
							oninput="this.value=this.value.replace(/[^0-9]/g,'')" required>
					</label>
					<br>
					<button type="button" class="btn blue medium" onclick="nextStep(4)">다음</button>
				</div>

				<!-- Step 5: 관심 영양제 선택 -->
				<div class="card" id="step5">
					<h2>관심 영양제를 선택하세요</h2>
					<div class="select-options r4">
						<label><input type="checkbox" value="피로/간"> 
							<span class="btn medium r4">피로/간</span>
						</label> 
						<label><input type="checkbox" value="체지방/혈당"> 
							<span class="btn medium r4">체지방/혈당</span>
						</label> 
						<label><input type="checkbox" value="눈"> 
							<span class="btn medium r4">눈</span>
						</label> 
						<label><input type="checkbox" value="뼈">
							<span class="btn medium r4">뼈</span>
						</label>
					</div>
					<br>
					<button type="button" class="btn blue medium" onclick="goToSurvey()">다음</button>
				</div>

				<!-- Step 6: 설문조사 -->
				<div class="card" id="step6">
					<h2>관심 영양제 관련 설문조사</h2>
					<div id="survey-container">
					
					</div>
					<br>
					<button type="button" class="btn blue medium" onclick="nextSurveyOrStep7()">다음</button>
				</div>

				<!-- Step 7: 기저질환 -->
				<div class="card" id="step7">
					<h2>기저질환을 선택하세요</h2>
					<div class="select-options r4">
						<label><input type="checkbox" value="고혈압/심혈관">
							<span class="btn medium r4">고혈압/심혈관</span>
						</label> 
						<label><input type="checkbox" value="당뇨">
							<span class="btn medium r4">당뇨</span>
						</label> 
						<label><input type="checkbox" value="골다공증/관절">
							<span class="btn medium r4">골다공증/관절</span>
						</label> 
						<label><input type="checkbox" value="위장질환">
							<span class="btn medium r4">위장질환</span>
						</label> 
						<label><input type="checkbox" value="">
							<span class="btn medium r4">없음</span>
						 </label>
					</div>
					<br>
					<button type="button" class="btn blue medium" onclick="submitForm()">다음</button>
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