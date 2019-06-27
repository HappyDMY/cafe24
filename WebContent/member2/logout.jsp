<%@ page contentType="text/html; charset=UTF-8"%>

<%
//logout.jsp
session.removeAttribute("s_id");
session.removeAttribute("s_passwd");

response.sendRedirect("loginform.do");
%>