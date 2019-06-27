<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="auth.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->

<%
String passwd =  request.getParameter("passwd");
if(passwd.equals(s_passwd)){
	out.print("<script>");
	out.print("location.href='memberUpdateForm.jsp';");
	out.print("</script>");
	
}else{
	out.print("<p>비밀번호가 일치하지 않습니다.</p>");
	out.print(s_passwd);
	out.print("<br />");
	out.print(passwd);
	out.print("<p><a href='javascript:history.back();''>[다시시도]</a></p>");	
}


%>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>