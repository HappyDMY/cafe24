/* myscript.js */

function idCheckdo() {
	//아이디 중복확인
	//새창 만들기
	//window.open();//("파일명","창이름","다양한 옵션")
	window.open("idCheckForm.do","idwin","width=400, height=350");//("파일명","창이름","다양한 옵션")
	
	//새창이 출력되는 위치 지정
	var sx = palseInt(scree.width);
	var sy = palseInt(scree.height);	
	var x = (sx/2)+50;
	var y = (sy/2)-25;
	
	win.moveTo(x,y); 	
	
}//idCheck() end


function emailCheckdo() {
window.open("emailCheckForm.do","idwin","width=400, height=350");//("파일명","창이름","다양한 옵션")
	
	//새창이 출력되는 위치 지정
	var sx = palseInt(scree.width);
	var sy = palseInt(scree.height);	
	var x = (sx/2)+50;
	var y = (sy/2)-25;
	
	win.moveTo(x,y); 	
}//emailCheck end

function memberCheckdo(f) {
	//회원가입 유효성 검사-------------------------------------

	//1) 아이디 5~10 글자수
	var id = f.id.value;
	id = id.trim();
	
	if(id.length>10 || id.length<5) {
		alert("아이디는 5~10글자 사이어야 합니다");
		f.id.focus();
		return false;
	}//if end
		
	//2) 비번 5~10 글자 (숫자, 알파벳, 특수문자 포함)
	var passwd = f.passwd.value;
	passwd = passwd.trim();
	
	if(passwd.length>10 || passwd.length<5) {
		alert("비밀번호는 5~10글자 사이어야 합니다");
		f.passwd.focus();
		return false;
	}//if end
	
	//3) 비번에 특수문자가 포함되어있는지?
	var filter = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{5,10}$/;
	if (!filter.test(passwd)) {
		alert("비밀번호는 숫자, 문자, 특수문자 1개 이상 반드시 포함 /n 그리고! 특수문자는 @$!%*#?&만 가능");
		f.passwd.focus();
		return false;
	}//if end
	
	//4) 비번과 비번확인이 서로 일치하는지
	var repasswd = f.repasswd.value.trim();
	if(passwd!=repasswd) {
		alert("비밀번호 가 일치하지않아요");
		f.repasswd.focus();
		return false;
	}//if end
	
	//5) 이름 2~20 글자 이내
	var mname = f.mname.value.trim();
	if(mname.length<2 || mname.length>20) {
		alert("이름이 2~20 글자 이내여야해요");
		f.mname.focus();
		return false;
	}//if end
	
	//6) 이메일에 @ 문자 있는지

	
	//7) 직업을 선택 했는지
	var job=f.job.value;
	if (job=="0") {
		alert("직업을 선택하세요");
		return false;
	}
	return true; // 유효성 검사를 통과했으므로 memberProc.jsp 로 전송
	
	//8) (내가 추가 (전화번호 필수))	
}//memberCheck() end
