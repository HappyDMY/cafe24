<%@page import="java.awt.Window"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../adminAuth.jsp"%>
<%@include file="../../member/ssi.jsp"%>

<%
String id =request.getParameter("id").trim();
String mlevel =request.getParameter("mlevel").trim();

int res = dao.updateMlevel(id, mlevel);


if(res==0){
	out.print("<p>변경 실패</p>");		
	out.print("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
}else{	
//	out.print("<p>변경 성공</p> ");
//	out.print("<p><a href='memLevel.jsp'>[리스트로 돌아가기]</a></p> ");
	out.print("<script>");
	out.print("alert('변경 성공');");
	out.print("location.href='memLevel.jsp';");
	out.print("</script>");
	//=response.sendRddirect("memLevel.jsp");
	//=
			
}// if end

%>
