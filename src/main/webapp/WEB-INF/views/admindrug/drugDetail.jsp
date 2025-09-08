<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<title>약쏙 관리자</title>
<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/yaksokAd.css">

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바스크립트를 실행한다. 페이지가 모두 로드된 후에 해당 외부 스크립트가 실행된다. -->
<script src="${path}/resources/js/yaksokAd.js" defer></script>
<script>
function validateForm() {
    const requiredFields = [
        { id: "dr_product", label: "제약명" },
        { id: "dr_enterprise", label: "업체명" },
        { id: "dr_statement_id", label: "품목번호" },
        { id: "dr_expiration_date", label: "유통기한" },
        { id: "dr_sungsang", label: "성상" }
    ];

    for (let field of requiredFields) {
        const value = document.getElementById(field.id).value.trim();
        if (value === "") {
            alert(field.label + "을(를) 입력해주세요!");
            document.getElementById(field.id).focus();
            return false; // 전송 막기
        }
    }

    return true; // 전송 허용
}
</script>
</head>
<body>
	<div class="skip-nav"><a href="#content">본문 바로가기</a></div>

	<div id="wrap" class="frame">
		<!-- menu 시작 -->
		<%@ include file="../admin/aside.jsp" %>
		<!-- menu 끝 -->
		
		<!-- header 시작 -->
		<%@ include file="../admin/header.jsp" %>
		<!-- header 끝 -->
		
		<div id="container" class="container">
		<!-- 컨텐츠 시작 -->
				<div class="title-bar">
					<h2 class="page-title ellipsis">
						영양제(관리자) 등록
					</h2>
				</div>
				<main id="content">
					<div class="write-form box-wrap">
						<form action="${path}/drugModify.ad" onsubmit="return validateForm();">
							<fieldset class="pack-down gap-12">
								<legend class="blind">기본 정보</legend>
								<input type="hidden" name="dr_id" value="${dto.dr_id}">
								<div class="row">
									<div class="field pack-down">
										<label class="label medium required warning" for="dr_product">제약명*</label>
										<div class="insert">
											<input type="text" name="dr_product" id="dr_product" class="input-text large" title="제약명" placeholder="예)올인원 멀티비타민 코어" value="${dto.dr_product}">
										</div>
									</div>
								</div>
								<div class="row-2">
									<div class="field col pack-down">
										<label class="label medium required warning" for="dr_enterprise">업체명*</label>
										<div class="insert">
											<input type="text" name="dr_enterprise" id="dr_enterprise" class="input-text medium" title="업체명" placeholder="예)주식회사 노바렉스" value="${dto.dr_enterprise}">
										</div>
									</div>

									<div class="field col pack-down">
										<label class="label medium required warning" for="dr_statement_id">품목번호*</label>
										<div class="insert">
											<input type="text" name="dr_statement_id" id="dr_statement_id" class="input-text medium" title="품목번호" placeholder="예)200400200083249" value="${dto.dr_statement_id}">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="field pack-down">
										<label class="label medium required warning" for="dr_expiration_date">유통기한*</label>
										<div class="insert">
											<input type="text" name="dr_expiration_date" id="dr_expiration_date" class="input-text medium" title="유통기한" placeholder="예)제조일로부터 24개월" value="${dto.dr_expiration_date}">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="field pack-down">
										<label class="label medium warning" for="dr_sungsang">성상*</label>
										<div class="insert">
											<textarea class="textarea medium" rows="4" cols="50" name="dr_sungsang" placeholder="예) [칼마디정제] 고유의 향미가 있고 이미·이취가 없는 점박이를 포함한 분홍빛 하얀색의 투명 장방형 정제 [멀티비타민정제] 고유의 향미가 있고 이미·이취가 없는 점박이를 포함한 연한 노란 주황색의 투명 장방형 제피 정제 [루테인지아잔틴 연질캡슐] 고유의 향미가 있고 이미·이취가 없는 적갈색의 점도가 있는 내용물을 함유한 갈흑색의 타원형 연질캡슐 [오메가3 연질캡슐] 고유의 향미가 있고 이미·이취가 없는 연한 노란 연두의 점도가 있는 내용물을 함유한 투명의 장방형 연질캡슐">${dto.dr_sungsang}</textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="field pack-down">
										<label class="label medium" for="dr_serve_use">용도</label>
										<div class="insert">
											<textarea class="textarea medium" rows="4" cols="50" name="dr_serve_use" placeholder="예) 1일 1회, 1회 1포(1포 : 칼마디정제 1100mg X 1T, 멀티비타민정제 1100mg X 1T, 루테인지아잔틴 연질캡슐 400mg X 1C, 오메가3 연질캡슐 760mg X 1C)를 물과 함께 섭취하십시오.">${dto.dr_serve_use}</textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="field pack-down">
										<label class="label medium" for="dr_intake_hint">주의사항</label>
										<div class="insert">
											<textarea class="textarea medium" rows="4" cols="50" name="dr_intake_hint" placeholder="예)특정질환, 특이체질, 알레르기체질, 임산부의 경우에는 간혹 개인에 따라 과민반응이 나타날 수 있으므로 원료를 확인하시고, 섭취전에 전문가와 상담하시기 바랍니다.
