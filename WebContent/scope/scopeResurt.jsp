<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>scopeResult.jsp</title>
</head>
<body>
  <h3>웹 페이지의 scope(유효범위)</h3>
<%
	//출력 
	out.println("1) pageContext 영역 	:"+pageContext.getAttribute("kor")+"<br />");
	out.println("2) request 영역 			: "+request.getAttribute("eng")+"<br />");
	out.println("3) session 영역 			: "+session.getAttribute("mat")+"<br />");
	out.println("4) application 영역 		: "+application.getAttribute("uname")+"<br />");
/*
	

	//----------------------------------------------
	/*
	//request.getAttribute(""); 와 request.getParameter("");
	request.setAttribute("aver", 85);
	int aver = (int)request.getAttribute("aver");	
	
	//http://172.16.10.16:9090/myweb/test.jsp?aver=70	
	int aver1 = (int)request.getParameter("web sever(tomcat)");	
	*/
	//------------------------------------------
	
	/*
		-페이지 이동
		1) <a href=""></a>
		2) <form action=""></form>
		3) location.href=""
		4) <jsp:forward page=""></jsp:forward>
		5) response.sendRedirect("")
	*/
%>  

</body>
</html>