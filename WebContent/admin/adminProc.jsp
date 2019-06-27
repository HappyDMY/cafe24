<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../member/ssi.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>adminProc.jsp</title>
</head>
<body>
<div align="center">
<h3>관리자 페이지 로그인 결과</h3>
<%
String adminid =request.getParameter("adminid").trim();
String adminpw =request.getParameter("adminpw").trim();
String mlevel=dao.login(adminid, adminpw);
if(mlevel==null){
	out.print("<p>아이디와 비밀번호를 확인해주세요</p>");		
	out.print("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
}else{
	//로그인 성공하더라도 A1, B1 등급만 관리자페이지 입장 가능	
	
	if(mlevel.equals("A1")||mlevel.equals("B1")){
		session.setAttribute("s_admin_id", adminid);
		session.setAttribute("s_admin_pw", adminpw);
		session.setAttribute("s_admin_mlevel", mlevel);				
		response.sendRedirect("adminStart.jsp");
	}else if(mlevel.equals("C1")||mlevel.equals("D1")) {
		out.println("<p>등업후 로그인 가능</p>");
		out.println("<p><a href='javascript:history.back()'>[돌아가기]</a></p>");
		
	}else{
		out.println("<p>관리자 페이지 입장 불가</p>");
		out.println("<p><a href='javascript:history.back()'>[돌아가기]</a></p>");		
	}
}// if end

%>

</div>
</body>
</html>