/* myscript.js */


function bbsCheck(f) { // 게시판 유효성 검사
	//1) 작성자, 제목, 내용 2글자 이상인지
	var wname = f.wname.value;
	wname = wname.trim();
	if (wname.length==0) {
		alert("작성자를 입력해주세요");
		f.wname.focus;
		return false;
	}
	//2) 비밀번호
	var passed = f.passed.value;
	passed = passed.trim();
	if (passed.length<4) {
		alert("비밀번호를 4자 이상 입력해 주세요");
		f.passed.focus;
		return false;
	}//비번길이설정끝
	
	return true;	
	//3)
	//4)
}// function end


//f.action = file;
//f.submit();
function pwDELCheck(addr) { 	
	//2) 비밀번호가 입력되었는지 확인
	var f =  document.getElementById('pwform');
	var passwd =  f.passwd.value;
	passed = passwd.trim();
	if (passed.length<4) {
		alert("비밀번호를 4자 이상 입력해 주세요");
		f.passed.focus();
		return false;
	}//비번길이끝
	var msg = "진행된 내용은 복구되지 않습니다 \n계속 진행하시겠습니가?";
	if(confirm(msg)){	
		f.action = addr;
		f.submit();
	} else {
		return false;
	}
	
	return true;	
}// pwcheck end

function pwUPCheck(addr) { 	
	//2) 비밀번호가 입력되었는지 확인
	var f =  document.getElementById('pwform');
	var passwd =  f.passwd.value;
	passed = passwd.trim();
	if (passed.length<4) {
		alert("비밀번호를 4자 이상 입력해 주세요");
		f.passed.focus();
		//return false;
	}//비번길이끝
	
	var msg = "진행된 내용은 복구되지 않습니다 \n계속 진행하시겠습니가?";
	if(confirm(msg)){	
		f.action = addr;
		f.submit();
	}
	
}// pwcheck end

function searchCheck(f) {
	var word = f.word.value;
	word = word.trim();
	if (word.length==0) {
		alert("검색어를 입력하세요");
		return false;
	}
	return true;
	
}// searchCheck() end

function idCheck() {
	//아이디 중복확인
	//새창 만들기
	//window.open();//("파일명","창이름","다양한 옵션")
	window.open("idCheckForm.jsp","idwin","width=400, height=350");//("파일명","창이름","다양한 옵션")
	
	//새창이 출력되는 위치 지정
	var sx = palseInt(scree.width);
	var sy = palseInt(scree.height);	
	var x = (sx/2)+50;
	var y = (sy/2)-25;
	
	win.moveTo(x,y); 	
	
}//idCheck() end


function emailCheck() {
window.open("emailCheckForm.jsp","idwin","width=400, height=350");//("파일명","창이름","다양한 옵션")
	
	//새창이 출력되는 위치 지정
	var sx = palseInt(scree.width);
	var sy = palseInt(scree.height);	
	var x = (sx/2)+50;
	var y = (sy/2)-25;
	
	win.moveTo(x,y); 	
}//emailCheck end

function memberCheck(f) {
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

function loginCheck(f) {
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
	
}// loginCheck end

function pdsCheck(f) {
	//포토 갤러리 유효성 검사
	//1) 이름
	
	//2) 제목
	
	//3) 비밀번호
	
	//4) 첨부파일
	//문) 첨부파일의 확장명을 출력하시오
	//		예) png, gif, jpg

	var filename = f.filename.value.trim();	
	if (filename.length<5) {
		alert("첨부파일을 선택하세요");
		return false;
	}
	var i = f.filename.value.lastIndexOf(".");
	var extention = filename.substring(i);
	
	extention.toLowerCase();// 소문자로 변환하는 함수
	if (!(extention==".png"||extention==".jpg"||extention==".gif")) {
		alert("이미지파일만 가능 합니다.");
		return false;
	}
	return true;
}//pdsCheck end

function pdsChecku(f) {
	//포토 갤러리 유효성 검사
	//1) 이름
	
	//2) 제목
	
	//3) 비밀번호
	
	//4) 첨부파일
	//문) 첨부파일의 확장명을 출력하시오
	//		예) png, gif, jpg

	var i = f.filename.value.lastIndexOf(".");
	var extention = filename.substring(i);
	
	extention.toLowerCase();// 소문자로 변환하는 함수
	if (!(extention==".png"||extention==".jpg"||extention==".gif")) {
		alert("이미지파일만 가능 합니다.");
		return false;
	}
	return true;
}//pdsCheck end
