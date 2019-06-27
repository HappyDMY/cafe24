<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 loginForm.jsp -->
<h3>* 로 그 인 *</h3>
<c:if test="${empty s_id }">
<form name="loginFrm" method="post" action="./loginproc.do" onsubmit="return loginCheck(this)">
  <table style="text-align: center; margin: auto; color: black">
  <tr>
      <td>
          <input type="text" name="id" id="id" value="${c_id}" placeholder="아이디" required>
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
              아이디저장<input type="checkbox"  name="c_id" value="SAVE" <c:if test="${!empty c_id }"><c:out value="checked"></c:out> </c:if>/>
              
              &nbsp;&nbsp;
              <a href="agreement.do">회원가입</a>
              &nbsp;&nbsp;
              <a href="forgot.jsp"> 아이디/비번찾기</a>
          </p>
      </td>  
  </tr>
  </table>    
</form>         
</c:if>
<c:if test="${s_id!=null }">
${msg }
</c:if>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>