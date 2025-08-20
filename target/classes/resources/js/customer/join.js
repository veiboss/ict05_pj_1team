/**
 * 
 */

// 회원가입, 수정시 이메일 체크
function selectEmailChk() {
	if(document.joinform.user_email3.value != 0 ) {
		document.joinform.user_email2.value = document.joinform.user_email3.value;
		return false;
	} else {
		document.joinform.user_email2.value="";
		document.joinform.user_email2.focus();
		return false;
	}
}

// 아이디 중복확인 버튼 클릭시
// 1. 아이디 중복확인 페이지 open
function confirmId() {
	// alert("중복확인");
	if(!document.joinform.user_id.value) {
		alert("아이디를 입력하세요!!");
		document.joinform.user_id.focus();
		return false;
	} 
	// 중복확인 버튼 클릭시 컨트롤러로 url을 전달, 컨트롤러에 소스 추가
	let url="/spring_pj_ict05/idConfirmAction.do?user_id=" + document.joinform.user_id.value;
	window.open(url, "confirm", "menubar=no, width=500, height=400");
	
}

// 2. join.jsp - onsubmit시 - 회원가입페이지 필수 체크
function signInCheck() {
	// 2-1. 중복 확인 버튼 체크
	// <input type="hidden" name="hiddenUserid" value="0">
	// hiddenUserid : 중복확인 버튼 안 눌렀을 때 체크(0: 클릭안함, 1: 클릭함)
	
	// 2-2. 중복확인 버튼 클릭하지 않은 경우 "중복확인 해주세요!!" 메시지 띄운다.
	if(document.joinform.hiddenUserid.value == 0) {
			alert("중복확인 해주세요!!");
			document.joinform.dubChk.focus();
			return false;
	}
	// 비밀번호 불일치
	if(document.joinform.user_password.value != document.inputform.re_user_password.value) {
			alert("비밀번호가 일치하지 않습니다!!");
			document.joinform.re_user_password.value = "";
			document.joinform.re_user_password.focus();
			return false;
	}
	
} 

// 3. 사용가능한 id를 찾은 경우 = 자식창에서 부모창으로 userid값을 전달
/*
	opener : window 객체의 open() 메서드로 열린 자식창(=중복확인창)에서 부모창(=회원가입창)에 접근할 때 사용
	hiddenUserid : 	중복확인 버튼 안 눌렀을 때 체크(0: 클릭안함, 1: 클릭함)
	self.close(); 	// 자식창 닫기
*/
function setUserid(userid) {
	// alert(userid);
	opener.document.joinform.user_id.value = userid;
	opener.document.joinform.hiddenUserid.value = "1";	// 중복확인창 클릭 인증
	self.close();
}