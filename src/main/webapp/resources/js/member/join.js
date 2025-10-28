/**
 * 
 */

// 중복확인
function confirmId(){
	var inputEmail  = document.joinform.mb_email;
	const ctx = window.APP_CTX || '';
	
	// alert("중복확인");
	if(!inputEmail.value){
		alert("가입할 이메일을 입력해주세요!");
		inputEmail.focus();
		return false;
	} else {
		if(!inputEmail.value.includes("@")){
			alert("이메일 형식에 맞춰 입력해주세요!");
		} else {
			// 중복확인 버튼 클릭시 컨트롤러로 url을 전달, 컨트롤러에 소스 추가
			// do로 컨트롤러 이동
			const url = `${ctx}/emailCheckAction.do?mb_email=${encodeURIComponent(inputEmail.value)}`;
			window.open(url, "confirm", "menubar=no, width=500, height=400");
		}
	}
}

// 2. join.jsp - onsubmit시 - 회원가입페이지 필수 체크
function signUpCheck() {
	// 2-1. 중복 확인 버튼 체크
	// <input type="hidden" name="hiddenUserid" value="0">
	// hiddenUserid : 중복확인 버튼 안 눌렀을 때 체크(0: 클릭안함, 1: 클릭함)
	
	// 2-2. 중복확인 버튼 클릭하지 않은 경우 "중복확인 해주세요!!" 메시지 띄운다.
	if(document.joinform.hidden_mb_email.value == 0) {
		alert("중복확인 해주세요!!");
		document.joinform.mb_email.focus();
		return false;
	}
	
	// 비밀번호 불일치
	if(document.joinform.mb_password.value != document.joinform.mb_password_re.value) {
		alert("비밀번호가 일치하지 않습니다!!");
		document.joinform.mb_password.value = "";
		document.joinform.mb_password.focus();
		return false;
	}
	
	// 비밀번호 조건 체크 (영문, 숫자, 특수문자 포함 8자 이상)
	var password = document.joinform.mb_password.value;
	var passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
	
	if (!passwordPattern.test(password)) {
		alert("비밀번호는 영문, 숫자, 특수문자를 포함하여 8자 이상이어야 합니다.");
		document.joinform.mb_password.value = "";
		document.joinform.mb_password.focus();
		return false;
	}
	
}

// 3. 사용가능한 id를 찾은 경우 = 자식창에서 부모창으로 userid값을 전달
/*
	opener : window 객체의 open() 메서드로 열린 자식창(=중복확인창)에서 부모창(=회원가입창)에 접근할 때 사용
	hiddenUserid : 	중복확인 버튼 안 눌렀을 때 체크(0: 클릭안함, 1: 클릭함)
	self.close(); 	// 자식창 닫기
*/

function setUserEmail(inputmail) {
	opener.document.joinform.mb_email.value = inputmail;
	opener.document.joinform.hidden_mb_email.value = "1";	// 중복확인창 클릭 인증
	self.close();
}