/**
 * 	수정할 것
 */

// 회원가입, 수정시 이메일 체크
function modify_selectEmailChk() {
	if(document.modifyform.user_email3.value != 0 ) {
		document.modifyform.user_email2.value = document.modifyform.user_email3.value;
		return false;
	} else {
		document.modifyform.user_email2.value="";
		document.modifyform.user_email2.focus();
		return false;
	}
}

// 2. join.jsp - onsubmit시 - 회원가입페이지 필수 체크
function modifyCheck() {
	// 비밀번호 불일치
	if(document.modifyform.user_password.value != document.modifyform.re_user_password.value) {
			alert("비밀번호가 일치하지 않습니다!!");
			document.modifyform.re_user_password.value = "";
			document.modifyform.re_user_password.focus();
			return false;
	}
} 