제품 개봉 또는 섭취 시 포장재에 의해 다칠 우려가 있으니 주의하시기 바랍니다.
이상사례 발생 시 섭취를 중단하고 전문가와 상담할 것
[비타민 D] 고칼슘혈증이 있거나 의약품 복용 시 전문가와 상담할 것
[비타민 K] 항응고제 등 복용 시 전문가와 상담할 것">${dto.dr_intake_hint}</textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="field pack-down">
										<label class="label medium" for="dr_main_function">기능</label>
										<div class="insert">
											<textarea class="textarea medium" rows="4" cols="50" name="dr_main_function" placeholder="예)[칼슘]  뼈와 치아 형성에 필요, 신경과 근육 기능 유지에 필요, 정상적인 혈액응고에 필요, 골다공증발생 위험 감소에 도움을 줌
[마그네슘] 에너지 이용에 필요, 신경과 근육 기능 유지에 필요
[망간]  뼈 형성에 필요, 에너지 이용에 필요, 유해산소로부터 세포를 보호하는데 필요
[비타민 D] 칼슘과 인이 흡수되고 이용되는데 필요, 뼈의 형성과 유지에 필요, 골다공증발생 위험 감소에 도움을 줌">${dto.dr_main_function}</textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="field pack-down">
										<label class="label medium" for="dr_preservation">보관법</label>
										<div class="insert">
											<textarea class="textarea medium" rows="4" cols="50" name="dr_preservation" placeholder="예)1. 고온다습한 곳과 직사광선을 피하여 습기가 적고 건조한 곳에 보관하십시오. 2. 개봉 후에는 공기의 노출을 최대한 차단하여 보관하십시오. 3. 영유아 및 어린이의 손에 닿지 않는 곳에 보관하십시오. 4. 온도 및 습도 등의 변화에 의해 캡슐이 붙는 현상이 발생될 수 있으나, 품질에 이상이 없으니 안심하고 섭취하십시오.">${dto.dr_preservation}</textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="field pack-down">
										<label class="label medium" for="dr_base_standard">규격</label>
										<div class="insert">
											<textarea class="textarea medium" rows="4" cols="50" name="dr_base_standard" placeholder="예)[칼마디정제]
1. 성상 : 고유의 향미가 있고 이미·이취가 없는 점박이를 포함한 분홍빛 하얀색의 투명 장방형 정제
2. 칼슘 : 표시량(210mg/3360mg)의 80~150%

[멀티비타민정제]
1. 성상 : 고유의 향미가 있고 이미·이취가 없는 점박이를 포함한 연한 노란 주황색의 투명 장방형 제피 정제
2. 실리마린 : 표시량(130mg/3360mg)의 80~120%
3. 비타민C : 표시량(100mg/3360mg)의 80~150%


[루테인지아잔틴 연질캡슐]
1. 성상 : 고유의 향미가 있고 이미·이취가 없는 적갈색의 점도가 있는 내용물을 함유한 갈흑색의 타원형 연질캡슐
2. 루테인 : 표시량(16.779mg/3360mg)의 80~120%
3. 총 지아잔틴 : 표시량(3.221mg/3360mg)의 80~120%
4. 코엔자임Q10 : 표시량(100mg/3360mg)의 80~120%
5. 아스타잔틴 : 표시량(6mg/3360mg)의 80~120%


[오메가3 연질캡슐]
1. 성상 : 고유의 향미가 있고 이미·이취가 없는 연한 노란 연두의 점도가 있는 내용물을 함유한 투명의 장방형 연질캡슐
2. EPA와 DHA의 합 : 표시량(600mg/3360mg)의 80~120%
3. 납(mg/kg) : 3.0 이하
4. 카드뮴(mg/kg) : 1.0 이하
5. 수은(mg/kg) : 0.5 이하
6. 대장균군 : 음성
7. 붕해 : 20분 이내">${dto.dr_base_standard}</textarea>
										</div>
									</div>
								</div>
								
								<div class="button-area pack-center mo-pack-down">
									<button type="submit" class="btn large color1">저장</button>
									<a class="btn large bdr-color1" href="${path}/drug.ad">취소</a>
									<a class="btn large bdr-color1" href="${path}/drugDelete.ad?dr_id=${dto.dr_id}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
								</div>
							</fieldset>
						</form>
					</div><!--.write-form -->
				</main>
			
			<!-- 컨텐츠 끝 -->
			<!-- footer 시작 -->
			<%@ include file="../admin/footer.jsp" %>
			<!-- footer 끝 -->
		</div><!-- // #container  -->
	</div><!-- // #wrap  -->
</body>
</html>