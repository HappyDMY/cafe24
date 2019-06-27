<%@ page contentType="text/html; charset=UTF-8"%>

<%
//logout.jsp
session.removeAttribute("s_id");
session.removeAttribute("s_passwd");
session.removeAttribute("s+mlevel");

//response.sendRedirect("loginForm.jsp");
%>
<script>
	alert("관리자 페이지 로그아웃");
	location.href = "adminLogin.jsp";
</script>