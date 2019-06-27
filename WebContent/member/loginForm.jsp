<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="auth.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 loginForm.jsp -->
<h3>* 로 그 인 *</h3>
<% if( s_id.equals("guest")||s_mlevel.equals("guest") ||s_passwd.equals("guest")){
	//로그인을 하지 않은 경우
	//쿠키값 가져오기------------------
	Cookie[] cookies = request.getCookies();
	String c_id="";
	if(cookies!=null){//쿠키가 존재하면 true
		for(int i=0; i<cookies.length; i++){
			Cookie cookie = cookies[i];
			if(cookie.getName().equals("c_id")==true){//쿠키변수 c_id가 있smswl
				c_id = cookie.getValue();
			}
		}//for end
	}//if end
	//---------------------------
%>

<form name="loginFrm" method="post" action="loginProc.jsp" onsubmit="return loginCheck(this)">
  <table style="text-align: center; margin: auto; color: black">
  <tr>
      <td>
          <input type="text" name="id" id="id" value="<%=c_id %>" placeholder="아이디" required>
      </td>  
      <td rowspan="2">
      	  <input type="image" src="../images/bt_login.gif" style="cursor:pointer">
      </td>		
  </tr>
  <tr>
      <td>
          <input type="password" name="passwd" id="passwd" placeholder="비밀번호" required>
      </td>  
  </tr>
  <tr>
      <td colspan="2">
          <p>
              아이디저장<input type="checkbox"  name="c_id" value="SAVE" <%if( !(c_id.isEmpty()) ){out.println("checked"); } %>/>
              
              &nbsp;&nbsp;
              <a href="agreement.jsp">회원가입</a>
              &nbsp;&nbsp;
              <a href="forgot.jsp"> 아이디/비번찾기</a>
          </p>
      </td>  
  </tr>
  </table>    
</form>         
<%
}else{
	//로그인 성공시
	out.println("<strong>" + s_id+"</strong>");
	out.println("<a href='logout.jsp'>[로그아웃]</a>");
	out.println("<br />");
	out.println("<br />");
	out.println("<a href='memberUpdate.jsp'>[회원정보수정]</a>");
	//out.println("<a href=''>[회원탈퇴]</a>");
	out.println("<br />");
		
}//if end
%>


<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>