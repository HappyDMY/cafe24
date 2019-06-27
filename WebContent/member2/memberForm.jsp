<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 memberForm.jsp-->
<style>
<!--
th{
	color:white;
	text-align: center;
}
-->
</style>
* 회/원/가/입 *<br><br>
<form name="regForm"
      method="post"
      action="memberProc.jsp"
      onsubmit="return memberCheckdo(this)" >
<span style="color:red; font-weight: bold">* 필수입력</span>
<br>
<table style="margin: auto; color: black; " class="table-hover list table-bordered table-condensed">
<tr>
	<th>*아이디</th>
	<td>
      <input type="text" name="id" id="id" size="15"  readonly>
      <input type="button" value="ID중복확인"  onclick="idCheckdo()">	
	</td>
</tr>
<tr>
	<th>*비밀번호</th>
	<td><input type="password" name="passwd" id="passwd" size="15" required></td>
</tr>
<tr>
	<th>*비밀번호 확인</th>
	<td><input type="password" name="repasswd" id="repasswd" size="15" required></td>
</tr>
<tr>
	<th>*이름</th>
	<td><input type="text" name="mname" id="mname" size="15" required></td>
</tr>
<tr>
	<th>*이메일</th>
	<td>
      <input type="text" name="email" id="email" size="30" readonly>
      <input type="button" value="Email 중복확인"  onclick="emailCheckdo()">	
	</td>
</tr>
<tr>
	<th>전화번호</th>
	<td><input type="text" name="tel" id="tel" size="15"></td>
</tr>
<tr>
	<th>우편번호</th>
	<td>
      <input type="text" name="zipcode" id="zipcode" size="7"  readonly>
      <input type="button" value="주소찾기"  onclick="DaumPostcode()">	
	</td>
</tr>
<tr>  
  <th>주소</th>
  <td><input type="text" name="address1" id="address1" size="45" readonly></td>
</tr>
<tr>  
  <th>나머지주소</th>
  <td><input type="text" name="address2" id="address2" size="45"></td>
</tr>
<tr>  
  <th>직업</th>
  <td><select name="job"  id="job">
          <option value="0">선택하세요.</option>
          <option value="A01">회사원</option>
          <option value="A02" selected>전산관련직</option>
          <option value="A03">학생</option>
          <option value="A04">주부</option>
          <option value="A05">기타</option>
        </select>
  </td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="회원가입"/>
		<input type="reset"  value="취소" />
	</td>
</tr>
</table>

<!-- ----- DAUM 우편번호 API 시작 ----- -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
    
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
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->

</form>

<!-- 본문 끝 -->			
<%@ include file="../footer.jsp"%>