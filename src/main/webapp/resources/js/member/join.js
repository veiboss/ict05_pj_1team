/**
 * 
 */

// 중복확인
function confirmId(){
	var inputEmail  = document.joinform.mb_email;
	
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
			let url = "/ict05/emailCheckAction.do?mb_email=" + inputEmail.value;
			window.open(url, "confirm", "menubar=no, width=500, height=400");
		}
	}
}

// 아이디 중복확인 버튼 클릭시
// 1. 아이디 중복확인 페이지 open
function emailChk() {
	var inputEmail = document.joinform.mb_email;
	
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
			modalOpen('#alertSignIn');
			let url = "/ict05/emailCheckAction.do?mb_email=" + inputEmail.value;
			load(url);
		}
	}
}

// 팝업안에 url 로딩
function load(url) {
	alert("load~~");
	sendRequest(loadPop_callback, url, "post", "");
}

function loadPop_callback(){
	let result = document.getElementById("emailCheckWrap");
	if(httpRequest.readyState == 4) {	//4 : completed = > 전체 데이터 취득 완료
		if(httpRequest.status == 200) {		//200 : 정상종료
			// 6-1. 응답결과가 html이면 responseText로 받고, xml이면 responseXML로 받는다.
			result.innerHTML = httpRequest.responseText;
		} 
		else {
			result.innerHTML = "state 상태:" + httpRequest.status;
		}
	}
	else {
		result.innerHTML = "readyState 상태:" + httpRequest.readyState;
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